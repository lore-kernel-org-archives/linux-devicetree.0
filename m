Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49903 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932171AbeBSWgD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 17:36:03 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 1/6] mtd: nand: use Marvell reworked NAND controller driver with all platforms
Date: Mon, 19 Feb 2018 23:35:52 +0100
Message-Id: <20180219223557.2458-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180219223557.2458-1-miquel.raynal@bootlin.com>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Compile marvell_nand.c instead of pxa3xx_nand.c with all PXA based SoCs.
Convert all board files and defconfigs so that the new driver is used
everywhere instead of the old one.

Board files using CONFIG_MTD_NAND_PXA3xx now use CONFIG_MTD_NAND_MARVELL
instead.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 arch/arm/configs/cm_x300_defconfig  | 2 +-
 arch/arm/configs/pxa3xx_defconfig   | 3 +--
 arch/arm/configs/pxa_defconfig      | 2 +-
 arch/arm/configs/raumfeld_defconfig | 2 +-
 arch/arm/mach-mmp/ttc_dkb.c         | 4 ++--
 arch/arm/mach-pxa/cm-x300.c         | 2 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c  | 2 +-
 arch/arm/mach-pxa/colibri.h         | 2 +-
 arch/arm/mach-pxa/littleton.c       | 4 ++--
 arch/arm/mach-pxa/mxm8x10.c         | 4 ++--
 arch/arm/mach-pxa/zylonite.c        | 4 ++--
 11 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
index c0418e03d180..5e349c625b71 100644
--- a/arch/arm/configs/cm_x300_defconfig
+++ b/arch/arm/configs/cm_x300_defconfig
@@ -49,7 +49,7 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_PXA3xx=y
+CONFIG_MTD_NAND_MARVELL=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index bfea6874b0a1..3e0de035ab77 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -32,8 +32,7 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_PXA3xx=y
-CONFIG_MTD_NAND_PXA3xx_BUILTIN=y
+CONFIG_MTD_NAND_MARVELL=y
 CONFIG_MTD_ONENAND=y
 CONFIG_MTD_ONENAND_VERIFY_WRITE=y
 CONFIG_MTD_ONENAND_GENERIC=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 837d0c9c8b0e..5655a1cee87d 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -197,7 +197,7 @@ CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0x4000000
 CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
 CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
 CONFIG_MTD_NAND_SHARPSL=m
-CONFIG_MTD_NAND_PXA3xx=m
+CONFIG_MTD_NAND_MARVELL=m
 CONFIG_MTD_NAND_CM_X270=m
 CONFIG_MTD_NAND_TMIO=m
 CONFIG_MTD_NAND_BRCMNAND=m
