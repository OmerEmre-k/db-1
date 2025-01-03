# Job Application Database Schema

Bu repository, Laravel projesi için kullanılan veritabanı şemasını ve migrasyon dosyalarını içerir. Proje, iş ilanları ve başvuru süreçlerini yönetmek için tasarlanmış bir veritabanı yapısı sunar.

## Özellikler

- Laravel için özelleştirilmiş migrasyon dosyaları.
- Seeders ile örnek veri desteği.
- Modüler ve genişletilebilir veritabanı yapısı.

## Gereksinimler

- Laravel 9.x veya üzeri.
- MySQL veya MariaDB gibi bir veritabanı yönetim sistemi.
- PHP >= 8.0.

## İçerik

Bu repository aşağıdaki veritabanı tablolarını içerir:  

- `users`: Kullanıcı bilgileri.  
- `jobs`: İş ilanları bilgileri.  
- `applications`: Başvuru detayları.  
- `skills`: Kullanıcıların yetkinlikleri ve becerileri.  
- `education_levels`: Eğitim seviyesi bilgileri.  
- `military_services`: Askerlik durumu bilgileri.
- `education_fields`: Eğitim alanı bilgileri.
- `languages`: Bilinen dillerin bilgileri.
- Ve diğer gerekli tablolar.  

## Kurulum

1. Depoyu klonlayın:
    ```bash
    git clone https://github.com/OmerEmre-k/job-application-database.git
    ```

2. Laravel projesinin `database/migrations` dizinine taşıyın.

3. Laravel'in `artisan` komutlarını kullanarak veritabanını oluşturun:
    ```bash
    php artisan migrate
    ```

4. Veritabanına örnek veriler eklemek için:
    ```bash
    php artisan db:seed
    ```

## Kullanım

- Bu veritabanı şeması, iş ilanlarının, başvuruların ve kullanıcı bilgilerinin veritabanında depolanmasını sağlar.  
- Migrasyon dosyalarını ve seeders'ı kendi ihtiyaçlarınıza göre özelleştirebilirsiniz.

## Katkıda Bulunma

Eğer bu veritabanı yapısını iyileştirmek istiyorsanız, aşağıdaki adımları izleyebilirsiniz:  

1. Bu repository'i çatallayın.  
2. Yeni bir dal (branch) oluşturun.  
3. Yaptığınız değişiklikleri commit edin.  
4. Pull request açın.  
