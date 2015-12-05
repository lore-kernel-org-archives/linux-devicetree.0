From: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 2/7] mtd: move partition parsers' Kconfig under a sub-menu
Date: Fri,  4 Dec 2015 21:19:18 -0800
Message-ID: <1449292763-129421-3-git-send-email-computersforpeace@gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Arlott <simon@fire.lp0.eu>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonas Gorski <jogo@openwrt.org>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

For better organization.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/Kconfig            | 134 +----------------------------------------
 drivers/mtd/partitions/Kconfig | 131 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+), 131 deletions(-)
 create mode 100644 drivers/mtd/partitions/Kconfig

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 42cc953309f1..a06e80d24499 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -23,137 +23,9 @@ config MTD_TESTS
 	  WARNING: some of the tests will ERASE entire MTD device which they
 	  test. Do not use these tests unless you really know what you do.
 
-config MTD_REDBOOT_PARTS
-	tristate "RedBoot partition table parsing"
-	---help---
-	  RedBoot is a ROM monitor and bootloader which deals with multiple
-	  'images' in flash devices by putting a table one of the erase
-	  blocks on the device, similar to a partition table, which gives
-	  the offsets, lengths and names of all the images stored in the
-	  flash.
-
-	  If you need code which can detect and parse this table, and register
-	  MTD 'partitions' corresponding to each image in the table, enable
-	  this option.
-
-	  You will still need the parsing functions to be called by the driver
-	  for your particular device. It won't happen automatically. The
-	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
-	  example.
-
-if MTD_REDBOOT_PARTS
-
-config MTD_REDBOOT_DIRECTORY_BLOCK
-	int "Location of RedBoot partition table"
-	default "-1"
-	---help---
-	  This option is the Linux counterpart to the
-	  CYGNUM_REDBOOT_FIS_DIRECTORY_BLOCK RedBoot compile time
-	  option.
-
-	  The option specifies which Flash sectors holds the RedBoot
-	  partition table.  A zero or positive value gives an absolute
-	  erase block number. A negative value specifies a number of
-	  sectors before the end of the device.
-
-	  For example "2" means block number 2, "-1" means the last
-	  block and "-2" means the penultimate block.
-
-config MTD_REDBOOT_PARTS_UNALLOCATED
-	bool "Include unallocated flash regions"
-	help
-	  If you need to register each unallocated flash region as a MTD
-	  'partition', enable this option.
-
-config MTD_REDBOOT_PARTS_READONLY
-	bool "Force read-only for RedBoot system images"
-	help
-	  If you need to force read-only for 'RedBoot', 'RedBoot Config' and
-	  'FIS directory' images, enable this option.
-
-endif # MTD_REDBOOT_PARTS
-
-config MTD_CMDLINE_PARTS
-	tristate "Command line partition table parsing"
-	depends on MTD
-	---help---
-	  Allow generic configuration of the MTD partition tables via the kernel
-	  command line. Multiple flash resources are supported for hardware where
-	  different kinds of flash memory are available.
-
-	  You will still need the parsing functions to be called by the driver
-	  for your particular device. It won't happen automatically. The
-	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
-	  example.
-
-	  The format for the command line is as follows:
-
-	  mtdparts=<mtddef>[;<mtddef]
-	  <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
-	  <partdef> := <size>[@offset][<name>][ro]
-	  <mtd-id>  := unique id used in mapping driver/device
-	  <size>    := standard linux memsize OR "-" to denote all
-	  remaining space
-	  <name>    := (NAME)
-
-	  Due to the way Linux handles the command line, no spaces are
-	  allowed in the partition definition, including mtd id's and partition
-	  names.
-
-	  Examples:
-
-	  1 flash resource (mtd-id "sa1100"), with 1 single writable partition:
-	  mtdparts=sa1100:-
-
-	  Same flash, but 2 named partitions, the first one being read-only:
-	  mtdparts=sa1100:256k(ARMboot)ro,-(root)
-
-	  If unsure, say 'N'.
-
-config MTD_AFS_PARTS
-	tristate "ARM Firmware Suite partition parsing"
-	depends on (ARM || ARM64)
-	---help---
-	  The ARM Firmware Suite allows the user to divide flash devices into
-	  multiple 'images'. Each such image has a header containing its name
-	  and offset/size etc.
-
-	  If you need code which can detect and parse these tables, and
-	  register MTD 'partitions' corresponding to each image detected,
-	  enable this option.
-
-	  You will still need the parsing functions to be called by the driver
-	  for your particular device. It won't happen automatically. The
-	  'physmap' map driver (CONFIG_MTD_PHYSMAP) does this, for example.
-
-config MTD_OF_PARTS
-	tristate "OpenFirmware partitioning information support"
-	default y
-	depends on OF
-	help
-	  This provides a partition parsing function which derives
-	  the partition map from the children of the flash node,
-	  as described in Documentation/devicetree/bindings/mtd/partition.txt.
-
-config MTD_AR7_PARTS
-	tristate "TI AR7 partitioning support"
-	---help---
-	  TI AR7 partitioning support
-
-config MTD_BCM63XX_PARTS
-	tristate "BCM63XX CFE partitioning support"
-	depends on BCM63XX
-	select CRC32
-	help
-	  This provides partions parsing for BCM63xx devices with CFE
-	  bootloaders.
-
-config MTD_BCM47XX_PARTS
-	tristate "BCM47XX partitioning support"
-	depends on BCM47XX || ARCH_BCM_5301X
-	help
-	  This provides partitions parser for devices based on BCM47xx
-	  boards.
+menu "Partition Parsers"
+source "drivers/mtd/partitions/Kconfig"
+endmenu
 
 comment "User Modules And Translation Layers"
 
