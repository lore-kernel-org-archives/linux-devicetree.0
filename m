From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: [PATCH V4 3/3] ARM: kirkwood: Define DNS-320/DNS-325 NAND in fdt
Date: Sat, 31 Mar 2012 14:53:05 +0100
Message-ID: <1333201985-2222-4-git-send-email-jm@lentin.co.uk>
References: <1333201985-2222-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1333201985-2222-1-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use devicetree to define NAND partitions. Use D-link partition scheme by
default, to be vaguely compatible with their userland.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
---
Unchanged since V3

 arch/arm/boot/dts/kirkwood-dns320.dts |   35 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/kirkwood-dns325.dts |   35 +++++++++++++++++++++++++++++++++
 arch/arm/mach-kirkwood/board-dnskw.c  |   31 -----------------------------
 3 files changed, 70 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dns320.dts b/arch/arm/boot/dts/kirkwood-dns320.dts
index 78c834f..dc09a73 100644
--- a/arch/arm/boot/dts/kirkwood-dns320.dts
+++ b/arch/arm/boot/dts/kirkwood-dns320.dts
@@ -25,5 +25,40 @@
 			clock-frequency = <166666667>;
 			status = "okay";
 		};
+
+		nand@3000000 {
+			status = "okay";
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "uImage";
+				reg = <0x0100000 0x500000>;
+			};
+
+			partition@600000 {
+				label = "ramdisk";
+				reg = <0x0600000 0x500000>;
+			};
+
+			partition@b00000 {
+				label = "image";
+				reg = <0x0b00000 0x6600000>;
+			};
+
+			partition@7100000 {
+				label = "mini firmware";
+				reg = <0x7100000 0xa00000>;
+			};
+
+			partition@7b00000 {
+				label = "config";
+				reg = <0x7b00000 0x500000>;
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/kirkwood-dns325.dts b/arch/arm/boot/dts/kirkwood-dns325.dts
index 23241ab..c2a5562 100644
--- a/arch/arm/boot/dts/kirkwood-dns325.dts
+++ b/arch/arm/boot/dts/kirkwood-dns325.dts
@@ -20,5 +20,40 @@
 			clock-frequency = <200000000>;
 			status = "okay";
 		};
+
+		nand@3000000 {
+			status = "okay";
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0000000 0x100000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "uImage";
+				reg = <0x0100000 0x500000>;
+			};
+
+			partition@600000 {
+				label = "ramdisk";
+				reg = <0x0600000 0x500000>;
+			};
+
+			partition@b00000 {
+				label = "image";
+				reg = <0x0b00000 0x6600000>;
+			};
+
+			partition@7100000 {
+				label = "mini firmware";
+				reg = <0x7100000 0xa00000>;
+			};
+
+			partition@7b00000 {
+				label = "config";
+				reg = <0x7b00000 0x500000>;
+			};
+		};
 	};
 };
diff --git a/arch/arm/mach-kirkwood/board-dnskw.c b/arch/arm/mach-kirkwood/board-dnskw.c
index 7cb7f6a..dc4e80a 100644
--- a/arch/arm/mach-kirkwood/board-dnskw.c
+++ b/arch/arm/mach-kirkwood/board-dnskw.c
@@ -23,7 +23,6 @@
 #include <linux/gpio_keys.h>
 #include <linux/gpio-fan.h>
 #include <linux/leds.h>
-#include <linux/mtd/physmap.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -32,35 +31,6 @@
 #include "common.h"
 #include "mpp.h"
 
-static struct mtd_partition dnskw_nand_parts[] = {
-	{
-		.name		= "u-boot",
-		.offset		= 0,
-		.size		= SZ_1M,
-		.mask_flags	= MTD_WRITEABLE
-	}, {
-		.name		= "uImage",
-		.offset		= MTDPART_OFS_NXTBLK,
-		.size		= 5 * SZ_1M
-	}, {
-		.name		= "ramdisk",
-		.offset		= MTDPART_OFS_NXTBLK,
-		.size		= 5 * SZ_1M
-	}, {
-		.name		= "image",
-		.offset		= MTDPART_OFS_NXTBLK,
-		.size		= 102 * SZ_1M
-	}, {
-		.name		= "mini firmware",
-		.offset		= MTDPART_OFS_NXTBLK,
-		.size		= 10 * SZ_1M
-	}, {
-		.name		= "config",
-		.offset		= MTDPART_OFS_NXTBLK,
-		.size		= 5 * SZ_1M
-	},
-};
-
 static struct mv643xx_eth_platform_data dnskw_ge00_data = {
 	.phy_addr	= MV643XX_ETH_PHY_ADDR(8),
 };
@@ -272,7 +242,6 @@ static void __init dnskw_gpio_register(unsigned gpio, char *name, int def)
 void __init dnskw_init(void)
 {
 	kirkwood_mpp_conf(dnskw_mpp_config);
-	kirkwood_nand_init(ARRAY_AND_SIZE(dnskw_nand_parts), 25);
 
 	kirkwood_ehci_init();
 	kirkwood_ge00_init(&dnskw_ge00_data);
-- 
1.7.9.1
