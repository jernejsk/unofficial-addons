################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="WiringOP"
PKG_VERSION="bb25d2d"
PKG_REV="1"
PKG_ARCH="arm"
PKG_LICENSE="LGPL"
PKG_SITE="https://github.com/zhaolei/WiringOP"
PKG_GIT_URL="https://github.com/zhaolei/WiringOP.git"
PKG_GIT_BRANCH="h3"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="A module to control Allwinner H3 GPIO channels"
PKG_LONGDESC="A module to control Allwinner H3 GPIO channels"
PKG_DISCLAIMER="this is an unofficial addon. please don't ask for support in openelec forum / irc channel"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.python.script"
PKG_ADDON_PROVIDES=""
PKG_ADDON_PROJECTS="H3"
PKG_ADDON_REPOVERSION="7.0"

PKG_AUTORECONF="no"

PKG_MAINTAINER="Jernej Skrabec (jernej at irc.freenode.net)"

make_target() {
  make -C wiringPi CC="$TARGET_CC" static
  cp wiringPi/libwiringPi.a gpio/
  make -C devLib INCLUDE="-I../wiringPi -I." CC="$TARGET_CC" static
  cp devLib/libwiringPiDev.a gpio/
  make -C gpio INCLUDE="-I../wiringPi -I../devLib" LDFLAGS="-L." CC="$TARGET_CC"
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  cp $PKG_BUILD/gpio/gpio $ADDON_BUILD/$PKG_ADDON_ID/bin
}
