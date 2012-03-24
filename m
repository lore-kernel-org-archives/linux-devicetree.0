From: Jamie Lentin <jm@lentin.co.uk>
Subject: [PATCH V2 3/3] ARM: kirkwood: Define NAND partitions in dts
Date: Sat, 24 Mar 2012 13:14:36 +0000
Message-ID: <1332594876-8673-4-git-send-email-jm@lentin.co.uk>
References: <1332594876-8673-1-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1332594876-8673-1-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Jason <jason@lakedaemon.net>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Use devicetree to define NAND partitions. Use D-link partition scheme by
default, to be vaguely compatible with their userland.

Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
---
 arch/arm/boot/dts/kirkwood-dns320.dts |   35 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/kirkwood-dns325.dts |   35 +++++++++++++++++++++++++++++++++
 arch/arm/mach-kirkwood/board-dnskw.c  |   31 -----------------------------
 3 files changed, 70 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dns320.dts b/arch/arm/boot/dts/kirkwood-dns320.dts
index 58de7f2..fbf55ff 100644
--- a/arch/arm/boot/dts/kirkwood-dns320.dts
+++ b/arch/arm/boot/dts/kirkwood-dns320.dts
@@ -25,5 +25,40 @@
 			clock-frequency = <166666667>;
 			status = "ok";
 		};
+
+		nand@3000000 {
+			status = "ok";
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
index 79b1133..b6238db 100644
--- a/arch/arm/boot/dts/kirkwood-dns325.dts
+++ b/arch/arm/boot/dts/kirkwood-dns325.dts
@@ -20,5 +20,40 @@
 			clock-frequency = <200000000>;
 			status = "ok";
 		};
+
+		nand@3000000 {
+			status = "ok";
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
