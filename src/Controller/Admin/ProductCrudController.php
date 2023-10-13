<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\QueryBuilder;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\KeyValueStore;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;

class ProductCrudController extends AbstractCrudController
{
    public function __construct(
        private EntityManagerInterface $entityManager,
        private AdminUrlGenerator $adminUrlGenerator,
        private FlashBagInterface $flashBag
    )
    {
    }

    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        $showOnWebsite = Action::new('view')
            ->linkToUrl(function (Product $product){
                return $this->generateUrl('product_show', [
                    'slug' => $product->getSlug()
                ]);
            })
            ->setIcon('fas fa-globe')
            ->setLabel('View on website')
            ->setHtmlAttributes([
                'target' => '_blank'
            ]);

        $duplicate = Action::new('duplicate')
            ->linkToCrudAction('duplicateProduct')
            ->setIcon('fas fa-copy');

        return $actions
            ->add(Crud::PAGE_INDEX, $showOnWebsite)
            ->add(Crud::PAGE_INDEX, $duplicate)
            ->add(Crud::PAGE_DETAIL, $showOnWebsite)
            ->add(Crud::PAGE_DETAIL, $duplicate)
            ->add(Crud::PAGE_NEW, Action::INDEX)
            ->add(Crud::PAGE_EDIT, Action::DELETE)
            ->reorder(Crud::PAGE_INDEX, [
                'view',Action::DETAIL,Action::EDIT,'duplicate',Action::DELETE
            ])
            ->reorder(Crud::PAGE_DETAIL, [
                'view',Action::INDEX,Action::EDIT,'duplicate',Action::DELETE
            ])
            ->reorder(Crud::PAGE_EDIT, [
                Action::INDEX,Action::SAVE_AND_CONTINUE,Action::SAVE_AND_RETURN,Action::DELETE
            ]);
    }

    public function configureFields(string $pageName): iterable
    {
        if ($pageName === Crud::PAGE_DETAIL || $pageName === Crud::PAGE_INDEX) {
            $description = TextareaField::new('description')
                ->hideOnIndex()
                ->renderAsHtml();
        }elseif ($pageName === Crud::PAGE_EDIT || $pageName === Crud::PAGE_NEW) {
            /*$description = TextEditorField::new('description')
                ->setFormType(CKEditorType::class)
                ->hideOnIndex();*/
            $description = TextEditorField::new('description')
                ->hideOnIndex();
        }

        return [
            ImageField::new('image')
                ->setUploadDir('public/images/uploads')
                ->setBasePath('images/uploads')
                ->setFormTypeOptions([
                    'required' => ($pageName === Crud::PAGE_EDIT && $this->getContext()->getEntity()->getInstance()->getImage()) ? false : true

                ])
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setSortable(false),
            /*->setFormTypeOptions([
                "multiple" => true,
            ]),*/
            /*Field::new('image', 'Image')
                ->setFormType(ElFinderType::class)
                ->setFormTypeOptions([
                    'instance' => 'default',
                    'enable' => true,
                ]),*/
            TextField::new('name'),
            SlugField::new('slug')
                ->setTargetFieldName('name')
                ->hideOnIndex(),
            $description,
            IntegerField::new('stock'),
            MoneyField::new('price')
                ->setCurrency('EUR')
                ->setCustomOption('storedAsCents', false),
            AssociationField::new('category')
                ->setQueryBuilder(function (QueryBuilder $queryBuilder) {
                    return $queryBuilder
                        //->andWhere('entity.isActive = 1')
                        ->orderBy('entity.name', 'ASC');
                }),
            BooleanField::new('isActive', 'Online'),
            BooleanField::new('isTopSeller', 'Top Seller')
        ];
    }

    public function configureCrud(Crud $crud): Crud
    {
        return parent::configureCrud($crud)
            ->setPageTitle(Crud::PAGE_DETAIL,static function(Product $product) {
                return $product->getName();
            })
            ->addFormTheme('@FOSCKEditor/Form/ckeditor_widget.html.twig')
            ->addFormTheme('@FMElfinder/Form/elfinder_widget.html.twig');
    }

    /**
     * To check that a product still has an image when is modified.
     * @param AdminContext $context
     * @return KeyValueStore|RedirectResponse|Response
     */
    public function edit(AdminContext $context): KeyValueStore|RedirectResponse|Response
    {
        if ($context->getRequest()->request->count() > 0 && isset($context->getRequest()->request->get("Product")["image"]["delete"])) {
            $imageDelete = $context->getRequest()->request->get("Product")["image"]["delete"];
            $newImage =  $context->getRequest()->files->get("Product")["image"]["file"];
            $url = $this->adminUrlGenerator->setController(ProductCrudController::class)
                ->setAction(Action::EDIT)
                ->setEntityId($context->getEntity()->getInstance()->getId())
                ->generateUrl();

            if ($imageDelete == "1" && is_null($newImage)) {
                $this->flashBag->add("danger", "The product must have an image.");
                return $this->redirect($url);
            }
        }

        return parent::edit($context);
    }


    public function persistEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        $entityInstance->setCreatedAt(new \DateTimeImmutable(null, new \DateTimeZone('Europe/Paris')));

        parent::persistEntity($entityManager, $entityInstance);
    }

    public function updateEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        $entityInstance
            ->setUpdatedAt(new \DateTimeImmutable(null, new \DateTimeZone('Europe/Paris')))
            ->setSlug($this->updateSlug($entityInstance->getName()));

        parent::persistEntity($entityManager, $entityInstance);
    }

    public function duplicateProduct(AdminContext $context): RedirectResponse
    {
        /** @var Product $product */
        $product = $context->getEntity()->getInstance();

        $duplicateProduct = clone $product;
        $duplicateProduct->setName($product->getName().'_clone')
            ->setImage("")
            ->setIsActive(false)
            ->setIsTopSeller(false);

        parent::persistEntity($this->entityManager, $duplicateProduct);

        $url = $this->adminUrlGenerator->setController(ProductCrudController::class)
            ->setAction(Action::EDIT)
            ->setEntityId($duplicateProduct->getId())
            ->generateUrl();

        return $this->redirect($url);

    }

    public function updateSlug($productName): string
    {
        $slugRegex = '/([^A-Za-z0-9]|-)+/';
        $unwantedCharacters = ['Š'=>'S', 'š'=>'s', 'Ž'=>'Z', 'ž'=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A',
            'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E', 'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I', 'Ï'=>'I',
            'Ñ'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O', 'Ø'=>'O', 'Ù'=>'U', 'Ú'=>'U', 'Û'=>'U', 'Ü'=>'U',
            'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'Ss', 'à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a', 'å'=>'a', 'æ'=>'a', 'ç'=>'c',
            'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i', 'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ò'=>'o',
            'ó'=>'o', 'ô'=>'o', 'õ'=>'o', 'ö'=>'o', 'ø'=>'o', 'ù'=>'u', 'ú'=>'u', 'û'=>'u', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y',
            '$' => '', '%' => '', '&' => '', '<' => '', '>' => '', '|' => '', '¢' => '', '£' => '', '¤' => '', '¥' => '',
            '₠' => '', '₢' => '', '₣' => '', '₤' => '', '₥' => '', '₦' => '', '₧' => '', '₨' => '', '₩' => '', '₪' => '',
            '₫' => '', '€' => '', '₭' => '', '₮' => '', '₯' => '', '₰' => '', '₱' => '', '₲' => '', '₳' => '', '₴' => '',
            '₵' => '', '₸' => '', '₹' => '', '₽' => '', '₿' => '', '∂' => '', '∆' => '', '∑' => '', '∞' => '', '♥' => '',
            '元' => '', '円' => '', '﷼' => ''];

        $name = strtr($productName, $unwantedCharacters);

        return strtolower(trim(trim(preg_replace($slugRegex, '-', $name), '-')));
    }

}