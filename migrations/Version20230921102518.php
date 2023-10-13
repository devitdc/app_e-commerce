<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230921102518 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE addresses (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, name VARCHAR(255) NOT NULL, firstname VARCHAR(255) NOT NULL, lastname VARCHAR(255) NOT NULL, company VARCHAR(255) DEFAULT NULL, address1 VARCHAR(255) NOT NULL, address2 VARCHAR(255) DEFAULT NULL, postal_code VARCHAR(255) NOT NULL, city VARCHAR(255) NOT NULL, country VARCHAR(255) NOT NULL, phone VARCHAR(255) NOT NULL, is_billing TINYINT(1) DEFAULT NULL, INDEX IDX_6FCA7516A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE carriers (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, delay VARCHAR(255) NOT NULL, price DOUBLE PRECISION NOT NULL, type VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE categories (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, is_active TINYINT(1) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE header (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, content LONGTEXT NOT NULL, btn_title VARCHAR(255) NOT NULL, btn_url VARCHAR(255) NOT NULL, image VARCHAR(255) NOT NULL, is_active TINYINT(1) NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE orders (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', carrier_name VARCHAR(255) NOT NULL, carrier_price DOUBLE PRECISION NOT NULL, is_paid TINYINT(1) NOT NULL, delivery_firstname VARCHAR(255) NOT NULL, delivery_lastname VARCHAR(255) NOT NULL, delivery_company VARCHAR(255) DEFAULT NULL, delivery_address1 VARCHAR(255) NOT NULL, delivery_address2 VARCHAR(255) DEFAULT NULL, delivery_postal_code VARCHAR(255) NOT NULL, delivery_city VARCHAR(255) NOT NULL, delivery_country VARCHAR(255) NOT NULL, delivery_phone VARCHAR(255) NOT NULL, reference VARCHAR(255) NOT NULL, stripe_session_id VARCHAR(255) DEFAULT NULL, delivery_state INT NOT NULL, updated_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_E52FFDEEA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE orders_details (id INT AUTO_INCREMENT NOT NULL, my_order_id INT DEFAULT NULL, product VARCHAR(255) NOT NULL, quantity INT NOT NULL, price DOUBLE PRECISION NOT NULL, total DOUBLE PRECISION NOT NULL, image_name VARCHAR(255) NOT NULL, product_id INT NOT NULL, INDEX IDX_835379F1BFCDF877 (my_order_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE products (id INT AUTO_INCREMENT NOT NULL, category_id INT NOT NULL, name VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, image VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, price DOUBLE PRECISION NOT NULL, is_top_seller TINYINT(1) NOT NULL, stock INT NOT NULL, is_active TINYINT(1) NOT NULL, updated_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_B3BA5A5A12469DE2 (category_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE users (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', password VARCHAR(255) NOT NULL, firstname VARCHAR(255) NOT NULL, lastname VARCHAR(255) NOT NULL, is_verified TINYINT(1) NOT NULL, UNIQUE INDEX UNIQ_1483A5E9E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE users_reset_password (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, token VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_C720A550A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE addresses ADD CONSTRAINT FK_6FCA7516A76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE orders ADD CONSTRAINT FK_E52FFDEEA76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE orders_details ADD CONSTRAINT FK_835379F1BFCDF877 FOREIGN KEY (my_order_id) REFERENCES orders (id)');
        $this->addSql('ALTER TABLE products ADD CONSTRAINT FK_B3BA5A5A12469DE2 FOREIGN KEY (category_id) REFERENCES categories (id)');
        $this->addSql('ALTER TABLE users_reset_password ADD CONSTRAINT FK_C720A550A76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE addresses DROP FOREIGN KEY FK_6FCA7516A76ED395');
        $this->addSql('ALTER TABLE orders DROP FOREIGN KEY FK_E52FFDEEA76ED395');
        $this->addSql('ALTER TABLE orders_details DROP FOREIGN KEY FK_835379F1BFCDF877');
        $this->addSql('ALTER TABLE products DROP FOREIGN KEY FK_B3BA5A5A12469DE2');
        $this->addSql('ALTER TABLE users_reset_password DROP FOREIGN KEY FK_C720A550A76ED395');
        $this->addSql('DROP TABLE addresses');
        $this->addSql('DROP TABLE carriers');
        $this->addSql('DROP TABLE categories');
        $this->addSql('DROP TABLE header');
        $this->addSql('DROP TABLE orders');
        $this->addSql('DROP TABLE orders_details');
        $this->addSql('DROP TABLE products');
        $this->addSql('DROP TABLE users');
        $this->addSql('DROP TABLE users_reset_password');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
