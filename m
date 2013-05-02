From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] ARM: dove: add DT parsing for legacy timer
Date: Thu,  2 May 2013 20:25:39 +0200
Message-ID: <1367519140-19716-3-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1367519140-19716-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1367519140-19716-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To allow to move to orion irqchip driver, existing legacy devices
have to map their irqs. This patch adds a node for orion timer and
some init code to map the corresponding irqs. While the device tree
node can stay, the init code will vanish as soon as there is true
device tree support for orion timer.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/arm/boot/dts/dove.dtsi   |    7 ++++++
 arch/arm/mach-dove/board-dt.c |   42 +++++++++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index ea7c5da..433cca1 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -30,6 +30,13 @@
 			marvell,tauros2-cache-features = <0>;
 		};
 
+		timer: timer {
+			compatible = "marvell,orion-timer";
+			reg = <0x20300 0x20>;
+			interrupts = <0>;
+			clocks = <&core_clk 0>;
+		};
+
 		intc: interrupt-controller {
 			compatible = "marvell,orion-intc";
 			interrupt-controller;
diff --git a/arch/arm/mach-dove/board-dt.c b/arch/arm/mach-dove/board-dt.c
index 9df6dd7..cea65b7 100644
--- a/arch/arm/mach-dove/board-dt.c
+++ b/arch/arm/mach-dove/board-dt.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk/mvebu.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_data/usb-ehci-orion.h>
@@ -20,6 +21,7 @@
 #include <mach/pm.h>
 #include <plat/common.h>
 #include <plat/irq.h>
+#include <plat/time.h>
 #include "common.h"
 
 /*
@@ -48,10 +50,42 @@ static void __init dove_legacy_clk_init(void)
 			 of_clk_get_from_provider(&clkspec));
 }
 
-static void __init dove_of_clk_init(void)
+#define BRIDGE_INT_TIMER1_CLR	(~0x0004)
+
+static void __init dove_legacy_timer_init(void)
 {
+	struct device_node *np = of_find_compatible_node(NULL, NULL,
+					 "marvell,orion-timer");
+	struct clk *clk;
+	void __iomem *base;
+	unsigned int tclk, irq;
+
+	/* Setup root of clk tree */
 	mvebu_clocks_init();
 	dove_legacy_clk_init();
+
+	if (!np)
+		panic("missing timer node\n");
+
+	base = of_iomap(np, 0);
+	if (!base)
+		panic("%s: missing reg base for timer\n", np->full_name);
+
+	irq = irq_of_parse_and_map(np, 0);
+	if (!irq)
+		panic("%s: missing irq for timer\n", np->full_name);
+
+	clk = of_clk_get(np, 0);
+	if (IS_ERR(clk))
+		panic("%s: missing clock for timer\n", np->full_name);
+
+	clk_prepare_enable(clk);
+	tclk = clk_get_rate(clk);
+	clk_put(clk);
+
+	orion_time_set_base(base);
+	/* legacy timer init gets bridge reg base */
+	orion_time_init(base - 0x300, BRIDGE_INT_TIMER1_CLR, irq, tclk);
 }
 
 static struct mv643xx_eth_platform_data dove_dt_ge00_data = {
@@ -95,9 +129,6 @@ static void __init dove_dt_init(void)
 #endif
 	dove_setup_cpu_mbus();
 
-	/* Setup root of clk tree */
-	dove_of_clk_init();
-
 	/* Internal devices not ported to DT yet */
 	dove_legacy_ge00_init();
 	dove_pcie_init(1, 1);
@@ -112,9 +143,8 @@ static const char * const dove_dt_board_compat[] = {
 
 DT_MACHINE_START(DOVE_DT, "Marvell Dove (Flattened Device Tree)")
 	.map_io		= dove_map_io,
-	.init_early	= dove_init_early,
 	.init_irq	= orion_dt_init_irq,
-	.init_time	= dove_timer_init,
+	.init_time	= dove_legacy_timer_init,
 	.init_machine	= dove_dt_init,
 	.restart	= dove_restart,
 	.dt_compat	= dove_dt_board_compat,
-- 
1.7.2.5
