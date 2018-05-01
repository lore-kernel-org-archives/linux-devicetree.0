From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 01/15] clk: sunxi-ng: r40: rewrite init code to a
 platform driver
Date: Wed,  2 May 2018 00:12:13 +0800
Message-ID: <20180501161227.2110-2-wens@csie.org>
References: <20180501161227.2110-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

As we need to register a regmap on the R40 CCU, there needs to be a
device structure bound to the CCU device node.

Rewrite the R40 CCU driver initial code to make it a proper platform
driver, thus we will have a platform device bound to it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 39 ++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 933f2e68f42a..c3aa839a453d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -12,7 +12,8 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include "ccu_common.h"
 #include "ccu_reset.h"
@@ -1250,17 +1251,17 @@ static struct ccu_mux_nb sun8i_r40_cpu_nb = {
 	.bypass_index	= 1, /* index of 24 MHz oscillator */
 };
 
-static void __init sun8i_r40_ccu_setup(struct device_node *node)
+static int sun8i_r40_ccu_probe(struct platform_device *pdev)
 {
+	struct resource *res;
 	void __iomem *reg;
 	u32 val;
+	int ret;
 
-	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (IS_ERR(reg)) {
-		pr_err("%s: Could not map the clock registers\n",
-		       of_node_full_name(node));
-		return;
-	}
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	reg = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	/* Force the PLL-Audio-1x divider to 4 */
 	val = readl(reg + SUN8I_R40_PLL_AUDIO_REG);
@@ -1277,7 +1278,9 @@ static void __init sun8i_r40_ccu_setup(struct device_node *node)
 	val &= ~GENMASK(25, 20);
 	writel(val, reg + SUN8I_R40_USB_CLK_REG);
 
-	sunxi_ccu_probe(node, reg, &sun8i_r40_ccu_desc);
+	ret = sunxi_ccu_probe(pdev->dev.of_node, reg, &sun8i_r40_ccu_desc);
+	if (ret)
+		return ret;
 
 	/* Gate then ungate PLL CPU after any rate changes */
 	ccu_pll_notifier_register(&sun8i_r40_pll_cpu_nb);
@@ -1285,6 +1288,20 @@ static void __init sun8i_r40_ccu_setup(struct device_node *node)
 	/* Reparent CPU during PLL CPU rate changes */
 	ccu_mux_notifier_register(pll_cpu_clk.common.hw.clk,
 				  &sun8i_r40_cpu_nb);
+
+	return 0;
 }
-CLK_OF_DECLARE(sun8i_r40_ccu, "allwinner,sun8i-r40-ccu",
-	       sun8i_r40_ccu_setup);
+
+static const struct of_device_id sun8i_r40_ccu_ids[] = {
+	{ .compatible = "allwinner,sun8i-r40-ccu" },
+	{ }
+};
+
+static struct platform_driver sun8i_r40_ccu_driver = {
+	.probe	= sun8i_r40_ccu_probe,
+	.driver	= {
+		.name	= "sun8i-r40-ccu",
+		.of_match_table	= sun8i_r40_ccu_ids,
+	},
+};
+builtin_platform_driver(sun8i_r40_ccu_driver);
-- 
2.17.0
