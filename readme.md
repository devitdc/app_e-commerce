[![Release version](https://img.shields.io/badge/release-v1.0.0-blue)]()
[![Symfony version](https://img.shields.io/badge/symfony-5.4-blue)]()
[![PHP version](https://img.shields.io/badge/php-8.0-blue)]()
# Le Dressing Français

Application e-commerce avec Symfony 5.4 permettant la vente d'articles en ligne avec :
* une gestion des articles (*ajout, modification, suppression*),
* gestion de stock
* gestion des catégories (*une par article*)

Paiement avec l'API Stripe et envoi de notification mail avec l'API MailJet (*activation du compte, confirmation de commande, etc.*).

## Environnement de développement

### Pré-requis

* Symfony 5.4
* EasyAdmin 3
* PHP 8.0
* Symfony CLI 5.4.19
* Composer 2.4.4
* MariaDB 10.10.2
* BootStrap 5.2
* FontAwesome
* node.js 19.7.0 / npm 9.5.0

Pour vérifier que les pré-requis sont respectés :
```bash
symfony check:requirements
```

Pour vérifier qu'aucun packages ne présentent des vulnérabilités :
```bash
symfony security:check
```

Créer le fichier **.env** en s'appuyant du fichier **.env-template** avant d'exécuter les commandes suivantes.
Vous devez définir certains paramètres présents dans le fichier **.env** :
* **APP_BRAND** : Correspond au nom de la boutique.
* **APP_WEBSITE** : Correspond à l'URL d'accès à l'application.
* **APP_STRIPE_API** : Correspond à la clef API de Stripe pour les paiements par carte bancaire.

### Pour démarrer l'environnement de développement

```bash
composer install
npm install --force
npm run build
chmod +x bin/*
bin/console doctrine:database:create
bin/console doctrine:migrations:diff
bin/console doctrine:migrations:migrate
symfony server:start
```

Un jeu de données est disponible dans le dossier **data/**, il suffit d'importer le fichier sql dans la base
de données créée.

Voici la liste des comptes disponibles :
* admin@demo.local : admin123
* user@demo.local : user1234
* tdupont@demo.local : user1234

### Pour démarrer l'environnement de production

Mettre à jour le fichier **.env** avant d'exécuter les commandes suivantes.

```bash
composer install --no-dev --optimize-autloader
npm force install
npm run build
chmod +x bin/*
bin/console doctrine:database:create
bin/console doctrine:migrations:diff
bin/console doctrine:migrations:migrate
```

### Utiliser MailJet pour l'envoi de mail

Les mails à destination des utilisateurs sont envoyés via la solution d'emailing **MailJet**.
Si vous souhaitez l'utiliser, il faudra créer 3 templates :
* pour le message de bienvenue lors de la création du compte utilisateur,
* lorsque l'utilisateur fait une demande de mot de passe oublié,
* lorsque l'utilisateur effectue un achat et reçoit un email récapitulatif de sa commande.

Il faudra renseigner les clefs **API** dans les fichiers **.env** et dans la classe **src/Class/Mail.php**.
