From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 11/15] MIPS: malta: probe pflash via DT
Date: Fri, 22 May 2015 16:51:10 +0100
Message-ID: <1432309875-9712-12-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hannes Reinecke <hare-l3A5Bk7waGM@public.gmane.org>, "Steven J. Hill" <Steven.Hill-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Bart Van Assche <bvanassche-HInyCGIudOg@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the DT nodes required to probe the CFI compatible parallel monitor
flash found on the Malta development board, and remove the platform
code that was previously doing it. Delete the now-empty malta-platform.c
file. Adjust the Malta defconfigs that enable MTD & the pflash/CFI
driver to enable CONFIG_MTD_PHYSMAP_OF rather than CONFIG_MTD_PHYSMAP in
order to preserve their behaviour.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---

 arch/mips/boot/dts/mti/malta.dts            | 25 ++++++++
 arch/mips/configs/malta_defconfig           |  2 +-
 arch/mips/configs/malta_kvm_defconfig       |  2 +-
 arch/mips/configs/malta_kvm_guest_defconfig |  2 +-
 arch/mips/configs/maltaup_xpa_defconfig     |  2 +-
 arch/mips/mti-malta/Makefile                |  2 +-
 arch/mips/mti-malta/malta-platform.c        | 90 -----------------------------
 7 files changed, 30 insertions(+), 95 deletions(-)
 delete mode 100644 arch/mips/mti-malta/malta-platform.c

diff --git a/arch/mips/boot/dts/mti/malta.dts b/arch/mips/boot/dts/mti/malta.dts
index 66df923..9720c66 100644
--- a/arch/mips/boot/dts/mti/malta.dts
+++ b/arch/mips/boot/dts/mti/malta.dts
@@ -117,5 +117,30 @@
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		pflash@1e000000 {
+			compatible = "intel,dt28f160", "cfi-flash";
+			reg = <0x1e000000 0x400000>;
+			bank-width = <4>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			yamon@0 {
+				label = "YAMON";
+				reg = <0x0 0x100000>;
+				read-only;
+			};
+
+			user-fs@100000 {
+				label = "User FS";
+				reg = <0x100000 0x2e0000>;
+			};
+
+			board-config@3e0000 {
+				label = "Board Config";
+				reg = <0x3e0000 0x20000>;
+				read-only;
+			};
+		};
 	};
 };
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 4f0528c..52b00ab 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -230,7 +230,7 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_STAA=y
-CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_UBI=m
 CONFIG_MTD_UBI_GLUEBI=m
 CONFIG_BLK_DEV_FD=m
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 815595d..7199654 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -235,7 +235,7 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_STAA=y
-CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_UBI=m
 CONFIG_MTD_UBI_GLUEBI=m
 CONFIG_BLK_DEV_FD=m
diff --git a/arch/mips/configs/malta_kvm_guest_defconfig b/arch/mips/configs/malta_kvm_guest_defconfig
index 2a0d7b0..9ba7149 100644
--- a/arch/mips/configs/malta_kvm_guest_defconfig
+++ b/arch/mips/configs/malta_kvm_guest_defconfig
@@ -234,7 +234,7 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_STAA=y
-CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_UBI=m
 CONFIG_MTD_UBI_GLUEBI=m
 CONFIG_BLK_DEV_FD=m
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 7d7714c..245bf14 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -231,7 +231,7 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_STAA=y
-CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_UBI=m
 CONFIG_MTD_UBI_GLUEBI=m
 CONFIG_BLK_DEV_FD=m
diff --git a/arch/mips/mti-malta/Makefile b/arch/mips/mti-malta/Makefile
index 1d633fe..357fde1 100644
--- a/arch/mips/mti-malta/Makefile
+++ b/arch/mips/mti-malta/Makefile
@@ -6,7 +6,7 @@
 #   written by Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
 #
 obj-y				:= malta-display.o malta-dt.o malta-dtshim.o malta-init.o \
-				   malta-int.o malta-memory.o malta-platform.o \
+				   malta-int.o malta-memory.o \
 				   malta-reset.o malta-setup.o malta-time.o
 
 obj-$(CONFIG_MIPS_CMP)		+= malta-amon.o
diff --git a/arch/mips/mti-malta/malta-platform.c b/arch/mips/mti-malta/malta-platform.c
deleted file mode 100644
index c41b0e0..0000000
--- a/arch/mips/mti-malta/malta-platform.c
+++ /dev/null
@@ -1,90 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2006, 07 MIPS Technologies, Inc.
- *   written by Ralf Baechle (ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org)
- *     written by Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
- *
- * Copyright (C) 2008 Wind River Systems, Inc.
- *   updated by Tiejun Chen <tiejun.chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
- *
- * 1. Probe driver for the Malta's UART ports:
- *
- *   o 2 ports in the SMC SuperIO
- *   o 1 port in the CBUS UART, a discrete 16550 which normally is only used
- *     for bringups.
- *
- * We don't use 8250_platform.c on Malta as it would result in the CBUS
- * UART becoming ttyS0.
- *
- * 2. Register RTC-CMOS platform device on Malta.
- */
-#include <linux/init.h>
-#include <linux/serial_8250.h>
-#include <linux/mc146818rtc.h>
-#include <linux/module.h>
-#include <linux/irq.h>
-#include <linux/mtd/partitions.h>
-#include <linux/mtd/physmap.h>
-#include <linux/platform_device.h>
-#include <asm/mips-boards/maltaint.h>
-#include <mtd/mtd-abi.h>
-
-static struct mtd_partition malta_mtd_partitions[] = {
-	{
-		.name =		"YAMON",
-		.offset =	0x0,
-		.size =		0x100000,
-		.mask_flags =	MTD_WRITEABLE
-	}, {
-		.name =		"User FS",
-		.offset =	0x100000,
-		.size =		0x2e0000
-	}, {
-		.name =		"Board Config",
-		.offset =	0x3e0000,
-		.size =		0x020000,
-		.mask_flags =	MTD_WRITEABLE
-	}
-};
-
-static struct physmap_flash_data malta_flash_data = {
-	.width		= 4,
-	.nr_parts	= ARRAY_SIZE(malta_mtd_partitions),
-	.parts		= malta_mtd_partitions
-};
-
-static struct resource malta_flash_resource = {
-	.start		= 0x1e000000,
-	.end		= 0x1e3fffff,
-	.flags		= IORESOURCE_MEM
-};
-
-static struct platform_device malta_flash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &malta_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &malta_flash_resource,
-};
-
-static struct platform_device *malta_devices[] __initdata = {
-	&malta_flash_device,
-};
-
-static int __init malta_add_devices(void)
-{
-	int err;
-
-	err = platform_add_devices(malta_devices, ARRAY_SIZE(malta_devices));
-	if (err)
-		return err;
-
-	return 0;
-}
-
-device_initcall(malta_add_devices);
-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
