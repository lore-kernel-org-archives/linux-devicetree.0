From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 3/3] clk: imx28: add DC-DC clock domain
Date: Mon, 20 Apr 2015 21:45:23 +0000
Message-ID: <1429566323-8263-4-git-send-email-stefan.wahren@i2se.com>
References: <1429566323-8263-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429566323-8263-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@freescale.com>, Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch adds the DC-DC clock domain into the i.MX28 clock driver.
That enables consumers to change DC-DC clock frequency in order to
avoid interferences without changing hardware.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/clk/mxs/clk-imx28.c |   33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index a6c3501..de2c347 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -60,6 +60,18 @@ static void __iomem *digctrl;
 #define DIGCTRL digctrl
 #define BP_SAIF_CLKMUX		10
 
+static void __iomem *powerctrl;
+#define POWERCTRL powerctrl
+#define POWER_MISC		(POWERCTRL + 0x0090)
+
+static const struct clk_div_table dcdc_div_table[] = {
+	{ .val = 0, .div = 16 },
+	{ .val = 1, .div = 24 },
+	{ .val = 2, .div = 20 },
+	{ .val = 3, .div = 25 },
+	{ /* sentinel */ },
+};
+
 /*
  * HW_SAIF_CLKMUX_SEL:
  *  DIRECT(0x0): SAIF0 clock pins selected for SAIF0 input clocks, and SAIF1
@@ -134,6 +146,8 @@ static const char *sel_pll0[] __initconst = { "pll0", "ref_xtal", };
 static const char *cpu_sels[] __initconst = { "cpu_pll", "cpu_xtal", };
 static const char *emi_sels[] __initconst = { "emi_pll", "emi_xtal", };
 static const char *ptp_sels[] __initconst = { "ref_xtal", "pll0", };
+static const char *dcdc_plls[] __initconst = { "pll0", "ref_gpmi", };
+static const char *dcdc_sels[] __initconst = { "ref_xtal", "dcdc_div", };
 
 enum imx28_clk {
 	ref_xtal, pll0, pll1, pll2, ref_cpu, ref_emi, ref_io0, ref_io1,
@@ -145,7 +159,8 @@ enum imx28_clk {
 	clk32k_div, rtc, lradc, spdif_div, clk32k, pwm, uart, ssp0,
 	ssp1, ssp2, ssp3, gpmi, spdif, emi, saif0, saif1, lcdif, etm,
 	fec, can0, can1, usb0, usb1, usb0_phy, usb1_phy, enet_out,
-	clk_max
+	dcdc_pll, dcdc_div, dcdc_sel,
+	clk_max,
 };
 
 static struct clk *clks[clk_max];
@@ -157,13 +172,18 @@ static enum imx28_clk clks_init_on[] __initdata = {
 
 static void __init mx28_clocks_init(struct device_node *np)
 {
-	struct device_node *dcnp;
+	struct device_node *tnp;
 	u32 i;
 
-	dcnp = of_find_compatible_node(NULL, NULL, "fsl,imx28-digctl");
-	digctrl = of_iomap(dcnp, 0);
+	tnp = of_find_compatible_node(NULL, NULL, "fsl,imx28-digctl");
+	digctrl = of_iomap(tnp, 0);
 	WARN_ON(!digctrl);
-	of_node_put(dcnp);
+	of_node_put(tnp);
+
+	tnp = of_find_compatible_node(NULL, NULL, "fsl,imx28-power");
+	powerctrl = of_iomap(tnp, 0);
+	WARN_ON(!powerctrl);
+	of_node_put(tnp);
 
 	clkctrl = of_iomap(np, 0);
 	WARN_ON(!clkctrl);
@@ -235,6 +255,9 @@ static void __init mx28_clocks_init(struct device_node *np)
 	clks[usb0_phy] = clk_register_gate(NULL, "usb0_phy", "pll0", 0, PLL0CTRL0, 18, 0, &mxs_lock);
 	clks[usb1_phy] = clk_register_gate(NULL, "usb1_phy", "pll1", 0, PLL1CTRL0, 18, 0, &mxs_lock);
 	clks[enet_out] = clk_register_gate(NULL, "enet_out", "pll2", 0, ENET, 18, 0, &mxs_lock);
+	clks[dcdc_pll] = mxs_clk_mux("dcdc_pll", POWER_MISC, 6, 1, dcdc_plls, ARRAY_SIZE(dcdc_plls));
+	clks[dcdc_div] = clk_register_divider_table(NULL, "dcdc_div", "dcdc_pll", 0, POWER_MISC, 4, 2, 0, dcdc_div_table, &mxs_lock);
+	clks[dcdc_sel] = mxs_clk_mux("dcdc_sel", POWER_MISC, 0, 1, dcdc_sels, ARRAY_SIZE(dcdc_sels));
 
 	for (i = 0; i < ARRAY_SIZE(clks); i++)
 		if (IS_ERR(clks[i])) {
-- 
1.7.9.5
