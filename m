From: Grant Likely <grant.likely@secretlab.ca>
Subject: Kobjectify device tree structures
Date: Thu, 21 Mar 2013 11:24:55 +0000
Message-ID: <1363865097-32764-1-git-send-email-grant.likely@secretlab.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

Hi all,

I've reworked the series to use sysfs bin files which has eliminated the
problems with filesize from the first version and results in simpler
code overall. Even though I'm posting both patches now, there can be a
delay between applying the first and the second. After the first one is
applied, if CONFIG_PROC_DEVICETREE is turned off then the new kobject
code will replace /proc/device-tree. If nobody has any problems with the
new interface then the second patch can be applied to drop the old
method.

Aside from /proc/device-tree now being a symlink instead of a directory,
the existing ABI remains unchanged.

g.

 Documentation/ABI/testing/sysfs-firmware-ofw   |   28 ++++++
 arch/arm/boot/dts/testcases/tests-phandle.dtsi |    1 +
 drivers/of/Kconfig                             |   10 +-
 drivers/of/base.c                              |  170 ++++++++++++++++++++-------------
 drivers/of/fdt.c                               |    3 +-
 drivers/of/pdt.c                               |    4 +-
 fs/proc/Makefile                               |    1 -
 fs/proc/proc_devtree.c                         |  243 -----------------------------------------------
 fs/proc/root.c                                 |    3 -
 include/linux/of.h                             |   10 +-
 include/linux/proc_fs.h                        |   16 ----
 11 files changed, 147 insertions(+), 342 deletions(-)
