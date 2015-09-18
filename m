From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 14/14] ARM: dts: qs600: Add SD card detect support.
Date: Fri, 18 Sep 2015 13:32:18 +0100
Message-ID: <1442579538-20525-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds SD card detect support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index cc9d942..03784f1 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -29,6 +29,16 @@
 	};
 
 	soc {
+		pinctrl@800000 {
+			card_detect: card_detect {
+				mux {
+					pins = "gpio26";
+					function = "gpio";
+					bias-disable;
+				};
+			};
+		};
+
 		rpm@108000 {
 			regulators {
 				vin_lvs1_3_6-supply = <&pm8921_s4>;
@@ -197,6 +207,9 @@
 			sdcc3: sdcc@12180000 {
 				status = "okay";
 				vmmc-supply = <&v3p3_fixed>;
+				pinctrl-names	= "default";
+				pinctrl-0	= <&card_detect>;
+				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
 			};
 			/* WLAN */
 			sdcc4: sdcc@121c0000 {
-- 
1.9.1
