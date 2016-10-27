#################################################################################
#
# Lynis spec file
# -----------------
#
# This file helps to create a custom RPM package of Lynis.
#
# Usage:
#
#   Option 1) Build with devkit
#
#   ./lynis-devkit build rpm
#
#
#   Option 2) Manual build
#
#   - Adjust version number (Version:)
#   - Check if you have the directories in your home directory (or adjust topdir)
#   - rpmbuild -ba lynis.spec
#
#   If RPM building fails, check if the required tools are installed.
#
#################################################################################
#
# Copyright 2007-2016, CISOfy
#
# Documentation: https://cisofy.com/documentation/lynis/upgrading/
#
#################################################################################

# Build in home directory of the user
%define _topdir         %{getenv:HOME}/lynis-build/rpmbuild
%define _includedir     /usr/share/lynis/include
%define _pluginsdir     /usr/share/lynis/plugins
%define _dbdir          /usr/share/lynis/db
%define _bindir         /usr/bin

%if 0%{?el6}
 %global _bashcompdir /usr/share/bash-completion/
%else
 %global _bashcompdir %(pkg-config --variable=completionsdir bash-completion)
%endif


Summary:                Security auditing tool for Linux, Mac OS X, and UNIX systems.
Name:                   lynis
Version:                2.4.0
Release:                1
License:                GPL
Group:                  Applications/System
Source:                 lynis-%{version}.tar.gz
BuildRoot:              /tmp/lynis-root
URL:                    https://cisofy.com/
Vendor:                 CISOfy
Packager:               CISOfy <software@cisofy.com>
BuildArch:              noarch

%description
Lynis is an security auditing and hardening tool for UNIX derivatives like Linux, BSD
and Solaris. It performs an in-depth security scan on the system to detect software
and security issues. Besides information related to security, it will also scan for
general system information, installed packages, and possible
configuration issues.

This software is aimed at assisting with automated auditing, configuration management,
software patch management, penetration testing, vulnerability management, and malware
scanning of UNIX-based systems.

Lynis is released as a GPLv3 licensed project and free for everyone to use.
Commercial support and plugins are available via CISOfy.

See https://cisofy.com for a full description and documentation.

%prep
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
mkdir -p $RPM_BUILD_ROOT

# Make directory with our name, instead of with version
%setup -n lynis
#%setup

#%patch

%build

%install
# Install profile
install -d ${RPM_BUILD_ROOT}/etc/lynis
install default.prf ${RPM_BUILD_ROOT}/etc/lynis
# Install binary
install -d ${RPM_BUILD_ROOT}/%{_bindir}
install lynis ${RPM_BUILD_ROOT}/%{_bindir}
# Install man page
install -d ${RPM_BUILD_ROOT}/%{_mandir}/man8
install lynis.8 ${RPM_BUILD_ROOT}/%{_mandir}/man8
# Install functions/includes
install -d ${RPM_BUILD_ROOT}%{_includedir}
install include/* ${RPM_BUILD_ROOT}%{_includedir}
# Install plugins
install -d ${RPM_BUILD_ROOT}%{_pluginsdir}
install plugins/* ${RPM_BUILD_ROOT}%{_pluginsdir}
# Install database files
install -d ${RPM_BUILD_ROOT}%{_dbdir}
install -d ${RPM_BUILD_ROOT}%{_dbdir}/languages
install db/*.db ${RPM_BUILD_ROOT}%{_dbdir}
install db/languages/* ${RPM_BUILD_ROOT}%{_dbdir}/languages

# Bash completion
mkdir -p %{RPM_BUILD_ROOT}%{_bashcompdir}
install -pm644 extras/bash_completion.d/lynis %{RPM_BUILD_ROOT}%{_bashcompdir}/

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"

%files
%defattr(644,root,root,755)
# Binaries
%attr(755, root, root) %{_bindir}/lynis
# Documentation and lynis(8) man page
%doc CHANGELOG.md FAQ LICENSE README
%doc %{_mandir}/man8/lynis.8.gz
# Default profile
/etc/lynis/default.prf
# Databases, functions, plugins
%{_dbdir}/*
%{_includedir}/*
%{_pluginsdir}/*
#%attr(644, root, root) %{_dbdir}/*
#%attr(644, root, root) %{_includedir}/*
#%attr(644, root, root) %{_plugindir}
#%attr(644, root, root) %{_plugindir}/*

%changelog
* Thu Jul 14 2016 Michael Boelen - 2.3.1-1
- New release 2.3.1

* Wed Jul 13 2016 Michael Boelen - 2.3.0-1
- New release 2.3.0

* Tue Jun 22 2016 Michael Boelen - 2.2.1-2
- Added languages directory and renamed changelog

* Tue Jun 07 2016 Michael Boelen - 2.2.1-1
- Adjusted comments

* Mon May 09 2016 Michael Boelen - 2.2.0-2
- Version bump

* Mon Dec 21 2015 Michael Boelen - 2.2.0-1
- Version bump for new release

* Wed May 13 2015 Michael Boelen - 1.1.9-1
- Changed website address, version bump

* Sun Sep 14 2014 Michael Boelen - 1.1.8-1
- Changed permissions with regards of pentest option

* Tue Dec 10 2013 Michael Boelen - 1.1.7-1
- Adjusted website and referenced in documentation

* Wed Dec 04 2013 Michael Boelen - 1.1.6-1
- Adjusted version number, removed TODO file and adjusted permissions

* Mon Jun 16 2008 Michael Boelen - 1.1.5-1
- Fixed database dir variable and setup section

* Sat May 31 2008 Michael Boelen - 1.1.4-1
- Added _dbdir

* Sun May 11 2008 Michael Boelen - 1.1.2-1
- Added _pluginsdir, disabled patches

* Sat Mar 08 2008 Michael Boelen - 1.0.8-1
- initial .spec file

# The End
