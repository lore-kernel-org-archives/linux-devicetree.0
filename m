From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3] clk: sunxi: Make the mod0 clk driver also a
 platform driver
Date: Sat, 20 Dec 2014 11:36:49 +0100
Message-ID: <1419071809-22457-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBSFC2WSAKGQEKMEGSSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

With the prcm in sun6i (and some later SoCs) some mod0 clocks are instantiated
through the mfd framework, and as such do not work with of_clk_declare, since
they do not have registers assigned to them yet at of_clk_declare init time.

Silence the error on not finding registers in the of_clk_declare mod0 clk
setup method, and also register mod0-clk support as a platform driver to work
properly with mfd instantiated mod0 clocks.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-New patch in v2 of the sun6i ir support patch-set
Changes in v3:
-Add a comment why sun4i_a10_mod0_setup does not log an error when of_iomap
 fails to get the regs
---
 drivers/clk/sunxi/clk-mod0.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
index 658d74f..bf8fcd8 100644
--- a/drivers/clk/sunxi/clk-mod0.c
+++ b/drivers/clk/sunxi/clk-mod0.c
@@ -17,6 +17,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 
 #include "clk-factors.h"
 
@@ -67,7 +68,7 @@ static struct clk_factors_config sun4i_a10_mod0_config = {
 	.pwidth = 2,
 };
 
-static const struct factors_data sun4i_a10_mod0_data __initconst = {
+static const struct factors_data sun4i_a10_mod0_data = {
 	.enable = 31,
 	.mux = 24,
 	.muxmask = BIT(1) | BIT(0),
@@ -83,8 +84,11 @@ static void __init sun4i_a10_mod0_setup(struct device_node *node)
 
 	reg = of_iomap(node, 0);
 	if (!reg) {
-		pr_err("Could not get registers for mod0-clk: %s\n",
-		       node->name);
+		/*
+		 * This happens with mod0 clk nodes instantiated through
+		 * mfd, as those do not have their resources assigned at
+		 * CLK_OF_DECLARE time yet, so do not print an error.
+		 */
 		return;
 	}
 
@@ -93,6 +97,39 @@ static void __init sun4i_a10_mod0_setup(struct device_node *node)
 }
 CLK_OF_DECLARE(sun4i_a10_mod0, "allwinner,sun4i-a10-mod0-clk", sun4i_a10_mod0_setup);
 
+static int sun4i_a10_mod0_clk_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct resource *r;
+	void __iomem *reg;
+
+	if (!np)
+		return -ENODEV;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	reg = devm_ioremap_resource(&pdev->dev, r);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	sunxi_factors_register(np, &sun4i_a10_mod0_data,
+			       &sun4i_a10_mod0_lock, reg);
+	return 0;
+}
+
+static const struct of_device_id sun4i_a10_mod0_clk_dt_ids[] = {
+	{ .compatible = "allwinner,sun4i-a10-mod0-clk" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver sun4i_a10_mod0_clk_driver = {
+	.driver = {
+		.name = "sun4i-a10-mod0-clk",
+		.of_match_table = sun4i_a10_mod0_clk_dt_ids,
+	},
+	.probe = sun4i_a10_mod0_clk_probe,
+};
+module_platform_driver(sun4i_a10_mod0_clk_driver);
+
 static DEFINE_SPINLOCK(sun5i_a13_mbus_lock);
 
 static void __init sun5i_a13_mbus_setup(struct device_node *node)
-- 
2.1.0
