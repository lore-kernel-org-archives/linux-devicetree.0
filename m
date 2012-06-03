From: Michael Walle <michael@walle.cc>
Subject: [PATCH 3/3] ARM: kirkwood: use devicetree for SPI on dreamplug
Date: Sun,  3 Jun 2012 22:17:58 +0200
Message-ID: <1338754678-17000-3-git-send-email-michael@walle.cc>
References: <1338754678-17000-1-git-send-email-michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1338754678-17000-1-git-send-email-michael@walle.cc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Michael Walle <michael@walle.cc>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Use the device tree for the SPI driver and partition layout.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/kirkwood-dreamplug.dts |   28 +++++++++++++++++++++
 arch/arm/mach-kirkwood/board-dreamplug.c |   40 ------------------------------
 2 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
index a5376b8..f31d2b5 100644
--- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
+++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
@@ -20,5 +20,33 @@
 			clock-frequency = <200000000>;
 			status = "ok";
 		};
+
+		spi@10600 {
+			status = "okay";
+
+			m25p40@0 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "mx25l1606e";
+				reg = <0>;
+				spi-max-frequency = <50000000>;
+				mode = <0>;
+
+				partition@0 {
+					reg = <0x0 0x80000>;
+					label = "u-boot";
+				};
+
+				partition@100000 {
+					reg = <0x100000 0x10000>;
+					label = "u-boot env";
+				};
+
+				partition@180000 {
+					reg = <0x180000 0x10000>;
+					label = "dtb";
+				};
+			};
+		};
 	};
 };
diff --git a/arch/arm/mach-kirkwood/board-dreamplug.c b/arch/arm/mach-kirkwood/board-dreamplug.c
index 55e357a..b3aba7d 100644
--- a/arch/arm/mach-kirkwood/board-dreamplug.c
+++ b/arch/arm/mach-kirkwood/board-dreamplug.c
@@ -36,42 +36,6 @@
 #include "common.h"
 #include "mpp.h"
 
-struct mtd_partition dreamplug_partitions[] = {
-	{
-		.name	= "u-boot",
-		.size	= SZ_512K,
-		.offset = 0,
-	},
-	{
-		.name	= "u-boot env",
-		.size	= SZ_64K,
-		.offset = SZ_512K + SZ_512K,
-	},
-	{
-		.name	= "dtb",
-		.size	= SZ_64K,
-		.offset = SZ_512K + SZ_512K + SZ_512K,
-	},
-};
-
-static const struct flash_platform_data dreamplug_spi_slave_data = {
-	.type		= "mx25l1606e",
-	.name		= "spi_flash",
-	.parts		= dreamplug_partitions,
-	.nr_parts	= ARRAY_SIZE(dreamplug_partitions),
-};
-
-static struct spi_board_info __initdata dreamplug_spi_slave_info[] = {
-	{
-		.modalias	= "m25p80",
-		.platform_data	= &dreamplug_spi_slave_data,
-		.irq		= -1,
-		.max_speed_hz	= 50000000,
-		.bus_num	= 0,
-		.chip_select	= 0,
-	},
-};
-
 static struct mv643xx_eth_platform_data dreamplug_ge00_data = {
 	.phy_addr	= MV643XX_ETH_PHY_ADDR(0),
 };
@@ -137,10 +101,6 @@ void __init dreamplug_init(void)
 	 */
 	kirkwood_mpp_conf(dreamplug_mpp_config);
 
-	spi_register_board_info(dreamplug_spi_slave_info,
-				ARRAY_SIZE(dreamplug_spi_slave_info));
-	kirkwood_spi_init();
-
 	kirkwood_ehci_init();
 	kirkwood_ge00_init(&dreamplug_ge00_data);
 	kirkwood_ge01_init(&dreamplug_ge01_data);
-- 
1.7.2.5
