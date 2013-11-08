From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: i.MX28: define ref_xtal frequency in DT
Date: Fri,  8 Nov 2013 14:48:40 +0100
Message-ID: <1383918521-4668-2-git-send-email-mkl@pengutronix.de>
References: <1383918521-4668-1-git-send-email-mkl@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383918521-4668-1-git-send-email-mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Instead of hardcoding the ref_xtal in the clk driver, get it from the DT.

Signed-off-by: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx28.dtsi | 10 ++++++++++
 drivers/clk/mxs/clk-imx28.c  | 18 ++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 7363fde..979c37d 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -43,6 +43,16 @@
 		};
 	};
 
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		xtal-24m {
+			compatible = "fsl,mxs-xtal-24m", "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+	};
+
 	apb@80000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index 4faf0af..874ca4e 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -156,7 +156,7 @@ static enum imx28_clk clks_init_on[] __initdata = {
 
 int __init mx28_clocks_init(void)
 {
-	struct device_node *np;
+	struct device_node *np, *np_tmp;
 	u32 i;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx28-digctl");
@@ -169,7 +169,21 @@ int __init mx28_clocks_init(void)
 
 	clk_misc_init();
 
-	clks[ref_xtal] = mxs_clk_fixed("ref_xtal", 24000000);
+	/* retrieve the crystal's frequencies from device tree */
+	for_each_compatible_node(np_tmp, NULL, "fixed-clock") {
+		u32 rate;
+
+		if (of_property_read_u32(np_tmp, "clock-frequency", &rate))
+			continue;
+
+		if (of_device_is_compatible(np_tmp, "fsl,mxs-xtal-24m"))
+			clks[ref_xtal] = mxs_clk_fixed("ref_xtal", rate);
+	}
+
+	/* if not set, use default frequency */
+	if (!clks[ref_xtal])
+		clks[ref_xtal] = mxs_clk_fixed("ref_xtal", 24000000);
+
 	clks[pll0] = mxs_clk_pll("pll0", "ref_xtal", PLL0CTRL0, 17, 480000000);
 	clks[pll1] = mxs_clk_pll("pll1", "ref_xtal", PLL1CTRL0, 17, 480000000);
 	clks[pll2] = mxs_clk_pll("pll2", "ref_xtal", PLL2CTRL0, 23, 50000000);
-- 
1.8.4.rc3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
