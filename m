From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 03/16] arm64: dts: msm8996: add blsp2_uart2 pinctrl nodes.
Date: Fri, 17 Jun 2016 16:14:00 +0100
Message-ID: <1466176454-28084-4-git-send-email-srinivas.kandagatla@linaro.org>
References: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466176454-28084-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds blsp2_uart2 pinctrl nodes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 50 ++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index 4d1dba7..03c1e0d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -62,4 +62,54 @@
 			bias-disable;
 		};
 	};
+
+	blsp2_uart2_2pins_default: blsp2_uart2_2pins {
+		pinmux {
+			function = "blsp_uart9";
+			pins = "gpio49", "gpio50";
+		};
+		pinconf {
+			pins = "gpio49", "gpio50";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart2_2pins_sleep: blsp2_uart2_2pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio49", "gpio50";
+		};
+		pinconf {
+			pins = "gpio49", "gpio50";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart2_4pins_default: blsp2_uart2_4pins {
+		pinmux {
+			function = "blsp_uart9";
+			pins = "gpio49", "gpio50", "gpio51", "gpio52";
+		};
+
+		pinconf {
+			pins = "gpio49", "gpio50", "gpio51", "gpio52";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart2_4pins_sleep: blsp2_uart2_4pins_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio49", "gpio50", "gpio51", "gpio52";
+		};
+
+		pinconf {
+			pins = "gpio49", "gpio50", "gpio51", "gpio52";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
