From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/2] ARM: i.MX28: define external RTC crystal frequency in DT
Date: Fri,  8 Nov 2013 14:48:41 +0100
Message-ID: <1383918521-4668-3-git-send-email-mkl__29486.802899237$1383918609$gmane$org@pengutronix.de>
References: <1383918521-4668-1-git-send-email-mkl@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383918521-4668-1-git-send-email-mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

The RTC in the i.MX28 may be clocked with different crystals. Get the rate of
the connected one from the DT.

Signed-off-by: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/imx28-clock.txt | 1 +
 arch/arm/boot/dts/imx28.dtsi                            | 5 +++++
 drivers/clk/mxs/clk-imx28.c                             | 4 +++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/imx28-clock.txt b/Documentation/devicetree/bindings/clock/imx28-clock.txt
index e6587af..c3a9d94 100644
--- a/Documentation/devicetree/bindings/clock/imx28-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx28-clock.txt
@@ -76,6 +76,7 @@ clocks and IDs.
 	usb0_phy	62
 	usb1_phy	63
 	enet_out	64
+	rtc_32k		65
 
 Examples:
 
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 979c37d..6af9094 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -47,6 +47,11 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		xtal-32k {
+			compatible = "fsl,mxs-xtal-32k", "fixed-clock";
+			clock-frequency = <0>;
+		};
+
 		xtal-24m {
 			compatible = "fsl,mxs-xtal-24m", "fixed-clock";
 			clock-frequency = <24000000>;
diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index 874ca4e..b6afeb1 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -144,7 +144,7 @@ enum imx28_clk {
 	clk32k_div, rtc, lradc, spdif_div, clk32k, pwm, uart, ssp0,
 	ssp1, ssp2, ssp3, gpmi, spdif, emi, saif0, saif1, lcdif, etm,
 	fec, can0, can1, usb0, usb1, usb0_phy, usb1_phy, enet_out,
-	clk_max
+	rtc_32k, clk_max
 };
 
 static struct clk *clks[clk_max];
@@ -178,6 +178,8 @@ int __init mx28_clocks_init(void)
 
 		if (of_device_is_compatible(np_tmp, "fsl,mxs-xtal-24m"))
 			clks[ref_xtal] = mxs_clk_fixed("ref_xtal", rate);
+		else if (of_device_is_compatible(np_tmp, "fsl,mxs-xtal-32k"))
+			clks[rtc_32k] = mxs_clk_fixed("rtc_32k", rate);
 	}
 
 	/* if not set, use default frequency */
-- 
1.8.4.rc3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
