i-MSCP ChangeLog

------------------------------------------------------------------------------------------------------------------------
1.1.22
------------------------------------------------------------------------------------------------------------------------

2015-02-06: Laurent Declercq
	RELEASE i-MSCP 1.1.22

ADDONS
	Added: Read/Write permissions on the <imscp>.mail_users table for the roundcube SQL user
	Fixed: Length of SQL's usernames and passwords is not validated ( they must be at least 6 characters long )
	Fixed: Single quotes in sql usernames must be escaped in configuration files ( PhpMyAdmin, Roundcube )

CONFIGS
	Added php5-json package ( Debian Jessie )

DAEMON
	Fixed: Messages must not be hardcoded in functions
	Fixed: Restart of some services fail when the backend ( imscp-rqst-mngr ) is run through the daemon
	Updated: Version to 1.2.2

ENGINE
	Fixed: Composer cache is not cleared correctly
	Fixed: LC_MESSAGES has not expected effect in backend's scripts
	Removed: policyd-weight and postgrey ( Postfix SMTP access policy delegation )

FRONTEND
	Added: Support for eAccelerator, WinCache, XCache and ZendOptimizerPlus opcode caches
	Fixed: Usage of autoloader instead of require_once
	Fixed: Wrong classname iMSCP_Listener ( should be iMSCP_Events_Listener )
	Fixed: Wrong classname iMSCP_Listener_PriorityQueue ( should be iMSCP_Events_Listener_PriorityQueue )

INSTALLER
	Fixed: Length of SQL's usernames and passwords is not validated ( they must be at least 6 characters long )
	Fixed: Migration from Courier to Dovecot is broken ( courier-dovecot-migrate.pl is run with a wrong option )
	Fixed: php5enmod command throws an error when a PHP module is missing ( PHP5.4 )
	Fixed: rsync: failed to set times on "/var/www/virtual": Operation not permitted (1)
	Fixed: Unable to define custom APT repository without key ( Debian, Ubuntu )

PLUGINS
	Fixed: Plugins that don't implement an API method which is being executed must not be instantiated
	Fixed: Plugin uninstall() method must stay optional, even if the install() method is implemented
	Updated: API to version 0.2.16

TICKETS
	Fixed #IP-1207: Defect - DataTable - Sorting not functional for data strings containing numeric values
	Fixed #IP-1208: Task - Untranslatable string
	Fixed #IP-1209: Cosmetics - Data usage bar glitches on 4k screens
	Fixed #IP-1217: Defect - Faulty cron for removing old backend logs
	Fixed #IP-1223: Bug - Admin log shows server IP instead of user IP
	Fixed #IP-1226: Panel maintenance mode: text message error
	Fixed #IP-1227: Page reseller statistics shows the same max/curr traffic/disk for all resellers
	Fixed #IP-1228: Adding SSL-certificate causes undefined index warning
	Fixed #IP-1230: RFC 7208 states that DNS SPF shoudln't be used anymore
	Fixed #IP-1233: Autoresponder script ( imscp-arpl-msgr ) cannot write in /var/log/imscp/imscp-arpl-msgr
	Fixed #IP-1234: IPv6 addresses causes exception
	Fixed #IP-1235: Cosmetics - Reseller overview - Exception in domain status breaks the layout
	Fixed #IP-1238: Question mark information box not functioning when switching page
	Fixed #IP-1239: SSL Certificate - Usage of CA certificates as provided by OS for validation
	Fixed #IP-1241: Allow customers to generate self-signed SSL certificate for their domains through the frontEnd
	Fixed #IP-1246: PHP modules - Priority order - Priority is not honored in some contexts
	Fixed #IP-1247: Apache2 - vlogger - failed unexpectedly
	Fixed #IP-1251: Bug - per_user/per_domain settings - wrong domains/paths in php.ini
	Fixed #IP-1252: Unable to add SSL certificate in some contexts
	Fixed #IP-1256: Backup script - The SQL root password is shown in processes table

------------------------------------------------------------------------------------------------------------------------
1.1.21
------------------------------------------------------------------------------------------------------------------------

2014-12-30: Laurent Declercq
	RELEASE i-MSCP 1.1.21

CONFIGS
	Changed: Dovecot becomes the default choice for POP3/IMAP servers

DISTROS
	Removed: Support for obsolete Ubuntu versions ( Quantal Quetzal, Raring Ringtail, Saucy Salamander )

ENGINE
	Changed: Remove apache log directory on domain deletion
	Fixed: Logs directory is not created in some contexts ( apache_itk )

GUI
	Fixed: Admin logs default order ( last in, first out )
	Fixed: Customer data get updated even when passwords do not match ( reseller/user_edit.php )
	Fixed: error_reporting directive value remain to default option when set to 0 ( admin/settings.php )
	Fixed: Ignore orphaned users ( users without domain ) when editing reseller

INSTALLER
	Changed: Installation of the libapache2-mpm-itk package is now delayed to avoid dpkg configuration errors
	Fixed: sysctl: permission denied on key 'net.ipv4.conf.all.promote_secondaries' ( vps )
	Fixed: /bin/cp: cannot overwrite non-directory when using symlinks ( replaced by rsync command )
	Fixed: Missing mcrypt PHP module error on fresh installation ( Trusty Tahr )
	Fixed: Prefill debconf database for the dovecot-core/create-ssl-cert question ( Dovecot )

PLUGINS
	Added: plugin_locked attribute which allow a plugin to lock another plugin for deletion
	Updated: Plugin API to version 0.2.15

TICKETS
	Fixed #1199: Defect - TR_PASSWORD_GENERATE placeholder is not parsed

------------------------------------------------------------------------------------------------------------------------
1.1.20
------------------------------------------------------------------------------------------------------------------------

2014-12-11: Laurent Declercq
	RELEASE i-MSCP 1.1.20

CONFIGS
	Fixed: Unable to start the Ftp server - unknown protocol: 'TLSv1.1' ( ProFTPD )

ENGINE
	Fixed: Unable to do any operation on the user web directory - ( immutable bit )

------------------------------------------------------------------------------------------------------------------------
1.1.19
------------------------------------------------------------------------------------------------------------------------

2014-12-11: Laurent Declercq
	RELEASE i-MSCP 1.1.19

CONFIGS
	Added: Sysctl configuration file for secondary IP promoting ( /etc/sysctl.d/imscp.conf file )
	Changed: SPF - Email treating level is now set to softfail instead of fail ( bind9 )
	Fixed: Access to error documents is forbiden in some contexts ( Apache )
	Fixed: A TLS fatal alert has been received - Wrong cipher suite ( ProFTPD )
	Fixed: Domain aliases and subdomains can't follow symlinks from customer homedir
	Fixed: Missing NoSessionReuseRequired parameter ( ProFTPD )

DAEMON
	Fixed: Network manager must not remove SSH connection IP

ENGINE
	Fixed: Fcgi wrapper is not created in some contexts ( apache_fcgid )
	Fixed: Pool configuration file is not created in some contexts ( apache_php_fpm )

GUI
	Added: Events for mail catch-all
	Changed: All network interfaces are now selectable, even if they are not up
	Fixed: Allow the message_timeout event to be triggered for elements which are out of the .body container ( layout )
	Fixed: Clear opcode cache when needed ( Opcache, APC )
	Fixed: CSS loading order
	Replaced: i-MSCP jQuery tooltip plugin by jQuery UI tooltip widget

i18n
	Added: i18n_getJsTranslations() function which allow to translate JS scripts
	Added: onGetJsTranslations event which allows the plugins to add their own JS translations
	Added: New languages: Breton, Czech, Icelandic and Georgian ( Requested languages )
	Fixed: Don't throw any exception when a locale is not valid. Fallback to the default en_GB locale instead

PLUGINS
	Changed: Plugins are now aware of plugin manager
	Fixed: PHP Notice: Undefined index: prirotiy in /var/www/imscp/gui/library/iMSCP/Plugin/Manager.php on line 1390
	Fixed: Plugins's configuration is not updated using the latest conffiles state when an OPCODE cache is enabled
	Fixed: Plugin manager must be aware of plugin deletion
	Updated: Plugin API to version 0.2.14

VENDOR
	Added: pGenerator jQuery plugin v1.0.0

TICKETS
	Fixed #1187: Enhancement - Password generator for any password field
	Fixed #1188: Bug - apache_fcgid - Fcgid wrapper not created in some contexts
	Fixed #1191: Bug - Domains which belong to disabled accounts are no longer reachable after an i-MSCP reconfiguration
	Fixed #1192: Bug - Network manager - Server connection lost
	Fixed #1194: Enhancement - Allowed character range for TXT DNS resource records

------------------------------------------------------------------------------------------------------------------------
1.1.18
------------------------------------------------------------------------------------------------------------------------

2014-11-22: Laurent Declercq
	RELEASE i-MSCP 1.1.18

ENGINE
	Fixed: Unable to remove the domain aliases and the subdomains ( Web folder protection )

