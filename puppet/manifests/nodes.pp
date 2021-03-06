# Copyright 2013-2014 Brian Bischoff <admin@argilzar.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
node 'combined' {
	package { 'htop' :
		ensure => latest,
	}	
	package { 'git' :
		ensure => latest,
	}	

	host { 'combined.example.com':
	    ensure => 'present',       
    	target => '/etc/hosts',    
    	ip => '127.0.1.1',         
    	host_aliases => ['combined']
	}

	if $use_sabnzbd == 'true' {
		include sabnzbd
	}

	if $::use_sickbeard == 'true'  {
		include sickbeard
	}

	if $::use_couchpotato == 'true' {
		include couchpotato
	}

	if $::use_headphones == 'true' {
		include headphones
	}	

}