From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 12/19] MIPS: SEAD3: Use generic restart-poweroff driver
Date: Fri, 26 Aug 2016 15:17:44 +0100
Message-ID: <20160826141751.13121-13-paul.burton@imgtec.com>
References: <20160826141751.13121-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160826141751.13121-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, devicetree@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Remove the custom platform code to restart when instructed to power off,
instead relying upon the generic restart-poweroff driver probed via DT
to do the same thing.

Remove also the halt implementation, which is incorrect. The generic
MIPS version will hang the system as halt should.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 arch/mips/boot/dts/mti/sead3.dts  |  4 ++++
 arch/mips/configs/sead3_defconfig |  1 +
 arch/mips/mti-sead3/Makefile      |  1 -
 arch/mips/mti-sead3/sead3-reset.c | 31 -------------------------------
 4 files changed, 5 insertions(+), 32 deletions(-)
 delete mode 100644 arch/mips/mti-sead3/sead3-reset.c

diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
index 047ff7a..32a5ab9 100644
--- a/arch/mips/boot/dts/mti/sead3.dts
+++ b/arch/mips/boot/dts/mti/sead3.dts
@@ -103,6 +103,10 @@
 			offset = <0x50>;
 			mask = <0x4d>;
 		};
+
+		poweroff {
+			compatible = "restart-poweroff";
+		};
 	};
 
 	system-controller@1f000200 {
diff --git a/arch/mips/configs/sead3_defconfig b/arch/mips/configs/sead3_defconfig
index 055af30..ab4c465 100644
--- a/arch/mips/configs/sead3_defconfig
+++ b/arch/mips/configs/sead3_defconfig
@@ -81,6 +81,7 @@ CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_SPI=y
 CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_RESTART=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_SENSORS_ADT7475=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
diff --git a/arch/mips/mti-sead3/Makefile b/arch/mips/mti-sead3/Makefile
index 04ea002..ad722c8 100644
--- a/arch/mips/mti-sead3/Makefile
+++ b/arch/mips/mti-sead3/Makefile
@@ -13,6 +13,5 @@ obj-y += sead3-display.o
 obj-y += sead3-dtshim.o
 obj-y += sead3-init.o
 obj-y += sead3-int.o
-obj-y += sead3-reset.o
 obj-y += sead3-setup.o
 obj-y += sead3-time.o
diff --git a/arch/mips/mti-sead3/sead3-reset.c b/arch/mips/mti-sead3/sead3-reset.c
deleted file mode 100644
index 8f548f0..0000000
--- a/arch/mips/mti-sead3/sead3-reset.c
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2012 MIPS Technologies, Inc.  All rights reserved.
- */
-#include <linux/io.h>
-#include <linux/pm.h>
-
-#include <asm/reboot.h>
-
-#define SOFTRES_REG	0x1f000050
-#define GORESET		0x4d
-
-static void mips_machine_halt(void)
-{
-	unsigned int __iomem *softres_reg =
-		ioremap(SOFTRES_REG, sizeof(unsigned int));
-
-	__raw_writel(GORESET, softres_reg);
-}
-
-static int __init mips_reboot_setup(void)
-{
-	_machine_halt = mips_machine_halt;
-	pm_power_off = mips_machine_halt;
-
-	return 0;
-}
-arch_initcall(mips_reboot_setup);
-- 
2.9.3
