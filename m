From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 10/11] ARM: DT: STiH407: Add RMII pinctrl support
Date: Fri, 11 Sep 2015 18:06:33 +0100
Message-ID: <1441991194-11948-11-git-send-email-peter.griffin@linaro.org>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441991194-11948-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the RMII pinctrl support for the Synopsys
MAC on STiH407 SoCs.

Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 473f2ea..e80cac5 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -256,6 +256,33 @@
 						phyclk = <&pio2 3 ALT1 OUT NICLK 0 CLK_A>;
 					};
 				};
+
+				pinctrl_rmii1: rmii1-0 {
+					st,pins {
+						txd0 = <&pio0 0 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
+						txd1 = <&pio0 1 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
+						txen = <&pio0 5 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
+						mdio = <&pio1 0 ALT1 OUT BYPASS 0>;
+						mdc = <&pio1 1 ALT1 OUT NICLK 0 CLK_A>;
+						mdint = <&pio1 3 ALT1 IN BYPASS 0>;
+						rxd0 = <&pio1 4 ALT1 IN SE_NICLK_IO 0 CLK_B>;
+						rxd1 = <&pio1 5 ALT1 IN SE_NICLK_IO 0 CLK_B>;
+						rxdv = <&pio2 0 ALT1 IN SE_NICLK_IO 0 CLK_B>;
+						rx_er = <&pio2 1 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+
+				pinctrl_rmii1_phyclk: rmii1_phyclk {
+					st,pins {
+						phyclk = <&pio2 3 ALT1 OUT NICLK 0 CLK_A>;
+					};
+				};
+
+				pinctrl_rmii1_phyclk_ext: rmii1_phyclk_ext {
+					st,pins {
+						phyclk = <&pio2 3 ALT2 IN NICLK 0 CLK_A>;
+					};
+				};
 			};
 
 			pwm1 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