diff --git a/drivers/mtd/partitions/Kconfig b/drivers/mtd/partitions/Kconfig
new file mode 100644
index 000000000000..0827d7a8be4e
--- /dev/null
+++ b/drivers/mtd/partitions/Kconfig
@@ -0,0 +1,131 @@
+config MTD_REDBOOT_PARTS
+	tristate "RedBoot partition table parsing"
+	---help---
+	  RedBoot is a ROM monitor and bootloader which deals with multiple
+	  'images' in flash devices by putting a table one of the erase
+	  blocks on the device, similar to a partition table, which gives
+	  the offsets, lengths and names of all the images stored in the
+	  flash.
+
+	  If you need code which can detect and parse this table, and register
+	  MTD 'partitions' corresponding to each image in the table, enable
+	  this option.
+
+	  You will still need the parsing functions to be called by the driver
+	  for your particular device. It won't happen automatically. The
+	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
+	  example.
+
+if MTD_REDBOOT_PARTS
+
+config MTD_REDBOOT_DIRECTORY_BLOCK
+	int "Location of RedBoot partition table"
+	default "-1"
+	---help---
+	  This option is the Linux counterpart to the
+	  CYGNUM_REDBOOT_FIS_DIRECTORY_BLOCK RedBoot compile time
+	  option.
+
+	  The option specifies which Flash sectors holds the RedBoot
+	  partition table.  A zero or positive value gives an absolute
+	  erase block number. A negative value specifies a number of
+	  sectors before the end of the device.
+
+	  For example "2" means block number 2, "-1" means the last
+	  block and "-2" means the penultimate block.
+
+config MTD_REDBOOT_PARTS_UNALLOCATED
+	bool "Include unallocated flash regions"
+	help
+	  If you need to register each unallocated flash region as a MTD
+	  'partition', enable this option.
+
+config MTD_REDBOOT_PARTS_READONLY
+	bool "Force read-only for RedBoot system images"
+	help
+	  If you need to force read-only for 'RedBoot', 'RedBoot Config' and
+	  'FIS directory' images, enable this option.
+
+endif # MTD_REDBOOT_PARTS
+
+config MTD_CMDLINE_PARTS
+	tristate "Command line partition table parsing"
+	depends on MTD
+	---help---
+	  Allow generic configuration of the MTD partition tables via the kernel
+	  command line. Multiple flash resources are supported for hardware where
+	  different kinds of flash memory are available.
+
+	  You will still need the parsing functions to be called by the driver
+	  for your particular device. It won't happen automatically. The
+	  SA1100 map driver (CONFIG_MTD_SA1100) has an option for this, for
+	  example.
+
+	  The format for the command line is as follows:
+
+	  mtdparts=<mtddef>[;<mtddef]
+	  <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
+	  <partdef> := <size>[@offset][<name>][ro]
+	  <mtd-id>  := unique id used in mapping driver/device
+	  <size>    := standard linux memsize OR "-" to denote all
+	  remaining space
+	  <name>    := (NAME)
+
+	  Due to the way Linux handles the command line, no spaces are
+	  allowed in the partition definition, including mtd id's and partition
+	  names.
+
+	  Examples:
+
+	  1 flash resource (mtd-id "sa1100"), with 1 single writable partition:
+	  mtdparts=sa1100:-
+
+	  Same flash, but 2 named partitions, the first one being read-only:
+	  mtdparts=sa1100:256k(ARMboot)ro,-(root)
+
+	  If unsure, say 'N'.
+
+config MTD_AFS_PARTS
+	tristate "ARM Firmware Suite partition parsing"
+	depends on (ARM || ARM64)
+	---help---
+	  The ARM Firmware Suite allows the user to divide flash devices into
+	  multiple 'images'. Each such image has a header containing its name
+	  and offset/size etc.
+
+	  If you need code which can detect and parse these tables, and
+	  register MTD 'partitions' corresponding to each image detected,
+	  enable this option.
+
+	  You will still need the parsing functions to be called by the driver
+	  for your particular device. It won't happen automatically. The
+	  'physmap' map driver (CONFIG_MTD_PHYSMAP) does this, for example.
+
+config MTD_OF_PARTS
+	tristate "OpenFirmware partitioning information support"
+	default y
+	depends on OF
+	help
+	  This provides a partition parsing function which derives
+	  the partition map from the children of the flash node,
+	  as described in Documentation/devicetree/bindings/mtd/partition.txt.
+
+config MTD_AR7_PARTS
+	tristate "TI AR7 partitioning support"
+	---help---
+	  TI AR7 partitioning support
+
+config MTD_BCM63XX_PARTS
+	tristate "BCM63XX CFE partitioning support"
+	depends on BCM63XX
+	select CRC32
+	help
+	  This provides partions parsing for BCM63xx devices with CFE
+	  bootloaders.
+
+config MTD_BCM47XX_PARTS
+	tristate "BCM47XX partitioning support"
+	depends on BCM47XX || ARCH_BCM_5301X
+	help
+	  This provides partitions parser for devices based on BCM47xx
+	  boards.
-- 
2.6.0.rc2.230.g3dd15c0
