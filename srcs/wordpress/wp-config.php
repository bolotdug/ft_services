<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://ru.wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'wordpress' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'admin' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', 'admin' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'mysql' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ' l1-<V8V=B++?T|5/oHr]Sh5AX} e%CrizE%,L?,`7]$4t`-e5+w@4J n2lGkElU');
define('SECURE_AUTH_KEY',  '+Cqn5;|AXmR]aunT&,a/H+5+iZfm]K=[KZNl9$U-Op$%&1y`|P|]6TD@IiafG(_=');
define('LOGGED_IN_KEY',    'X>&hc<BijmT^s7B2<#R-0%9C44A}~Kl-hjf>07mU|[Zs[RmWLy&$lyJ0^ W3P}Kw');
define('NONCE_KEY',        '|y6mn@W-*4-c4Z,UAg-Ks)?__]^]`x,b/N$kV00*0|&K+od`ot9`s8#erHTCVXF-');
define('AUTH_SALT',        'j`*jnZq!{}o,FkyzPO~wh4,~||?.*ZL^e<=1a+0{KlWHXWd4#X99mgNQTXe%[S:`');
define('SECURE_AUTH_SALT', 'Zk;&+~4Rk2xovFq]}@pKd7D+qGK2$+C/VTAY7.}Zw}b.b<Ue3%vVA(ISH|dBo&|y');
define('LOGGED_IN_SALT',   '$&p$FCi.d3 MF&( BMySD#!@3`+2?h$,B_YgCib_PLMT3qu!ef<#JV+vvZ:fU|;b');
define('NONCE_SALT',       'KUXI?A1ustx5; qZ#vcpXO4WpBB1jP:OwcJ#YXz&)u5&}J*8j}tb-SW+XVqVqh|6');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в документации.
 *
 * @link https://ru.wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once ABSPATH . 'wp-settings.php';
