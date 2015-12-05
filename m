From: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 1/7] mtd: move partition parsers to drivers/mtd/partitions/
Date: Fri,  4 Dec 2015 21:19:17 -0800
Message-ID: <1449292763-129421-2-git-send-email-computersforpeace@gmail.com>
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
 drivers/mtd/Makefile                       | 8 +-------
 drivers/mtd/partitions/Makefile            | 7 +++++++
 drivers/mtd/{ => partitions}/afs.c         | 0
 drivers/mtd/{ => partitions}/ar7part.c     | 0
 drivers/mtd/{ => partitions}/bcm47xxpart.c | 0
 drivers/mtd/{ => partitions}/bcm63xxpart.c | 0
 drivers/mtd/{ => partitions}/cmdlinepart.c | 0
 drivers/mtd/{ => partitions}/ofpart.c      | 0
 drivers/mtd/{ => partitions}/redboot.c     | 0
 9 files changed, 8 insertions(+), 7 deletions(-)
 create mode 100644 drivers/mtd/partitions/Makefile
 rename drivers/mtd/{ => partitions}/afs.c (100%)
 rename drivers/mtd/{ => partitions}/ar7part.c (100%)
 rename drivers/mtd/{ => partitions}/bcm47xxpart.c (100%)
 rename drivers/mtd/{ => partitions}/bcm63xxpart.c (100%)
 rename drivers/mtd/{ => partitions}/cmdlinepart.c (100%)
 rename drivers/mtd/{ => partitions}/ofpart.c (100%)
 rename drivers/mtd/{ => partitions}/redboot.c (100%)

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 99bb9a1f6e16..1c0cd3b1c7c3 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -6,13 +6,7 @@
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
 
-obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
-obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
-obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
-obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
-obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
-obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
-obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
+obj-y				+= partitions/
 
 # 'Users' - code which presents functionality to userspace.
 obj-$(CONFIG_MTD_BLKDEVS)	+= mtd_blkdevs.o
diff --git a/drivers/mtd/partitions/Makefile b/drivers/mtd/partitions/Makefile
new file mode 100644
index 000000000000..89822f2bfa59
--- /dev/null
+++ b/drivers/mtd/partitions/Makefile
@@ -0,0 +1,7 @@
+obj-$(CONFIG_MTD_OF_PARTS)	+= ofpart.o
+obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
+obj-$(CONFIG_MTD_CMDLINE_PARTS) += cmdlinepart.o
+obj-$(CONFIG_MTD_AFS_PARTS)	+= afs.o
+obj-$(CONFIG_MTD_AR7_PARTS)	+= ar7part.o
+obj-$(CONFIG_MTD_BCM63XX_PARTS)	+= bcm63xxpart.o
+obj-$(CONFIG_MTD_BCM47XX_PARTS)	+= bcm47xxpart.o
diff --git a/drivers/mtd/afs.c b/drivers/mtd/partitions/afs.c
similarity index 100%
rename from drivers/mtd/afs.c
rename to drivers/mtd/partitions/afs.c
diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/partitions/ar7part.c
similarity index 100%
rename from drivers/mtd/ar7part.c
rename to drivers/mtd/partitions/ar7part.c
diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/partitions/bcm47xxpart.c
similarity index 100%
rename from drivers/mtd/bcm47xxpart.c
rename to drivers/mtd/partitions/bcm47xxpart.c
diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/partitions/bcm63xxpart.c
similarity index 100%
rename from drivers/mtd/bcm63xxpart.c
rename to drivers/mtd/partitions/bcm63xxpart.c
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/partitions/cmdlinepart.c
similarity index 100%
rename from drivers/mtd/cmdlinepart.c
rename to drivers/mtd/partitions/cmdlinepart.c
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/partitions/ofpart.c
similarity index 100%
rename from drivers/mtd/ofpart.c
rename to drivers/mtd/partitions/ofpart.c
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/partitions/redboot.c
similarity index 100%
rename from drivers/mtd/redboot.c
rename to drivers/mtd/partitions/redboot.c
-- 
2.6.0.rc2.230.g3dd15c0
