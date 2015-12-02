<?php
/**
 * i-MSCP - internet Multi Server Control Panel
 * Copyright (C) 2010-2015 by Laurent Declercq <l.declercq@nuxwin.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

namespace iMSCP\Core;

use iMSCP\Core\Config\FileConfigHandler;
use Zend\ModuleManager\Feature\ConfigProviderInterface;

/**
 * Class Module
 * @package iMSCP\Core
 */
class Module implements ConfigProviderInterface
{
	/**
	 * {@inheritdoc}
	 */
	public function getConfig()
	{
		$moduleConfig = include __DIR__ . '/config/module.config.php';

		if (!($configFilePath = getenv('IMSCP_CONF'))) {
			switch (PHP_OS) {
				case 'FreeBSD':
				case 'OpenBSD':
				case 'NetBSD':
					$configFilePath = '/usr/local/etc/imscp/imscp.conf';
					break;
				default:
					$configFilePath = '/etc/imscp/imscp.conf';
			}
		}

		return array_merge($moduleConfig, (new FileConfigHandler($configFilePath))->toArray());
	}
}