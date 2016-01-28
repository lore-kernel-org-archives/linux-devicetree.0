From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/9] arm64: dts: qcom: remove redundant spi cs pins from pinconf
Date: Thu, 28 Jan 2016 17:43:15 +0000
Message-ID: <1454002995-3162-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1454002960-3106-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454002960-3106-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch removes redundant pins from spi pinconf as these are already
specified in pinconf_cs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 955c6f1..3bd917e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -110,7 +110,7 @@
 			pins = "gpio6";
 		};
 		pinconf {
-			pins = "gpio4", "gpio5", "gpio6", "gpio7";
+			pins = "gpio4", "gpio5", "gpio7";
 			drive-strength = <12>;
 			bias-disable;
 		};
@@ -144,7 +144,7 @@
 			pins = "gpio10";
 		};
 		pinconf {
-			pins = "gpio8", "gpio9", "gpio10", "gpio11";
+			pins = "gpio8", "gpio9", "gpio11";
 			drive-strength = <12>;
 			bias-disable;
 		};
@@ -178,7 +178,7 @@
 			pins = "gpio14";
 		};
 		pinconf {
-			pins = "gpio12", "gpio13", "gpio14", "gpio15";
+			pins = "gpio12", "gpio13", "gpio15";
 			drive-strength = <12>;
 			bias-disable;
 		};
@@ -212,7 +212,7 @@
 			pins = "gpio18";
 		};
 		pinconf {
-			pins = "gpio16", "gpio17", "gpio18", "gpio19";
+			pins = "gpio16", "gpio17", "gpio19";
 			drive-strength = <12>;
 			bias-disable;
 		};
@@ -246,7 +246,7 @@
 			pins = "gpio22";
 		};
 		pinconf {
-			pins = "gpio20", "gpio21", "gpio22", "gpio23";
+			pins = "gpio20", "gpio21", "gpio23";
 			drive-strength = <12>;
 			bias-disable;
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
