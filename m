From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH 14/14] ARM: kirkwood: use devicetree to init sata_mv
Date: Wed,  7 Mar 2012 03:44:55 +0000
Message-ID: <8503a766f6f75c9acf49abd66d9cdce54807b2b2.1331090356.git.jason@lakedaemon.net>
References: <cover.1331090356.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
In-Reply-To: <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
References: <cover.1330625877.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
 <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Based on devicetree work by Michael Walle.  Changed compatible property
to "mrvl,orion-sata".

Signed-off-by: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>
Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
 arch/arm/boot/dts/kirkwood-dreamplug.dts |    7 +++++++
 arch/arm/mach-kirkwood/board-dt.c        |    5 -----
 arch/arm/mach-kirkwood/common.c          |   10 ++++++++++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
index f332380..8a28d5b 100644
--- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
+++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
@@ -23,6 +23,13 @@
 		clock-frequency = <200000000>;
 	};
 
+	sata@f1080000 {
+		compatible = "mrvl,orion-sata";
+		reg = <0xf1080000 0x5000>;
+		interrupts = <21>;
+		nr-ports = <1>;
+	};
+
 	ehci@f1050000 {
 		compatible = "mrvl,orion-ehci";
 		reg = <0xf1050000 0x1000>;
diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
index 1034ac7..12dec38 100644
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@ -86,10 +86,6 @@ static struct mv643xx_eth_platform_data dreamplug_ge01_data = {
 	.phy_addr	= MV643XX_ETH_PHY_ADDR(1),
 };
 
-static struct mv_sata_platform_data dreamplug_sata_data = {
-	.n_ports	= 1,
-};
-
 static struct mvsdio_platform_data dreamplug_mvsdio_data = {
 	/* unfortunately the CD signal has not been connected */
 };
@@ -149,7 +145,6 @@ static void __init dreamplug_init(void)
 
 	kirkwood_ge00_init(&dreamplug_ge00_data);
 	kirkwood_ge01_init(&dreamplug_ge01_data);
-	kirkwood_sata_init(&dreamplug_sata_data);
 	kirkwood_sdio_init(&dreamplug_mvsdio_data);
 
 	platform_device_register(&dreamplug_leds);
diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/common.c
index d0e8575..70ee7ac 100644
--- a/arch/arm/mach-kirkwood/common.c
+++ b/arch/arm/mach-kirkwood/common.c
@@ -504,6 +504,16 @@ static int __init kirkwood_clock_gate(void)
 		kirkwood_clk_ctrl |= CGC_USB0;
 		of_node_put(np);
 	}
+
+	np = of_find_compatible_node(NULL, NULL, "mrvl,orion-sata");
+	if (np && of_device_is_available(np)) {
+		int nr_ports;
+		kirkwood_clk_ctrl |= CGC_SATA0;
+		of_property_read_u32(np, "nr-ports", &nr_ports);
+		if (nr_ports > 1)
+			kirkwood_clk_ctrl |= CGC_SATA1;
+		of_node_put(np);
+	}
 #endif
 
 	/* For SATA: first shutdown the phy */
-- 
1.7.3.4