GUI
	Added: iMSCP_Events_Aggregator::getEventManager() method
	Changed: Configuration objects are now cached for better performances
	Changed: Mail body footprints are now stored in flat file instead of database ( Exception mail writer )
	Changed: Mails are now sent every 24 hours in context of an identical exception ( Exception mail writer )
	Changed: Writers are now lazy-loaded ( Exception writers )
	Fixed: Ignore orphaned admin entries ( customer ) in generate_reseller_user_props() function
	Fixed: The MAIL_WRITER_EXPIRY_TIME configuration parameter is not honored ( Exception mail writer )
	Fixed: Undefined sSearch index in admin_log.php
	Fixed: Useless initialization routines in context of the AJAX requests ( Initializer )
	Fixed: Wrong routine initialization order ( Intializer )
	Improved: Fallback template ( Exception browser writer )
	Removed MAIL_BODY_FOOTPRINTS and MAIL_WRITER_EXPIRY_TIME configuration parameters ( Exception mail writer )
	Refactoring: Moved js initialiazation routines into the imscp.js file +++
	Rewritten: Handler for uncaught exceptions ( including writers )
	Rewritten: SSL certificate interface ( client level )

Vendor
	Fixed: base64_encode() expects parameter 1 to be string, array given in ASN1.php ( phpseclib )
	Updated phpseclib library to version 0.3.9

INSTALLER
	Fixed: Any TLD must be allowed ( hostname and domain name validation )

------------------------------------------------------------------------------------------------------------------------
1.1.17
------------------------------------------------------------------------------------------------------------------------

2014-11-17: Laurent Declercq
	RELEASE i-MSCP 1.1.17

CONGIGS
	Added: Dedicated configuration template file for Dovecot 2.1.x
	Fixed: SSLv2 and SSLv3 must be disabled to prevent POODLE attacks ( Postfix, Dovecot >= 2.1, Proftpd )
	Removed: The iterate_query parameter from the dovecot-sql.conf file ( Parameter not available in Dovecot 1.x )

ENGINE
	Added: Cron task attributes validation routines ( Servers::cron::cron )
	Fixed: Cron server is broken - Unable to remove cron task ( Servers::cron::cron )

GUI
	Added: Browser detection capability (i18n)
	Added: New static_* CSS classes for static page messages ( Layout )
	Changed: The flash messages are now positioned relatively and over the page body ( Layout )
	Changed: Lowered Gzip compression level to avoid high server load
	Fixed: Default language set through admin/settings is not used
	Fixed: When adding a SQL user to a database, some SQL users are not listed in the select box
	Fixed: Wrong POST variable in client/ticket_create.php

i18n
	Added gui/library/resources/i18n/iMSCP.php file for indirect translation strings

INSTALLER
	Fixed: The installer hangs when a new conffile is provided by a Debian package

PLUGINS
	Added: Plugin priority field (allow to prioritize plugin (backend) loading order)
	Fixed: isLoadedConfig flag is never set ( iMSCP_Plugin )
	Fixed: Plugins for which the plugin_error field is not NULL must not be loaded
	Updated: Plugin API to version 0.2.13

TICKETS
	Fixed: #1175: Bug - Domains - Shared mount points are always deleted
	Fixed: #1178: Cosmetics - Logout is not a translatable string

------------------------------------------------------------------------------------------------------------------------
1.1.16
------------------------------------------------------------------------------------------------------------------------

2014-11-02: Laurent Declercq
	RELEASE i-MSCP 1.1.16

CONFIGS
	Fixed: ssl_protocols parameter not available in versions older than 2.1 ( Dovecot )
	Fixed: Wrong HOST_NAME variable in quota-waring template files ( Dovecot )

ENGINE
	Fixed: Servers::cron::cron server is broken - Cron file are never installed
	Fixed: i-MSCP create many garbage (file under /) ( related to Servers::cron::cron server is broken... )

GUI
	Fixed: PHP must search files in i-MSCP library directories prior any other directory ( PHP include_path )
	Fixed: Mail suspension - Wrong SQL queries
	Fixed: Mitigate memory consumption by loading only needed translation file ( i-MSCP translation files )
	Removed: Useless encoding translation string ( Usage of UTF-8 only )

INSTALLER
	Fixed: The languages index must be rebuilt on each update to show the last available translation statistics
	Fixed: Unable to handle i-MSCP services (start/restart/stop...) on systems using systemd (e.g Jessie)
	Fixed: Wrong labels ( iMSCP::Dialog )
	Removed: Option allowing to add IP manually ( Tedious and error prone )

TICKETS
	Fixed #1172: Bug - Subdomains - DNS resource records - Conflicts with CNAME records
	Fixed #1173: Bug - Possible race conditions in request manager

------------------------------------------------------------------------------------------------------------------------
1.1.15
------------------------------------------------------------------------------------------------------------------------

2014-10-29: Laurent Declercq
	RELEASE i-MSCP 1.1.15

CONFIGS
	Added: cram-md5 authentication mechanism (Dovecot)
	Added: PLUGINS_DIR configuration parameter in imscp.conf file
	Changed: Lowered log level for TLS (Postfix)
	Fixed: Apache user (www-data) must not be able to access to the entire file system (security)
	Fixed: Symlinks must be followed by Apache only if the owner match with the target owner (security)
	Fixed: SSLv2 and SSLv3 must be disabled to prevent POODLE attacks ( Dovecot )
	Fixed: Virtual mail directory must not be hardcoded in dovecot configuration file

ENGINE
	Added: Support for alternative cron files ( Servers::cron::cron )
	Changed: Ignore errors regarding the move of home directory ( Modules::User )
	Fixed: main::run: Argument "yes" isn't numeric in addition (+) at /var/www/imscp/engine/imscp-sw-mngr line 111
	Fixed: Wrong IP added in DNS zone files when the BASE_SERVER_IP and BASE_SERVER_PUBLIC_IP parameters are referring
		   to the same IP (private IP)

GUI
	Added: l10n_addTranslations() core function to allow plugins to add their translations
	Added: New parameter in the translate_dmn_status() core function which allow to disable escaping
	Added: Support for plural translations
	Changed: Translation is now processed using Zend_Translate (which is thread-safe) and Zend_Cache
	Fixed: Depending on event manager in use, some listeners will never be triggered (Events aggregator)
	Fixed: Literal percent sign must be escaped with another percent sign in translation strings
	Fixed: pTemplate events must be triggered in main application context
	Fixed: SQL user hosts must be separated from SQL users to avoid any customer confusion
	Fixed: Security issue - Input data for software instances are not validated correctly (Software Installer)
	Fixed: Unable to activate domain alias (Undefined $reselleId variable causing SQL invalid parameter number error)
	Fixed: Wrong regexps (admin/admin_log.php)
	Removed: iMSCP autoloader classes (usage of Zend loader in place)

INSTALLER
	Fixed: Error about unknown IP when attempting to add new IP
	Fixed: lo must not be used as default device when adding new IP (installer)
	Fixed: Unable to upgrade to 1.1.14 (packages file is corrupted - Ubuntu Precise)

PLUGINS
	Fixed: Configuration change not processed when a plugin is being updated
	Fixed: Errors not catched on change when the __need_change__ flag is set
	Fixed: Plugins must be translatable using the tr() core translation function
	Updated: Plugin API to version 0.2.12

VENDOR
	Removed: php-gettext library
	Updated: Zend Framework components to version 1.12.9

TICKETS
	Fixed #1143: Bug - Domain deactivation - Hard/Soft mail accounts suspension
	Fixed #1151: Bug - Undefined variable $resellerId in reseller/alias.php

------------------------------------------------------------------------------------------------------------------------
1.1.14
------------------------------------------------------------------------------------------------------------------------

2014-09-15: Laurent Declercq
	RELEASE i-MSCP 1.1.14

DAEMON
	Fixed: Wrong version in 'helo' answer string

ENGINE
	Deprecated: Usage of iMSCP::HooksManager package is now deprecated and will be removed in later version
	Fixed: autoinstaller::Functions::doImscpBackup: Name "main::execmode" used only once...
	Fixed: Undefined value in tracker hash (vlogger)
	Renamed: iMSCP::HooksManager to iMSCP::EventManager (iMSCP::HooksManager is now an alias of iMSCP::EventManager)

GUI
	Fixed: Malformed href attributes in alias.php (reseller level)
	Fixed: Malformed href attribute in ticket_system.tpl (admin/reseller levels)
	Fixed: Unable to add custom CNAME DNS resource record using the arobase symbol which is substitued by the zone root
	Updated: Layout according changes from vendor libraries

INSTALLER
	Changed: Downgrade of SQL server is no longer allowed by installer
	Changed: Package uninstallation task is now triggered after packages installation
	Fixed: Accessing non existing config value DATABASE_USER_HOST (upgrade issue)
	Fixed: Composer home directory has been reset back to /root/.composer by mistake
	Fixed: Dangling symlinks are not removed when switching from ITK to another httpd server implementation (Jessie)
	Fixed: Dovecot/Courier migration - Files must be rewritten on each migration by adding the --overwrite option
	Fixed: Download zip archives instead of cloning sources which include useless VCS information (composer packages)
	Fixed: Local DNS resolver is never disabled whatever the configuration parameter value
	Fixed: Package which are scheduled for installation must not be removed
	Fixed: Releases are not sorted correctly (iMSCP::LsbRelease library)
	Fixed: When the preseed or noprompt options are set, debconf must be run in noninteractive mode
	Fixed: When switching to another SQL server debian version flag file must be removed
	Fixed: Wrong template name passed to the onLoadTemplate event (MySQL server implementation)

PLUGINS
	Fixed: Plugin backend files must no longer be removed on error
	Updated: Plugin API to version 0.2.11

VENDOR
	Updated: jQuery library to version 1.1.11
	Updated: jQuery UI library to version 1.1.11
	Updated: jQuery DataTables plugin to version 1.10.2
	Updated: PHP Secure Communications Library to version 0.3.8
	Updated: Zend Framework components to version 1.12.8