diff --git a/arch/arm/configs/raumfeld_defconfig b/arch/arm/configs/raumfeld_defconfig
index 77a56c23c6ef..2dd56e9a484e 100644
--- a/arch/arm/configs/raumfeld_defconfig
+++ b/arch/arm/configs/raumfeld_defconfig
@@ -33,7 +33,7 @@ CONFIG_NFTL=y
 CONFIG_NFTL_RW=y
 CONFIG_MTD_BLOCK2MTD=y
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_PXA3xx=y
+CONFIG_MTD_NAND_MARVELL=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_ISL29003=y
diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
index d90c74fa614d..e0b6073c61a7 100644
--- a/arch/arm/mach-mmp/ttc_dkb.c
+++ b/arch/arm/mach-mmp/ttc_dkb.c
@@ -178,7 +178,7 @@ static struct mv_usb_platform_data ttc_usb_pdata = {
 #endif
 #endif
 
-#if IS_ENABLED(CONFIG_MTD_NAND_PXA3xx)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 static struct pxa3xx_nand_platform_data dkb_nand_info = {
 	.enable_arbiter = 1,
 	.num_cs = 1,
@@ -275,7 +275,7 @@ static void __init ttc_dkb_init(void)
 
 	/* on-chip devices */
 	pxa910_add_uart(1);
-#if IS_ENABLED(CONFIG_MTD_NAND_PXA3xx)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 	pxa910_add_nand(&dkb_nand_info);
 #endif
 
diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
index c487401b6fdb..de1f8c995076 100644
--- a/arch/arm/mach-pxa/cm-x300.c
+++ b/arch/arm/mach-pxa/cm-x300.c
@@ -391,7 +391,7 @@ static void __init cm_x300_init_ac97(void)
 static inline void cm_x300_init_ac97(void) {}
 #endif
 
-#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 static struct mtd_partition cm_x300_nand_partitions[] = {
 	[0] = {
 		.name        = "OBM",
diff --git a/arch/arm/mach-pxa/colibri-pxa3xx.c b/arch/arm/mach-pxa/colibri-pxa3xx.c
index b04431bb4ba7..3018eafd723e 100644
--- a/arch/arm/mach-pxa/colibri-pxa3xx.c
+++ b/arch/arm/mach-pxa/colibri-pxa3xx.c
@@ -110,7 +110,7 @@ void __init colibri_pxa3xx_init_lcd(int bl_pin)
 }
 #endif
 
-#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 static struct mtd_partition colibri_nand_partitions[] = {
 	{
 		.name        = "bootloader",
diff --git a/arch/arm/mach-pxa/colibri.h b/arch/arm/mach-pxa/colibri.h
index 673a131da875..85525d49e321 100644
--- a/arch/arm/mach-pxa/colibri.h
+++ b/arch/arm/mach-pxa/colibri.h
@@ -46,7 +46,7 @@ static inline void colibri_pxa3xx_init_lcd(int bl_pin) {}
 extern void colibri_pxa3xx_init_eth(struct ax_plat_data *plat_data);
 #endif
 
-#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 extern void colibri_pxa3xx_init_nand(void);
 #else
 static inline void colibri_pxa3xx_init_nand(void) {}
diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton.c
index 4105614cc38e..193dccca1086 100644
--- a/arch/arm/mach-pxa/littleton.c
+++ b/arch/arm/mach-pxa/littleton.c
@@ -291,7 +291,7 @@ static void __init littleton_init_mmc(void)
 static inline void littleton_init_mmc(void) {}
 #endif
 
-#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 static struct mtd_partition littleton_nand_partitions[] = {
 	[0] = {
 		.name        = "Bootloader",
@@ -341,7 +341,7 @@ static void __init littleton_init_nand(void)
 }
 #else
 static inline void littleton_init_nand(void) {}
-#endif /* CONFIG_MTD_NAND_PXA3xx || CONFIG_MTD_NAND_PXA3xx_MODULE */
+#endif /* IS_ENABLED(CONFIG_MTD_NAND_MARVELL) */
 
 #if defined(CONFIG_I2C_PXA) || defined(CONFIG_I2C_PXA_MODULE)
 static struct led_info littleton_da9034_leds[] = {
diff --git a/arch/arm/mach-pxa/mxm8x10.c b/arch/arm/mach-pxa/mxm8x10.c
index f9e3d41a4609..5cc379c0626c 100644
--- a/arch/arm/mach-pxa/mxm8x10.c
+++ b/arch/arm/mach-pxa/mxm8x10.c
@@ -359,7 +359,7 @@ void __init mxm_8x10_ac97_init(void)
 }
 
 /* NAND flash Support */
-#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 #define NAND_BLOCK_SIZE SZ_128K
 #define NB(x)           (NAND_BLOCK_SIZE * (x))
 static struct mtd_partition mxm_8x10_nand_partitions[] = {
@@ -402,7 +402,7 @@ static void __init mxm_8x10_nand_init(void)
 }
 #else
 static inline void mxm_8x10_nand_init(void) {}
-#endif /* CONFIG_MTD_NAND_PXA3xx || CONFIG_MTD_NAND_PXA3xx_MODULE */
+#endif /* IS_ENABLED(CONFIG_MTD_NAND_MARVELL) */
 
 /* Ethernet support: Davicom DM9000 */
 static struct resource dm9k_resources[] = {
diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index 4268552d600d..3a99fc054e96 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -338,7 +338,7 @@ static void __init zylonite_init_keypad(void)
 static inline void zylonite_init_keypad(void) {}
 #endif
 
-#if defined(CONFIG_MTD_NAND_PXA3xx) || defined(CONFIG_MTD_NAND_PXA3xx_MODULE)
+#if IS_ENABLED(CONFIG_MTD_NAND_MARVELL)
 static struct mtd_partition zylonite_nand_partitions[] = {
 	[0] = {
 		.name        = "Bootloader",
@@ -388,7 +388,7 @@ static void __init zylonite_init_nand(void)
 }
 #else
 static inline void zylonite_init_nand(void) {}
-#endif /* CONFIG_MTD_NAND_PXA3xx || CONFIG_MTD_NAND_PXA3xx_MODULE */
+#endif /* IS_ENABLED(CONFIG_MTD_NAND_MARVELL) */
 
 #if defined(CONFIG_USB_OHCI_HCD) || defined(CONFIG_USB_OHCI_HCD_MODULE)
 static struct pxaohci_platform_data zylonite_ohci_info = {
-- 
2.14.1

