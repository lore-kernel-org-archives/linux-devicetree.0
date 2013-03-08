From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 2/9] ARM: i.MX28: define external RTC crystal in DT
Date: Fri,  8 Mar 2013 10:01:37 +0100
Message-ID: <1362733304-23037-3-git-send-email-s.trumtrar@pengutronix.de>
References: <1362733304-23037-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1362733304-23037-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

The RTC in the i.MX28 may be clocked with different crystals.
Get the rate of the connected one from the DT.

Signed-off-by: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/imx28-clock.txt | 1 +
 arch/arm/boot/dts/imx28.dtsi                            | 6 ++++++
 drivers/clk/mxs/clk-imx28.c                             | 4 +++-
 3 files changed, 10 insertions(+), 1 deletion(-)

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
index b9e3712..0393d3f 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -46,6 +46,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <24000000>;
 		};
+
+		osc32k: rtc-oscillator {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
 	};
 
 	apb@80000000 {
diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index 01048b5..acf2762 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -141,7 +141,7 @@ enum imx28_clk {
 	clk32k_div, rtc, lradc, spdif_div, clk32k, pwm, uart, ssp0,
 	ssp1, ssp2, ssp3, gpmi, spdif, emi, saif0, saif1, lcdif, etm,
 	fec, can0, can1, usb0, usb1, usb0_phy, usb1_phy, enet_out,
-	clk_max
+	rtc_32k, clk_max
 };
 
 static struct clk *clks[clk_max];
@@ -167,6 +167,8 @@ int __init mx28_clocks_init(void)
 
 		if (of_device_is_compatible(np, "fsl,mxs-system"))
 			clks[ref_xtal] = mxs_clk_fixed("ref_xtal", rate);
+		else if (!strncmp(np->name, "rtc-oscillator", strlen("rtc-oscillator")))
+			clks[rtc_32k] = mxs_clk_fixed("rtc32k", rate);
 	}
 
 	/* if not set, guess their frequency */
-- 
1.8.2.rc2