TICKETS
	Fixed #1125: Defect - Modules::Ips - Returns only domain IPs

------------------------------------------------------------------------------------------------------------------------
1.1.13
------------------------------------------------------------------------------------------------------------------------

2014-07-20: Laurent Declercq
	RELEASE i-MSCP 1.1.13

DOCS
	Updated: INSTALL files

SERVICES
	Fixed: Apache mod_version module is not always static
	Fixed: The parameter innodb_use_native_aio is not available in MySQL < 5.5

------------------------------------------------------------------------------------------------------------------------
1.1.12
------------------------------------------------------------------------------------------------------------------------

2014-07-16: Laurent Declercq
	RELEASE i-MSCP 1.1.12

PACKAGES
	Fixed: Quotation marks must be escaped in PhpMyAdmin configuration file
	Fixed: Quotation marks must be escaped in Roundcube configuration file
	Updated: Required Roundcube addon package version is now 0.5.0.*@dev

CONFIGS
	Removed: GUI_CERT_DIR variable (replaced by CONF_DIR variable)
	Cleanup: Package files, config files
	Removed: Ubuntu imscp.conf file (Debian conffile is now used when no conffile is available for the selected distro)
	Removed: Ubuntu layout file (Debian layout is now used when no layout is available for the selected distro)

DAEMON
	Removed: Useless daemon logs + small fixes
	Updated: Version to 1.2.1

DATABASE
	Fixed: Error messages from database updates are not detailed
	Fixed: Ftp, Mail and SQL passwords are not decrypted during database update r53
	Fixed: Infinite loop in iMSCP_Update_Database::dropIndexByColumn()
	Fixed: Undefined key KEY_NAME in iMSCP_Update_Database::dropIndexByColumn()
	Fixed: Undefined offset in database update r169

DISTROS
	Re-added: Courier as alternative for IMAP/POP3 servers (Debian Jessie)

ENGINE
	Added: Apache proxy_handler module (backported from a patch for Apache 2.4.10) (Debian Jessie)
	Added: iMSCP::Net::getAddrType() method
	Changed: Backslashes are no longer allowed in SQL user names and passwords
	Changed: SASL authentication is now made against database directly (Postfix)
	Fixed: Any error occurring from the imscp_network script must go into the imscp_network.log file
	Fixed: German special characters are not displayed properly in auto-reply messages
	Fixed: In case the passphrase is missing, user must not be prompted (iMSCP::OpenSSL)
	Fixed: Missing EOL in SSL certificate containers (iMSCP::OpenSSL)
	Fixed: PHP5-FPM (5.6.0~rc2+dfsg-1) doesn't work with Apache fastcgi module (Debian Jessie)
	Fixed: The backend must not try to start services which are not used (MySQL, Bind9)
	Fixed: Usage of the fastcgi Apache extension module is no longer recommended with Apache 2.4.x (Debian Jessie)
	Fixed: Quota script must ignore maildir which doesn't exist
	Fixed: When running inside an OpenVZ container, usage of native asynchronous I/O subsystem must be disabled (Mysqld)
	Replaced: Dovecot SASL by Cyrus SASL (Postfix)

GUI
	Fixed: AjaXplorer (Pydio) Autologon feature is broken
	Fixed: Disk usage (percent value) is wrong (admin level / Customer statistics)
	Fixed: Feature custom_dns_record is not known by the customerHasFeature() function
	Fixed: Unable to list domain aliases by name (search feature / reseller level)

INSTALLER
	Added: Dialog box allowing to setup the public IP for servers which are inside a private LAN
	Added: Option allowing to force reinstallation/reconfiguration of distro packages
	Fixed: Bind9 cannot start if the resolvconf package is not configured yet (Debian Squeeze)
	Fixed: Installer hangs while packages installation (Debian Jessie)
	Fixed: Unable to migrate from ispCP (linked to the infinite loop in iMSCP_Update_Database::dropIndexByColumn())
	Updated: Preseed template file according new parameters

PLUGINS
	Fixed: Loading of plugins must not fail silently

VENDOR
	Added: Net::Domain::TLD version 1.72 from CPAN (This allow to have last available TLDs list for this module)

TICKETS
	Fixed #1072: Bug - Uninstaller error - iMSCP::File::delFile: Unable to delete file imscp_network...
	Fixed #1095: Bug - IP usage interface is broken
	Fixed #1097: Enhancement - Allow to set public IP for server which are inside a private LAN
	Fixed #1099: Bug - SQL users which belong to an account which is being deleted are not removed from mysql table
	Fixed #1106: Defect - PHP5-FPM server implementation - Reload failure under Ubuntu Trusty Thar
	Fixed #1109: Defect - .technology is not recognized as a valid top level domain
	Fixed #1110: Defect - /etc/php5/mods-available/mcrypt.ini does not exist (Ubuntu Quantal)

------------------------------------------------------------------------------------------------------------------------
1.1.11
------------------------------------------------------------------------------------------------------------------------

2014-06-08: Laurent Declercq
	RELEASE i-MSCP 1.1.11

PLUGINS
	Changed: Plugin's backend scripts are now loaded from main plugin directory to avoid too many IO operations
	Fixed: Plugin db updates are not applied when a new plugin version is uploaded through the plugin UI
	Fixed: Unable to delete plugins which are uninstalled
	Updated: Plugin API to version 0.2.10

ENGINE
	Removed: Plugins directory (backend side of plugins are now loaded from main plugin directory)

------------------------------------------------------------------------------------------------------------------------
1.1.10
------------------------------------------------------------------------------------------------------------------------

2014-06-06: Laurent Declercq
	RELEASE i-MSCP 1.1.10

DATABASE
	Fixed: Wrong column definition in update r176

DISTROS
	Fixed: PHP5-FPM instance is lost in some contexts which causes errors 500 - Ubuntu Trusty Thar

GUI
	Changed: SQL passwords - Restrict allowed characters to printable characters from the ASCII table (not extended)
	Fixed: DNS resource records which are not owned by the custom DNS records feature must always be displayed
	Fixed: Domain alias name passed to the onBeforeAddDomainAlias|onAfterAddDomainAlias events should be in ASCII form

INSTALLER
	Fixed: Allowed character range is not checked for SQL passwords (courier, dovecot, proftpd, phpmyadmin)
	Fixed: All printable characters from the ASCII table, excepted the space, must be allowed in SQL passwords
	Fixed: Length of SQL user names is not checked (courier, dovecot, profptd, phpmyadmin)
	Fixed: Unbale to add an SSL certificate with a private key which is protected by a passphrase
	Fixed: Unable to set DATABASE_USER_HOST (setup dialog is never displayed)

TICKETS
	Fixed #0549: Bug - Apache - IPv6 addresses must be enclosed in square brackets
	Fixed #1091: Defect - OpenVZ - simfs (proxy-filesystem) - Immutable flags - No support detection
	Fixed #1092: Defect - Dovecot - SQL - The value of the connect parameter must be within double-quote

------------------------------------------------------------------------------------------------------------------------
1.1.9
------------------------------------------------------------------------------------------------------------------------

2014-05-25: Laurent Declercq
	RELEASE i-MSCP 1.1.9

DATABASE
	Fixed: r187 is not a valid database update method

ENGINE
	Fixed: Can't locate object method "validateCertificateChain"

GUI
	Fixed: Unable to add self-signed certificate without CA bundle

------------------------------------------------------------------------------------------------------------------------
1.1.8
------------------------------------------------------------------------------------------------------------------------

2014-05-24: Laurent Declercq
	RELEASE i-MSCP 1.1.8

CONFIGS
	Fixed: Wrong placeholder variables in proftpd configuration template file (Ubuntu)

GUI
	Fixed: Unable to add SSL certificate without CA bundle (unexpected line feed in ca_bundle field)

------------------------------------------------------------------------------------------------------------------------
1.1.7
------------------------------------------------------------------------------------------------------------------------

2014-05-23: Laurent Declercq
	RELEASE i-MSCP 1.1.7

TICKETS
	Fixed #1090: Bug - Unable to update to 1.1.6 version - Wrong update query

------------------------------------------------------------------------------------------------------------------------
1.1.6
------------------------------------------------------------------------------------------------------------------------

2014-05-23: Laurent Declercq
	RELEASE i-MSCP 1.1.6

CONFIGS
	Added: Support for Percona server (Debian squeeze, wheezy / Ubuntu lucid, precise, quantal, raring, saucy)
	Added support for MariaDB server using official repositories (Debian Jessie / Ubuntu Trusty)

ENGINE
	Added: MariaDB|MySQL|Percona server implementations
	Added: Options which allow to disable compression for backups
	Fixed: Control panel must have it own SSL certificate
	Fixed: Even if a database backup fail, the backup must not stop. The backup script must jump to the next database
	Fixed: iMSCP::Ext2Attributes must not act on systems which do not support extended fs attributes
	Fixed: Reload signal not implemented in upstart < 1.10.0
	Fixed: SQL root password must not be shown through processus's viewer (mysqldump)
	Fixed: The backup script must set the immutable bit on the customer homedir only if it was previously set
	Fixed: The full certificate chain must be imported in the final container (OpenSSL library)
	Fixed: Unable to restore an uncompressed backup (missing implementation)
	Fixed: Unable to restore SQL database (bad command syntax)
	Fixed: Unable to suspend domain - Undefined key 'TplDir' (apache_php_fpm server implementation)

