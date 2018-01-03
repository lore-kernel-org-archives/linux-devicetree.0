From: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6ul: remove unnecessary clocks for cpu-freq
Date: Wed, 3 Jan 2018 19:22:14 +0800
Message-ID: <1514978534-27416-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove unnecessary clocks for cpu-freq driver to
avoid confusion.

Signed-off-by: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 86b3251..fb06a9a 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -86,15 +86,10 @@
 				 <&clks IMX6UL_CA7_SECONDARY_SEL>,
 				 <&clks IMX6UL_CLK_STEP>,
 				 <&clks IMX6UL_CLK_PLL1_SW>,
-				 <&clks IMX6UL_CLK_PLL1_SYS>,
-				 <&clks IMX6UL_PLL1_BYPASS>,
-				 <&clks IMX6UL_CLK_PLL1>,
-				 <&clks IMX6UL_PLL1_BYPASS_SRC>,
-				 <&clks IMX6UL_CLK_OSC>;
+				 <&clks IMX6UL_CLK_PLL1_SYS>;
 			clock-names = "arm", "pll2_bus",  "pll2_pfd2_396m",
 				      "secondary_sel", "step", "pll1_sw",
-				      "pll1_sys", "pll1_bypass", "pll1",
-				      "pll1_bypass_src", "osc";
+				      "pll1_sys";
 			arm-supply = <&reg_arm>;
 			soc-supply = <&reg_soc>;
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
