From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 7/9] ARM: STi: DT: Add STiH407 family tsout0 pinctrl configuration
Date: Wed, 10 Jun 2015 15:04:04 +0100
Message-ID: <1433945046-19855-8-git-send-email-peter.griffin@linaro.org>
References: <1433945046-19855-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433945046-19855-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hugues.fruchet-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

tsout0 channel can be configured for either serial or parallel
data transfer. Both pin configurations are provided.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 87d0722..85cd9fc 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -567,6 +567,34 @@
 					};
 				};
 			};
+
+			tsout0 {
+				pinctrl_tsout0_parallel: tsout0_parallel {
+					st,pins {
+						DATA7 = <&pio12 0 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						DATA6 = <&pio12 1 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						DATA5 = <&pio12 2 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						DATA4 = <&pio12 3 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						DATA3 = <&pio12 4 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						DATA2 = <&pio12 5 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						DATA1 = <&pio12 6 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						DATA0 = <&pio12 7 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						CLKIN = <&pio11 7 ALT3 OUT NICLK 0 CLK_A>;
+						VALID = <&pio11 5 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						ERROR = <&pio11 4 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						PKCLK = <&pio11 6 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+				pinctrl_tsout0_serial: tsout0_serial {
+					st,pins {
+						DATA7 = <&pio12 0 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						CLKIN = <&pio11 7 ALT3 OUT NICLK 0 CLK_A>;
+						VALID = <&pio11 5 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						ERROR = <&pio11 4 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+						PKCLK = <&pio11 6 ALT3 OUT SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+			};
 		};
 
 		pin-controller-front1 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