GUI
	Added iMSCP_Events_Aggregator
	Changed: EventManager is no longer static (shared). The getInstance() method is now deprecated. It now return an
		iMSCP_Events_Aggregator instance to ensure backward compatibility with plugins which are already released
	Changed: i-MSCP version info are now pulled using GitHub API
	Deprecated: iMSCP_Events_Manager::getInstance() (will be removed in next minor version)
	Fixed: Directory chooser is broken (software installer)
	Fixed: Empty SQL user list if at least one database doesn't have any SQL user (software installer)
	Fixed: iMSCP version info must be cached for performance reasons (info are fetched once per day)
	Fixed: Private key passphrase must not be stored in database (SSL feature)
	Fixed: The full certificate chain must be checked (SSL feature)
	Fixed: The method iMSCP_Update_DATABASE:_addIndex() doesn't allow compound keys

INSTALLER
	Added: Support for Percona MySQL server
	Fixed: apache_php_fpm uninstaller is broken
	Fixed: Control panel must have it own SSL certificate
	Fixed: PHP mcrypt module not enabled after fresh install (Ubuntu Trusty Thar)

PLUGINS
	Changed: Implementation of the register() method is no longer mandatory in action plugins
	Fixed: Plugin manager must have its own event manager
	Fixed: Plugin event listeners are registered twice in some contexts
	Updated: Plugin API to version 0.2.9 (changes are backward compatible)

TICKETS
	Fixed #1056: Bug - Incorrect value '_no_' in SQL query on create default email-accounts
	Fixed #1061: Defect - i-MSCP is Unable to connect to https when using PHP from dotdeb
	Fixed #1065: Bug - Unable to unsuspend customer account from admin UI
	Fixed #1066: Bug - Customer's domains remain reachable through HTTPS when they are deactivated
	Fixed #1075: Bug - mysqldump: Can't create/write to file
	Fixed #1078: Defect - Defect - Table 'mysql.host' is not longer provided with MySQL >= 5.6.7

------------------------------------------------------------------------------------------------------------------------
1.1.5
------------------------------------------------------------------------------------------------------------------------

2014-03-27: Laurent Declercq
	RELEASE i-MSCP 1.1.5

CONFIGS
	Fixed: Missing Fileinfo option in domain_ssl.tpl (Apache)
	Fixed: Missing Indexes option in domain.tpl (Apache)

ENGINE
	Fixed: SQL server hostname and port must be specified when restoring database (needed for remote MySQL server)
	Rewritten: iMSCP::Servers and iMSCP::Addons packages to avoid subsitutions

GUI
	Added: Check for www label which is reserved and which cause DNS errors (subdomain)
	Added: Prefix for subdomains mount points which match with default directories
	Added: Run-time check for php5-imap module availability
	Added: SQL user host field to allow customers to set host from which SQL users can connect to the MySQL server
	Fixed: 127.0.0.1 must be mapped to localhost for consistency (SQL user host)
	Fixed: Missing check on admin_id (get_domain_default_props()) which is causing data inconsistencies
	Fixed: Wrong url for latest.txt file

INSTALLER
	Fixed: 127.0.0.1 is now mapped to localhost for consistency (SQL user host)

TICKETS
	Fixed #1050: Bug - Customers can order domains which already exists through domain aliases interface
	Fixed #1051: Bug - Trying to get property of non-object - Integrity constraint violation: 1062 Duplicate entry

------------------------------------------------------------------------------------------------------------------------
1.1.4
------------------------------------------------------------------------------------------------------------------------

2014-03-23: Laurent Declercq
	RELEASE i-MSCP 1.1.4
ADDONS
	Fixed: Awstats addon uninstaller fails in case the cache directory contain a directory

CONFIGS
	Allow usage of mod_rewrite even when PHP is disabled

ENGINE
	Fixed: DNS records (subdomains) are not deleted from zone files (bind9 server impl.)
	Fixed: SOA Serial is not updated in zone files (bind9 server impl.)

GUI
	Added: Counter to allow nested transactions
	Fixed: Stop propagation of the onAuthentication event on first successful authentication attempt

PLUGINS
	Updated: Plugin API to version 0.2.8 (changes are backward compatible)

TICKETS
	Fixed #0879: Security Issue - SQL user hostname - Remove wildcard
	Fixed #1042: Bug - Serial and DNS records in zone files aren't updated/deleted
	Fixed #1045: Bug - All customer alias DNS records are removed when a subdomain is being deleted
	Fixed #1048: Bug - Bad Request - Breadcrumb - Customer statistics

------------------------------------------------------------------------------------------------------------------------
1.1.3
------------------------------------------------------------------------------------------------------------------------

2014-03-11: Laurent Declercq
	RELEASE i-MSCP 1.1.3

ADDONS
	Added: onLoadTemplate events
	Removed: PasswordChanger install part (Roundcube). This plugin will be part of the RoundcubePlugins plugin
	Updated: Net2ftp installer

ENGINE
	Added: Missing onLoadTemplate events

GUI
	Added: Disable custom DNS records feature in case of external DNS server usage

INSTALLER
	Added: External server option for DNS server
	Fixed: Local resolver must be disabled in case of external DNS server usage
	Fixed: When switching to external DNS server, uninstallation of current DNS server must be triggered

PLUGINS
	Added: iMSCP_Plugin::migrateDb() method which allow to migrate plugin database schema
	Fixed: Plugin info not updated when the plugin is deactivated which prevent update to be triggered when needed
	Readded: Automatic triggering of the updatePluginList action after plugin upload
	Updated: Plugin API to version 0.2.7 (changes are backward compatible)

TICKETS
	Fixed #0993: Bug - Inconsistent data in database for created_by field from customers
	Fixed #1032: Bug - Use of undefined constant SORT_NATURAL (PHP < 5.4)
	Fixed #1034: Defect - Policyd-Weight Addon - Configuration mismatch

------------------------------------------------------------------------------------------------------------------------
1.1.2
------------------------------------------------------------------------------------------------------------------------

2014-02-27: Laurent Declercq
	RELEASE i-MSCP 1.1.2

CONFIGS
	Replaced: apache2-suexec/apache2-suexec-pristine packages by apache2-suexec-custom package

ENGINE
	Fixed: Old passwords are still working even when they are updated (courier-authdaemon)

PLUGINS
	Added: __need_change__ field which ensure plugin change on plugin reactivation
	Changed: The updatePluginList action is no longer automatically triggered when a plugin is uploaded
	Fixed: db_schema_version info field which is used by some plugin must be persistent
	Fixed: Plugin info are partially updated
	Updated: Plugin API to version 0.2.6 (changes are backward compatible)

TICKETS
	Fixed #1021: Bug - Some htusers are not added into the htgroup file

------------------------------------------------------------------------------------------------------------------------
1.1.1
------------------------------------------------------------------------------------------------------------------------

2014-02-16: Laurent Declercq
	RELEASE i-MSCP 1.1.1

ADDONS
	Fixed: Awstats - Cron task is not running (dynamic mode)

CONFIGS
	Added: bash-completion package
	Disabled: Opcache support (PHP5.5)

ENGINE
	Added: onLoadTemplate event in all server implementations
	Fixed: DNS sub templates must be passed-in to event listeners
	Fixed: Domain owner unique identifier must be passed-in to related servers and addons
	Fixed: Missing CLEAR method in iMSCP::Config handler

GUI
	Fixed: jQuery library included twice in simple layout
	Fixed: Ticket notification won't be delivered (Support ticket feature)
	Fixed: Wrong download link for new release
	Fixed: Wrong events triggered in client/profile.php
	Updated: Datatable translations

PLUGINS
	Changed: iMSCP_Plugin_Manager::updatePluginInfo() method is now public
	Fixed: Plugin Store link
	Updated: Plugin API to version 0.2.5 (changes are backward compatible)

SETUP
	Changed: imscp group is now allowed to read all files from i-MSCP configuration directory

VENDOR
	Updated: DataTables to version 1.9.4

TICKETS
	Fixed #1014: Bug - Link for "cancel" in Reseller - edit Domain is wrong
	Fixed #1019: Bug - Unable to create customer with SQL feature set to disabled
	Fixed #1020: Bug - Wrong SQL query - Search feature
	Fixed #1022: Defect - standard email aliases not created while adding domain alias
	Fixed #1024: Bug - Apache2 ITK server implementation - Error on update
	Fixed #1025: Bug - Notice: Undefined index: _: Localised language

------------------------------------------------------------------------------------------------------------------------
1.1.0
------------------------------------------------------------------------------------------------------------------------

2014-02-03: Laurent Declercq
	RELEASE i-MSCP 1.1.0

ADDONS
	Added: Awstats - logresolvemerge.pl script for last rotated log processing
	Fixed: Awstats - _addAwstatsSection() event listener is registered too many times
	Fixed: Awstats - Avoid concurrent processes of the awstats_updateall.pl script
	Fixed: Awstats - Error: Couldn't open server log file... (missing files are now ignored silently)
	Fixed: Awstats - Traffic data are lost when logs are rotated
	Fixed: Roundcube|PhpMyAdmin installers - Ensure that database tables exist (recovery case)
	Fixed: Roundcube - Wrong SQL server host when using remote server
	Fixed: PhpMyAdmin 4.1.0 is only compatible with MySQL Server version 5.5 and newer
	Removed: Awstats - logrotate entry (no longer needed)

