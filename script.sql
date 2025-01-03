create table cache
(
    `key`      varchar(255) not null
        primary key,
    value      mediumtext   not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table cache_locks
(
    `key`      varchar(255) not null
        primary key,
    owner      varchar(255) not null,
    expiration int          not null
)
    collate = utf8mb4_unicode_ci;

create table driving_licenses
(
    id            bigint unsigned auto_increment
        primary key,
    license_class varchar(255) not null,
    created_at    timestamp    null,
    updated_at    timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table education_fields
(
    id                 bigint unsigned auto_increment
        primary key,
    name               varchar(255)    not null,
    education_field_id bigint unsigned null,
    created_at         timestamp       null,
    updated_at         timestamp       null,
    constraint education_fields_education_field_id_foreign
        foreign key (education_field_id) references education_fields (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table education_levels
(
    id                 bigint unsigned auto_increment
        primary key,
    name               varchar(255)    not null,
    education_level_id bigint unsigned null,
    created_at         timestamp       null,
    updated_at         timestamp       null,
    constraint education_levels_education_level_id_foreign
        foreign key (education_level_id) references education_levels (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table jobs
(
    id          bigint unsigned auto_increment
        primary key,
    title       varchar(255) not null,
    description text         not null,
    created_at  timestamp    null,
    updated_at  timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table languages
(
    id                bigint unsigned auto_increment
        primary key,
    language          varchar(255)                        not null,
    proficiency_level enum ('başlangıç', 'orta', 'ileri') not null,
    created_at        timestamp                           null,
    updated_at        timestamp                           null
)
    collate = utf8mb4_unicode_ci;

create table locations
(
    id         bigint unsigned auto_increment
        primary key,
    city       varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table marital_statuses
(
    id         bigint unsigned auto_increment
        primary key,
    status     varchar(255) not null,
    created_at timestamp    null,
    updated_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table military_services
(
    id              bigint unsigned auto_increment
        primary key,
    military_status varchar(255) not null,
    created_at      timestamp    null,
    updated_at      timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table skills
(
    id         bigint unsigned auto_increment
        primary key,
    skill_name varchar(255)                                not null,
    level      enum ('beginner', 'intermediate', 'expert') not null,
    created_at timestamp                                   null,
    updated_at timestamp                                   null
)
    collate = utf8mb4_unicode_ci;

create table applications
(
    id                 bigint unsigned auto_increment
        primary key,
    job_id             bigint unsigned not null,
    name               varchar(255)    not null,
    email              varchar(255)    not null,
    phone              varchar(255)    not null,
    education          varchar(255)    not null,
    resume             text            not null,
    notes              text            null,
    cv_path            varchar(255)    not null,
    education_level_id bigint unsigned not null,
    education_field_id bigint unsigned not null,
    created_at         timestamp       null,
    updated_at         timestamp       null,
    skill_id           bigint unsigned null,
    location_id        bigint unsigned null,
    military_status_id bigint unsigned null,
    driving_license_id bigint unsigned null,
    marital_status_id  bigint unsigned null,
    language_id        bigint unsigned null,
    constraint applications_driving_license_id_foreign
        foreign key (driving_license_id) references driving_licenses (id)
            on delete cascade,
    constraint applications_education_field_id_foreign
        foreign key (education_field_id) references education_fields (id)
            on delete cascade,
    constraint applications_education_level_id_foreign
        foreign key (education_level_id) references education_levels (id)
            on delete cascade,
    constraint applications_job_id_foreign
        foreign key (job_id) references jobs (id)
            on delete cascade,
    constraint applications_language_id_foreign
        foreign key (language_id) references languages (id)
            on delete cascade,
    constraint applications_location_id_foreign
        foreign key (location_id) references locations (id)
            on delete cascade,
    constraint applications_marital_status_id_foreign
        foreign key (marital_status_id) references marital_statuses (id)
            on delete cascade,
    constraint applications_military_status_id_foreign
        foreign key (military_status_id) references military_services (id)
            on delete cascade,
    constraint applications_skill_id_foreign
        foreign key (skill_id) references skills (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table users
(
    id                bigint unsigned auto_increment
        primary key,
    name              varchar(255) not null,
    email             varchar(255) not null,
    email_verified_at timestamp    null,
    password          varchar(255) not null,
    remember_token    varchar(100) null,
    created_at        timestamp    null,
    updated_at        timestamp    null,
    constraint users_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;

create table certifications
(
    id                 bigint unsigned auto_increment
        primary key,
    user_id            bigint unsigned not null,
    certification_name varchar(255)    not null,
    issued_by          varchar(255)    not null,
    issue_date         date            not null,
    created_at         timestamp       null,
    updated_at         timestamp       null,
    constraint certifications_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table educations
(
    id          bigint unsigned auto_increment
        primary key,
    user_id     bigint unsigned not null,
    school_name varchar(255)    not null,
    degree      varchar(255)    not null,
    start_date  date            not null,
    end_date    date            null,
    created_at  timestamp       null,
    updated_at  timestamp       null,
    constraint educations_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table experiences
(
    id           bigint unsigned auto_increment
        primary key,
    user_id      bigint unsigned not null,
    company_name varchar(255)    not null,
    position     varchar(255)    not null,
    start_date   date            not null,
    end_date     date            null,
    created_at   timestamp       null,
    updated_at   timestamp       null,
    constraint experiences_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table `references`
(
    id                 bigint unsigned auto_increment
        primary key,
    user_id            bigint unsigned not null,
    reference_name     varchar(255)    not null,
    reference_position varchar(255)    not null,
    reference_company  varchar(255)    not null,
    reference_contact  varchar(255)    not null,
    created_at         timestamp       null,
    updated_at         timestamp       null,
    constraint references_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;

create table sessions
(
    id            varchar(255)    not null
        primary key,
    user_id       bigint unsigned null,
    ip_address    varchar(45)     null,
    user_agent    text            null,
    payload       text            not null,
    last_activity int             not null,
    constraint sessions_user_id_foreign
        foreign key (user_id) references users (id)
            on delete cascade
)
    collate = utf8mb4_unicode_ci;