CONFIGS
	Changed: Tools access is now provided only through the panel domain
	Disabled: PHP opcache module for master (needed for some tools which are not compatible with this module)
	Removed: Useless wget-hack prevention which doesn't prevent nothing in reality
	Removed: mod_fastcgi support (FastCGI is now provided through mod_fcgid only)
	Removed: Useless logs directory from both subdomain and alias Web folder skeletons
	Updated: Apache2 logrotate configuration file (logs are now rotated daily)
	Updated: Fcgid/PHP-FPM config to fit with servers which have at least 4GiB ram

DISTROS
	Added: Packages file for Ubuntu Saucy Slamander and Ubuntu Trusty Tahr (experimental)
	Removed: Courier from Jessie packages list (See https://release.debian.org/migration/testing.pl?package=courier)

ENGINE
	Added: System (UNIX) user/group names are now stored in database
	Added: IMSCP_CLEAR_SCREEN environment variable which allows to not clear the terminal screen at end of script
	Added: SPF records for subdomains and external mail servers
	Changed: Event listeners are now persistent. This allow to avoid self-registering
	Changed: iMSCP::Templator renamed to iMSCP::TemplateParser
	Changed: IP source for outbound mails is now set to the base server IP (Postfix - Temporary fix)
	Changed: Inet protocol is now set according the base server IP type (Postfix - Temporary fix)
	Fixed: Do not compute traffic data for disabled domains
	Fixed: External command died with signal 9 (without core dump)
	Fixed: iMSCP::Rights - Any target referenced by a symlink must not be affected by owner/group modification
	Fixed: Keep current unix user uid/gid when updating the SYSTEM_USER_PREFIX and SYSTEM_USER_MIN_UID parameters
	Fixed: Missing customer logs directories cannot be re-created (permissions denied)
	Fixed: Pass-in domain data to the listeners which listen to the *HttpdBuildConfFile and *HttpdBuildConf events
	Fixed: Proftpd server is down after update
	Fixed: Removed useless file tests on directory deletion
	Fixed: Traffic data must not be lost in case where the imscp-vrl-traff script dies for any reason
	Fixed: Upstart/SysV init - Interoperability
	Fixed: Usage of dynamic resolv.conf (See resolvconf(8))
	Fixed: Wrong DNS record type for subdomain with IPv6 (A instead of AAAA)
	Removed: Useless bind9 templates
	Removed: Useless backup and users log directories (Httpd server impl.)
	Renamed: iMSCP::Boot to iMSCP::Bootstrapper
	Replaced: iMSCP::IP library by IMSCP::Net library (full rewrite using iproute tools instead of net-tools)
	Replaced: imscp-apache-logger by vlogger (i-MSCP specific version)
	Rewritten: getTraffic() methods from server implementations
	Rewritten: iMSCP::Database class
	Rewritten: imscp-srv-traff and imscp-vrl-traff scripts

GUI
	Added: proc_open and popen in PHP editor
	Added: quoteValue() function, which allow to quote string for use in SQL statements
	Removed: IP domain name and IP alias name
	Removed: Useless ip_ssl_domain_id field form server_ips database table

PLUGINS
	Added: Support for local plugin configuration files (See data/persistent/plugins/README.md)
	Fixed: Plugin interface must always show the last plugin available version
	Fixed: Bulk action must not be a valid option (Plugin interface)
	Fixed: When a new plugin version is available, the plugin must be updated and not only enabled
	Updated: Plugin API to version 0.2.4

SETUP
	Fixed: Auto installer must check for any i-MSCP running process
	Fixed: Composer process timeout must be increased for slow connections
	Fixed: Unable to add external repository (Lucid...)

VENDOR
	Updated: Net_DNS2 to version 1.3.2

TICKETS
	Fixed #0528: Bug - The resolv.conf file shouldn't be edited manually
	Fixed #0969: Defect - IPv6 addresses are not removed properly through interface
	Fixed #0972: Bug - Adding second External Mailserver gives an error (Edit mode)
	Fixed #0974: Bug - Customers assignment doesn't work if the first reseller hasn't any client
	Fixed #0975: Bug - Customers assignment - disk limitation check doesn't work correctly
	Fixed #0976: Bug - Wrong syntax for the mail quota value
	Fixed #0978: Defect - SPF records for subdomains and external mail server
	Fixed #0980: Bug - PHP-Editor - Values not saved while adding new customer
	Fixed #0982: Defect - No access to /var/www from localhost
	Fixed #0987: Bug - Backup - iMSCP::DATABASE:mysql::mysql::dumpdb: mysqldump: Couldn't find table...
	Fixed #0989: Security Issue - Any user on a server can read others files
	Fixed #0990: Security issue - Any user can obtain mysql root password
	Fixed #0992: Bug - Hungarian welcome e-mail UTF-8 problem
	Fixed #0995: Defect - Missing scrollbar in Ftp directory chooser dialog
	Fixed #1000: Bug - When a domain is being disabled, apache won't restart
	Fixed #1002: Defect - Plugin Version does not change on update
	Fixed #1003: Defect: Admin/Reseller statistic shows only the current year
	Fixed #1004: Defect - Unable to find any network interface. You cannot add new IP address
	Fixed #1005: Defect - pma_tracker table not locked while importing database
	Fixed #1006: Defect - Options Indexes not working if PHP is disabled
	Fixed #1011: Defect: Unable to add domain such as: 1291.com
	Fixed #1012: Bug - Error when reconfiguring IP through installer (ips option)

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4.7
------------------------------------------------------------------------------------------------------------------------

2013-11-21: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc4.7

CONFIGS
	Added: Vagrantfile allowing to setup a virtual machine using Vagrant
	Removed: DATABASE_UTF8 parameter

DOCS
	Fixed: Updated preseed template file

ENGINE
	Fixed: imscp-del-tmp script is broken (Undefined subroutine floor...)
	Fixed: Plugin (backend part) must be re-installed if missing
	Fixed: Plugin (backend part) must be removed on compile time error
	Fixed: Plugin (backend part) must be removed when a plugin is being deactivated
	Fixed: Quota script is broken (A critical error has been encountered while executing function main::quotaSql...)
	Removed: iMSCP::DATABASE:mysql::Result

GUI
	Added: onBeforeSendCircular and onAfterSendCircular events
	Added: Spam Filter option which allow to keep postfix configuration (external mail server interface)
	Changed: EventsManager - listener stack become a priority queue (Performance issues)
	Fixed: Configuration variable `/var/log/rkhunter.log` is missing
	Fixed: Set internal encoding to UTF-8
	Fixed: Use mb_encode_mimeheader() to encode MIME header when available
	Fixed: Identity garbage on session timeout
	Rewritten: Circular interface (admin and reseller levels)
	Updated: plugin API (version 0.2.0)

SETUP
	Fixed: ispCP migration script must not delete Web data while deleting unix users

TICKETS
	Fixed #935: Enhancement - Add option to keep the postfix configuration even when using external mail server
	Fixed #952: Bug - Backup script - several issues
	Fixed #954: Bug - Mass mail is not working (admin and reseller interfaces)
	Fixed #956: Bug - Infinite loop (Reseller UI)

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4.6
------------------------------------------------------------------------------------------------------------------------

2013-10-28: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc4.6

ENGINE
	Removed: Apache cband module configuration (Should be provided as plugin)
	Fixed: Several 'Can't use an undefined value as a HASH reference...' errors

GUI
	Added: IPv6 service status support
	Changed: Any service port become editable
	Fixed: Service ports interface is broken
	Fixed: Unable to change admin settings

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4.5
------------------------------------------------------------------------------------------------------------------------

2013-10-26: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc4.5

ENGINE
	Added: beforeDispatchRequest and afterDispatchRequest events
	Fixed: Engine - End transaction on error

GUI
	Added: Event Manager - Method allowing to unregister any listener which listen to a particular event
	Fixed: Plugin items with errors must be shown in debugger and the admin must be able to change their status
	Removed: Domain name related parameters
	Updated: Function generateRandomSalt() - Allow to restrict salt character ranges (i.e for unix passwords)

SETUP
	Fixed: Base server vhost prefix not updated when disabling SSL (panel)
	Fixed: Unable to setup SSL without CA bundle (panel)

TICKETS
	Fixed #447: Defect - External mail server feature is broken, when mail account limit is set to -1 (reopened)
	Fixed #945: Bug - impossible to create top-level-domains .рф (russian federation zone)

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4.4
------------------------------------------------------------------------------------------------------------------------

2013-10-22: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc4.4

ENGINE
	Fixed: Can't use an undefined value as a HASH reference...

GUI
	Added: Option allowing to set Email quota synchronization mode
	Added: Per plugin router support
	Fixed: Do not show any quota information for mailboxes which have the quota limit set to 0 (unlimited)
	Fixed: Unable to edit domain (admin level)

TICKETS
	Fixed #938: Bug - Ftp - Login as link is missing
	Fixed #942: Bug - Mailboxes quota synchronization is broken

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4.3
------------------------------------------------------------------------------------------------------------------------

2013-10-17: Torsten Widmann
	RELEASE i-MSCP 1.1.0-rc4.3

ADDONS
	Fixed: Net2ftp addon installer is broken

DOCS
	Fixed: Preseed template file is broken (compile time error)

ENGINE
	Removed: Backtrace routines, which cause segfault on Debian Jessie (issues with Carp package)

SETUP
	Fixed: ispCP migration script is broken (many compile time errors)
	Fixed: Uninstaller - Several compile time errors + missing tasks

GUI
	Fixed: Unable to view ticket (reseller level)

TICKETS
	Fixed #936: Bug - Awstats addon - Failed to open directory /var/cache/awstats

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4.2
------------------------------------------------------------------------------------------------------------------------

2013-10-10: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc4.2

CONFIGS
	Changed: MASTER_GROUP parameter become IMSCP_GROUP
	Fixed: Packages file for Debian Jessie (testing)
	Fixed: Package dovecot-mysql is not available for Ubuntu Lucid
	Fixed: Dovecot - Wrong path for delivery agent
	Removed: Cron templates
	Removed: Packages awstats, chkrootkit and rkhunter from global packages file

DOCS
	Updated: Preseed template file

ENGINE
	Changed: Both Chkrootkit and Rkhunter anti-rootkits as now provided as addons
	Changed: skill command to pkill command (portability issues)
	Fixed: Apache logrotate conffile shouldn't know about awstats addon
	Fixed: Bind server impl. - Unable to handle subdomains when DNS server mode is set to 'slave'
	Fixed: Bind uninstall fail
	Fixed: iMSCP::Debug library - output() function called with wrong parameters
	Fixed: iMSCP::SystemUser::delSystemUser() - Added 'keepHome' option allowing to kept user home directory
	Fixed: PHP allow_url_fopen feature must be explicitly enabled in composer package installer
	Updated: ispCP migration script

TICKETS
	Fixed #636: Bug - Rkhunter - Unreadable log file
	Fixed #810: Bug - https default access redirect mode not working for base server url
	Fixed #902: Bug - User UID/GID mismatch after updating the SYSTEM_USER_PREFIX and/or SYSTEM_USER_MIN_UID parameters
	Fixed #918: Bug - Courier - Unlimited quota doesn't works
	Fixed #919: Bug - Preseed feature is broken - A template has not been found
	Fixed #924: Defect - After Update from RC3 to RC4.1 pop3-ssl and imap-ssl don't work (dovecot 1.2.15)
	Fixed #926: Security Issue - apache_php_fpm - suexec must be enabled
	Fixed #928: Defect - Courier/Maildrop - Wrong permissions after reboot
	Fixed #929: Malfunction - User limits not changeable if Reseller's Email account limit is set to -1
	Fixed #932: Bug - Unable to switch from a redirected subdomain to normal subdomain

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4.1
------------------------------------------------------------------------------------------------------------------------

2013-09-29: Torsten Widmann
	RELEASE i-MSCP 1.1.0-rc4.1

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc4
------------------------------------------------------------------------------------------------------------------------

2013-09-29: Torsten Widmann
	RELEASE i-MSCP 1.1.0-rc4

CONFIGS
	Added: Specific quota warning script for Dovecot 2.x.x branch
	Added: Packages file for Debian Jessie (testing)
	Added: SPF Resource Record Type in bind template
	Added: php5-imap package (required by i-MSCP frontEnd)
	Changed: php5-mysql package to php5-mysqlnd (native driver) when available
	Removed: php5-adodb package
	Removed: Dovecot sieve plugin configuration (Such parameter must be provided as plugin)
	Updated: Apache templates to support 2.4.x branch
	Updated: Dovecot configuration files

ENGINE
	Added: Support for Apache 2.4.x branch
	Added: Database connection timeout (3 seconds)
	Added: MySQL transaction routines
	Added: Webstats support for subodmains
	Fixed: Both, the domain_disable_page directory and statistics directory must be excluded from disk quota accounting
	Fixed: Diskspace not counted for subdomain Maildirs (Disk quota script)
	Fixed: Error 500 (Apache) after creation of any protected area
	Fixed: MySQL server has gone away
	Fixed: Plugin module is broken: Unable to disable, uninstall... any plugin
	Fixed: Plugin update must be triggered when plugin configuration is updated
	Fixed: Set MySQL client connection charset to utf8

GUI
	Added: Assets cache busting
	Added: info.php file for i-MSCP default theme (file which contain theme metadata)
	Added: onBeforeDomainChangeStatus and onAfterDomainChangeStatus events
	Added: Option allowing a domain alias to share the mount point of another domain
	Added: Option allowing a subdomain to share the mount point of another domain
	Changed: Both header and footer backgrounds for tables and location bar are now provided by the jQuery UI theme
	Changed: Customers can no longer set an arbitrary mount point for their subdomains
	Changed: Default Email accounts cannot longer be hidden
	Enhancement: Allow both administrators and resellers to set mail quota for customers
	Enhancement: Email accounts are now filterable
	Enhancement: Custom DNS feature - IDN support
	Fixed: Allow plugins to provide their own assets throught the path /<plugin>/themes/<theme>/assets path
	Fixed: Allow to share domain_dns table between several components (core, plugins..)
	Fixed: Plugins must be able to short-circuit execution of an event
	Fixed: Plugin update must be triggered when plugin configuration is updated
	Fixed: Show DNS record data as tooltip when their length is too big
	Fixed: Unable to delete plugin in some contexts
	Fixed: Wrong placeholders in admin/imscp_debugger.php
	Readded: idna_convert class (more flexible because can operate on arbitrary strings)
	Removed: IE6 support
	Removed: mail_quota action script
	Removed: Tool links from login page
	Rewritten: Domain aliases interface (add|edit)
	Rewritten: Mail interface
	Updated: Assets are now reachable through the /themes/<theme>/assets path
	Updated: Plugin API

SETUP
	Changed: i-MSCP apache_php_fpm server impl. is now the default choice for distributions supporting it officialy
	Fixed: Disable dummy php5_cgi Apache module if any
	Fixed: Do not ask for SQL user host names when the SQL server is hosted locally
	Fixed: Plugins which provide a backend end with unknown error after update
	Fixed: Pre-fill Debconf database (Avoid postfix, proftpd and courier questions during installation)

TICKETS
	Fixed #460: Nice To Have - Admin/Reseller should be able to set mail quota for customers
	Fixed #469: Defect - Quota field in mail_users table should accept big values
	Fixed #579: Review - i18n issues
	Fixed #745: Defect - Disk detail in dovecot doesn't include aliases
	Fixed #779: Defect - When migrating from ispCP the reseller and admin logos are lost
	Fixed #791: Defect - Unable to change customer IP
	Fixed #834: Cosmetics - Ticket system menu names
	Fixed #835: Task - Migration script - ispCP - Remove old php5-fcgi-starter
	Fixed #838: Bug - Installer skips PHP INI Level dialog for apache fcgi
	Fixed #846: Defect - Any customer can set his own mail quota
	Fixed #852: Bug - Software installer - Unable to install any software
	Fixed #854: Bug - Gui - Mail accounts - Mass deletion feature is broken
	Fixed #858: Task - Remove php5-adodb package
	Fixed #861: Bug - SQLSTATE[42000]: Syntax error or access violation
	Fixed #867: Security issue - SSL - When exporting a private key, the password must not be visible from system utilities
	Fixed #870: Bug - Error indicator for new TICKETS
	Fixed #876: Review - Installer - Wildcard should be allowed as part of SQL user hostname
	Fixed #880: Defect - Dovecot - IMAP traffic not counted
	Fixed #883: Defect - Web folders protection option must be automatically disabled and hidden when the immutable flag is not available
	Fixed #886: Enhancement - Add SPF Resource Record Type in bind
	Fixed #891: Bug - Error when migrating from ispCP
	Fixed #893: Defect - Webstats for subdomains are not available
	Fixed #896: Bug - Variable {USERNAME} is not parsed in password email
	Fixed #903: Bug - Domain restore feature is broken
	Fixed #908: Review - Dovecot - Quota - Switch to maildir quota backend
	Fixed #909: Enhancement - Courier - Quotas support using maildrop MDA
	Fixed #913: Bug - Traffic on admin panel not counted
	Fixed #914: Bug - Unable to add/edit Custom DNS record (depending of domain type)
	Fixed #917: Defect - Unable to switch from Dovecot to Courier

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc3
------------------------------------------------------------------------------------------------------------------------

2013-07-23: Torsten Widmann
	RELEASE i-MSCP 1.1.0-rc3

CONFIGS
	Removed Amavis, ClamAV and SpamAssassin configuration (Such service must be provided as plugin)

ENGINE
	Added: Config_readonly option in bootstrap
	Added: Cron job for deactivation of entities belonging to an expired account
	Fixed: Allow to get raw db connection
	Fixed: Access to i-MSCP server/addon parameters must be standardized
	Fixed: unable to remove htgroup
	Fixed: TERM environment variable not set (IMSCP::Debug library)
	Removed: 'dnschange' status
	Updated: 'change' status to 'tochange' and 'delete' status to 'todelete'

GUI
	Added: Plugin archive upload feature (tar.gz, tar.bz2 and zip)
	Added: Protected Web folders option to hosting plans
	Removed: 'dnschange' status
	Updated: Plugin API (Several BC breaks expected)
	Updated: status 'change' to 'tochange' and status 'delete' to 'todelete'

SETUP
	Changed: Items with status other than 'ok' and similar are not longer rebuilded on update

TOOLS
	Fixed: Awstats - Forbidden access (Ubuntu Lucid)

TICKETS
	Fixed #782: Bug - Notice: A non well formed numeric value encountered...
	Fixed #786: Bug - Httpd Server impl. - apache_php_fpm. - No input file specified
	Fixed #790: Defect - Postfix 2.10.x - Relay access - SASL authentication
	Fixed #793: Bug - Autoinstaller/Setup - Admin user is getting new id in database
	Fixed #808: Enhancement - Possibility to Upload i-MSCP Plugins via GUI
	Fixed #809: Bug - Autoinstaller - Preseed feature - Error while executing query: Duplicate entry 'admin'
	Fixed #816: Bug - Unable to uninstall i-MSCP
	Fixed #819: Tasks - Clean up PHP Settings
	Fixed #822: Bug - Auto responder feature broken
	Fixed #831: Bug - imscp_daemon: send_line(): socket write error
	Fixed #841: Bug - Autoinstaller - Preseed feature - some errors
	Fixed #848: Bug - Backend - Wrong after hook in function _buildMasterPhpFpmPoolFile

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc2.3
------------------------------------------------------------------------------------------------------------------------

2013-06-08: Torsten Widmann
	RELEASE i-MSCP 1.1.0-rc2.3

ENGINE
	Fixed: Error on backup: Unable to change mode for...

GUI
	Fixed: Unable to add hosting plan (reseller level)
	Fixed: Possible missing properties (hosting_plans)

SETUP
	Fixed: Pressed feature is broken

TICKETS
	Fixed #647: Bug - Setup - Unable to reconfigure IP addresses
	Fixed #776: Bug - Hosting plans attribs aren't updated with the migration
	Fixed #777: Bug - Autoinstaller - Two entries for imscp-autoinstall option -h
	Fixed #778: Bug - Autoinstaller - Exit code 5 in non-interactive mode --nopromt
	Fixed #781: Bug - Network card not found
	Fixed #812: Review - i-MSCP should show true system memory values

------------------------------------------------------------------------------------------------------------------------
1.1.0-rc2.2
------------------------------------------------------------------------------------------------------------------------

2013-06-04: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc2.2

GUI
	Fixed: Custom DNS feature not working due to missing files

VENDOR
	Updated: jQuery to v1.10.1
	Updated: jQuery UI to v1.10.3

TICKETS
	Fixed #640: Bug - AliasSubdomain won't work when Alias is a redirect
	Fixed #767: Update -jQuery 1.10.1 released
	Fixed #769: Review - Language issue in imscp GUI

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-rc2.1
------------------------------------------------------------------------------------------------------------------------

2013-06-02: Torsten Widmann
	RELEASE i-MSCP 1.1.0-rc2.1

CONFIGS
	Added: MariaDb support
	Added: named.conf.local and named.conf.options files
	Added: Web folder skeletons (Httpd server impls.)
	Fixed: Useless section must be removed in generated Apache configuration files
	Fixed: diff package isn't available for Ubuntu > 12.04 (replaced by diffutils)
	Removed: packages file for Ubuntu Oneiric Ocelot (EOL 20130509)
	Updated: php.ini files

ENGINE
	Added: Hooks for user module
	Added: Hooks.d directory for storage of engine hook files
	Added: Support for Apache + PHP FPM
	Added: option allowing to disable/enable IPv6 support (Bind9)
	Fixed: Admin must be able to add custom data in named configuration files (Bind9)
	Fixed: DNS server must answer to queries only for zones for which it's authoritative (excepted for localhost)
	Fixed: DNS server must be protected against common attacks
	Fixed: DNS zone files must be checked and cleaned before installation in production directory
	Fixed: DNS zones must be added in named.conf.local instead of named.conf (Bind9 - Debian/Ubuntu)
	Fixed: i-MSCP network init script must start/stop MySQL server only if installed
	Fixed: Domain module shouldn't be responsible to add i-MSCP unix user
	Fixed: Permissions as set by Debian must be keep (bind9)
	Fixed: Slave DNS zone files should be put in dedicated directory (Bind9)
	Fixed: SPF record syntax

GUI
	Added: Option allowing to disconnect an user without removing its session
	Added: Option allowing to protect/unprotect Web folders
	Fixed: Allow idn for domain part of Ftp account username
	Fixed: Allow to trigger more than one privilege callback functions for navigation
	Fixed: External mail server option not implemented in admin/domain_edit.page
	Fixed: i18n issues in reseller_add.php and reseller_edit.php pages
	Fixed: Hide menus referring to unplayable features
	Fixed: Sessions not killed (admin/session_manage.php)
	Fixed: Unable to display the domain_edit.php/reseller_edit.php pages in some context (SQL queries too big)
	Removed both order panel and billing interfaces
	Rewritten: Ftp account add page
	Updated: admin/settings.php layout
	Updated iMSCP jQuery tooltip plugin according jQuery library changes

SETUP
	Added: Support for external repositories (Debian/Ubuntu)
	Added: hooks.d directory for storage of installer hook files
	Fixed: add-apt-repository - unknown -y option (Ubuntu Lucid Lynx)
	Fixed: APT packages manager must be configured before any package installation
	Fixed: All MySQL secure installation tasks are now done by the i-MSCP installer
	Fixed: i-MSCP must allow usage of remote SQL server
	Fixed: Both imscp-autoinstall and imscp-setup scripts must allow per item reconfiguration
	Fixed: Duplicate entries in sources.list file (Ubuntu)
	Fixed: Do not show any dialog when --noprompt option is used
	Fixed: Make error messages free of any ANSI color and end of line codes in dialog
	Fixed: Uninstall unneeded packages when switching to another server implementation

VENDOR
	Updated: jQuery to v1.9.1
	Updated: jQuery UI to v1.10.0
	Updated: Net_DNS to Net_DNS2 (version 1.3.0)
	Updated: Zend Framework to 1.12.3

TICKETS
	Fixed #064: Nice to have - PHP FPM
	Fixed #191: Defect - proftpd slow login
	Fixed #377: Defect - Some issues with shared mount point
	Fixed #458: Update - NET_DNS to NET_DNS2
	Fixed #463: Bug - Fake duplicate sources in sources.list file (ubuntu)
	Fixed #543: Bug - Dovecot not stopped when switching to courier
	Fixed #544: Bug - An exception have been thrown - magicfile
	Fixed #557: Bug - External mail server - Removing last entry (edit mode) doesn't remove DNS MX record
	Fixed #558: Defect - Unable to edit custom MX DNS records
	Fixed #564: Security Failure - Passwords can be compromised
	Fixed #566: Cosmetics - i18n issues
	Fixed #567: Bug - Shared mount point get deleted even if used by other entity
	Fixed #568: Bug - Unable to delete domain aliases when using shared mount point and HTTP redirection
	Fixed #571: Bug - Proftpd - Unable to restart - Directive collision
	Fixed #572: Defect - Shared mount point - Entity Deletion
	Fixed #581: Task - Add support for MariaDB
	Fixed #583: Bug - Disabling PHP will not prevent user to use it
	Fixed #586: defect - PHP FPM still running when switching to another server
	Fixed #591: Bug - PHP FPM - SSL connection for the panel is not working
	Fixed #593: Bug - Setup (update) is not working
	Fixed #594: Defect - Awstats addon - cron task is not working
	Fixed #595: Enhancement - Allow per item reconfiguration
	Fixed #596: Bug - GUI - External mail server feature not implemented
	Fixed #599: Bug - Ubuntu auto-installer adapter is broken
	Fixed #600: Defect - Custom DNS CNAME to CNAME - Trailing period
	Fixed #601: Bug - Apache + php-fpm - Cannot install specific software
	Fixed #603: Bug - Awstats Addon - cron task is sending messages to stdout
	Fixed #604: Bug - insserv - Script imscp_network is broken: incomplete LSB comment
	Fixed #607: Bug - History of customer stats is limited to 3 years
	Fixed #609: Bug - PHP FPM - Internal Server Error after deleting any domain
	Fixed #610: Cosmetics - i18n issue - Typo
	Fixed #618: Defect - IMAP - Subscribed folders are not re-added to the subscription file
	Fixed #619: Bug - HTTP Redirection - Null field - Update errors
	Fixed #623: Bug - Error on update - Unable to delete etc/apt/preferences.d/imscp file
	Fixed #624: Bug - Setup/Update imscp-autoinstall is broken
	Fixed #625: Defect - Missing file themes/default/images/black/login/stripe.png
	Fixed #629: Unable to change PHP editor settings when editing reseller
	Fixed #631: Defect - Proftpd - Heavy 100% load on login / directorychange
	Fixed #632: Bug - dovecot - Wrong conffile permission after update
	Fixed #634: Bug - i-MSCP update from git master - Error in bind9 server implementation
	Fixed #639: Defect - Setup - Package 'debconf-utils' has no installation candidate
	Fixed #643: Bug - Unable to switch from php-fpm to fastcgi
	Fixed #644: Task - Show specific dialog message when installer cannot run due to backup process
	Fixed #646: Defect - Remote SQL server - The host part of SQL users as created by i-MSCP should be settable
	Fixed #649: Bug - imscp-uninstall syntax error
	Fixed #650: Bug - Error when assigning an existing SQL User to a new database
	Fixed #740: Enhancement - Engine Hook for post domain user creation
	Fixed #742: Bug - Welcome email don't show the correct information
	Fixed #743: Update - Roundcube update available (version 0.9.0)
	Fixed #751: Bug - Installer - Ubuntu 13.04 - php5-suhosin is not available
	Fixed #753: Bug - Backup Restore - Use of uninitialized value $dbname
	Fixed #754: Bug - errors while rebuilding cusomers files (ssl cert)
	Fixed #757: Bug - setup - Problem with SSL certificat
	Fixed #758: Bug - typo in Database.php (line 729)
	Fixed #759: Bug - new account setup with partly wrong vu**** id
	Fixed #760: Bug - No logs or not updated logs in user space since may 22 00:00
	Fixed #763: Bug - Errors in imscp-autoinstall when database is different from 'imscp'

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-rc1.4
------------------------------------------------------------------------------------------------------------------------

2013-01-07: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc1.4

CONFIGS
	Updated: Fcgid configuration files for high-load sites

DISTROS
	Added: Package files for Ubuntu Quantal Quetzal and Ubuntu Raring Ringtail

TICKETS
	Fixed #274: (reopened): Defect - Proftpd limits doesn't work
	Fixed #548: Bug - Missing comment character in configs/debian/fcgi/parts/php5-fcgid-starter.tpl
	Fixed #550: Boolean PHP Values should be set with php_flag and not php_value
	Fixed #551: Bug - Preseed feature is broken
	Fixed #552: Bug - PHP constants are not recognized outside of PHP (such as in Apache vhost files)
	Fixed #555: Cosmetics - Missing translation at reseller level
	Fixed #560: Review - Backup filenames are not windows-friendly
	Fixed #562: Bug - Error in apache_fcgid installer
	Fixed #563: Defect - protected_plugins.php file not in gui/cache
	Fixed #565: Bug - Ftp limits not applied - Proftpd not restarted

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-rc1.3
------------------------------------------------------------------------------------------------------------------------

2012-12-27: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc1.3

SETUP
	Fixed: Any hook function should return 1 on failure
	Fixed: Do not install suexec module when using ITK
	Fixed: Make fcgid as default FastCGI module
	Fixed: Self-signed SSL certificate for i-MSCP must be a wildcard SSL certificate
	Fixed: Self-signed SSL certificate for i-MSCP must use 2048-bit RSA Keys (Minimum recommended)
	Fixed: Suppress warning for self-signed certificate generation (still in log file)
	Fixed: Use of uninitialized value in bitwise or (|) errors

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-rc1.2
------------------------------------------------------------------------------------------------------------------------

2012-12-25: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc1.2

TICKETS
	Fixed #546: Bug - SQL error on first install due to empty reseller list

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-rc1-1
------------------------------------------------------------------------------------------------------------------------

2012-12-25: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc1.1

TICKETS
	Fixed #540: Bug - C-style symbols intead of graphic lines in the autoinstall console
	Fixed #542: Bug - Unable to install addon packages - git is missing

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-rc1
------------------------------------------------------------------------------------------------------------------------

2012-12-24: Laurent Declercq
	RELEASE i-MSCP 1.1.0-rc1

ADDONS
		Moved: Ajaxplorer to packagist.org (composer package)
		Moved: PhpMyAdmin to packagist.org (composer package)
		Moved: Roundcube to packagist.org (composer package)

ENGINE
	Added: i-MSCP own implementation of lsb_release command
	Added: 'nocreate' and 'readonly' options for the iMSCP::Config package
	Added: pbzip2 (parallel bzip2 file compressor) for bzip2 compression algorithm
	Added: progress bar for Debian packages installation
	Added: engine hooks manager
	Added: several hooks in both addons and servers packages (still a lot to add...)
	Fixed: iMSCP::IP - Ips stack not flushed on reset
	Fixed: iMSCP::Bootstrapper - Do not create the imscp.conf file if do not exists, raise error instead

GUI
	Rewritten external mail interface

SETUP
	Added: Backup feature for setup dialog (allow user to step back)
	Added: Base class for autoinstall adapters
	Added: 'buildonly' and 'skippackages' command line options for autoinstall script
	Added: Composer installer for i-MSCP addons
	Added: 'reconfigure', 'preseed', hook-file and 'debug' command line options for both autoinstall and setup scripts
	Fixed: Allow IDN for hostname and base server vhost hostname
	Fixed: Allow to set ip as MySQL server hostname
	Fixed: Do not remove user defined variables in imscp.conf
	Fixed: Do not ask for MySQL server port when using 'localhost'
	Fixed: Do no ask for server to use if only one is available
	Fixed: iMSCP::Dialog::Dialog - Wrong synstax for the 'timeout' option
	Fixed: iMSCP::Dialog::Dialog - Allow both single and double quotes in dialog text boxes
	Fixed: iMSCP::Dialog::Dialog - Allow to set default choice for both radiolist and checklist dialog boxes

TICKETS
	Fixed #350: Defect - Setup - cancel doesn't work for some dialogs
	Fixed #437: Enhancement - Roundcube should use its own database
	Fixed #438: Enhancement - Add defaults switch to autoinstaller
	Fixed #482: Defect - Alias edit forward url not possible. Validation incorrect
	Fixed #499: When deleting a domain alias, the custom DNS records (including those related to external mail server(s)) should be deleted
	Fixed #500: Mail quota edit link has wrong id for alias, subdomain and aliassubs mails.
	Fixed #501: Slow query and wrong traffic count in "Edit Domain"
	Fixed #503: Bug - DNS entries for subdomains are not re-added in db zone file
	Fixed #504: Roundcube 0.8.2
	Fixed #507: Cosmetics - External mail servers features status not show
	Fixed #508: German Umlaut in Custom DNS were shown wrong
	Fixed #509: Tools: PHPMyAdmin 3.5.3 released
	Fixed #511: Enhancement - Show disk usage detail (web, mail, sql) on client side
	Fixed #512: autoresponder: lines in transport file not correct
	Fixed #514: Email forward from domain A to domain B not working
	Fixed #518: Bug - Setup broken
	Fixed #520: Defect - migrateMailboxes: Use of uninitialized value
	Fixed #522: Bug - Subdomain redirects with "https" or "ftp" don't work
	Fixed #524: Update - AjaxPlorer 4.2.3 released
	Fixed #525: Update - phpMyAdmin 3.5.5 released
	Fixed #527: Update - Roundcube 0.8.4 released
	Fixed #532: Review - Database update 53 - ftp password
	Fixed #535: Defect - Roundcube does not work with courier
	Fixed #539: Enhancement - i-MSCP tools - Composer support
	Fixed #541: Task - Move PhpMyAdmin to packagist and make it as addon

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-beta2
------------------------------------------------------------------------------------------------------------------------

2012-09-14: Torsten Widmann
	RELEASE i-MSCP 1.1.0-beta2

ADDONS
	Updated: PhpMyAdmin to version 3.5.3
	Updated: Roundcube to 0.8.2

VENDOR
	Updated: Zend Framework to 1.11.12

TICKETS
	Fixed #433: PHP directive editor: register_globals does not exist in php 5.4.0 and above
	Fixed #453: Wrong Support Ticket System Mailer template
	Fixed #475: Some field-lengths are too short for their content
	Fixed #479: WARNING 00_master_ssl.conf do not exists
	Fixed #481: Fatal Error in create/edit custom DNS entry
	Fixed #483: Autoresponder: Problems displaying umlauts
	Fixed #484: Autoresponder: Table autoreplies_log is not updated after deactivation
	Fixed #486: Malfunction: ProFTP LIMIT directive problem
	Fixed #487: External Mailserver add/edit CNAMES
	Fixed #490: Roundcube missing default folders
	Fixed #491: Security-Update: Roundcube 0.8.1
	Fixed #492: Hosting plans in admin level not complete

------------------------------------------------------------------------------------------------------------------------
i-MSCP 1.1.0-beta1
------------------------------------------------------------------------------------------------------------------------

2012-07-01: Torsten Widmann
	RELEASE i-MSCP 1.1.0-beta1

VENDOR
		Updated: PhpMyAdmin to version 3.5.2
		Updated: AjaxPlorer to 4.2.2
		Updated: Roundcube to 0.7.2

TICKETS
	Fixed #017: Feature - Send mail if quota reached
	Fixed #157: Enhancement - Relaying Domains
	Fixed #163: Enhancement - Add Support for Roundcube Mail (or switch from Squirrel)
	Fixed #213: Enhancement - Bruteforce component - login attemps
	Fixed #313: Enhancement - Some improvements on postfix's master.cf
	Fixed #322: Enhancement - Add possibility to delete more then only one eMail Adress
	Fixed #337: Enhancement - Add possibility to edit per user mail quotas
	Fixed #368: Enhancement - Add custom TXT DNS resource records
	Fixed #387: Enhancement - php.ini modifications to allow the usage of roundcube
	Fixed #402: Task - Ajaxplorer - Not Compatible with php 5.4
	Fixed #403: Defect - Hosting Plan Secure Code doesn't work
	Fixed #404: Defect - Missing translations
	Fixed #405: Bug - Custom message for maintenance mode is always overridden
	Fixed #408: Defect: warning: master.cf: unused parameter: smtpd_override_options=no_address_mappings
	Fixed #413: Defect: dovecot quota config inconsistent
	Fixed #415: Defect - mailbox catchall catching everything.. not what it should..
	Fixed #421: Defect: Adding email account not IDN compatible
	Fixed #423: Malfunction: Ticket-Summary at Reseller-Overview
	Fixed #424: BUG: After deleting alias domain the ftp accounts of this domain still exist
	Fixed #427: Malfunction: DNS Servernames not IDN compatible stored in database
	Fixed #429: Enhancement - TXT entries should allow * as a valid character
	Fixed #432: Awstats static configuration generated when awstats dynamic is enabled
	Fixed #440: Broken installer after External email servers commit
	Fixed #445: Disabling domain and panel's backups does not work
	Fixed #447: External mailserver relay_domains
	Fixed #452: View Support Ticket
	Fixed #456: Wrong welcome message usertype when create client
	Fixed #457: Domain specific apache2 configuration gets deleted in imscp-setup (tx Jadawin)
	Fixed #467: FTP Account, Datamanager-> no autologin in ajax explorer
	Fixed #468: SSL for Customers does not Work since upgrade to beta
