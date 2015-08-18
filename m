From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/6] ARM: dts: qs600: remove unnecessary i2c pinctrl nodes in board file.
Date: Tue, 18 Aug 2015 14:10:19 +0100
Message-ID: <1439903419-20275-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch removes unnecessary i2c pinctrl nodes in board file, these
are already defined in the soc specific file qcom-apq8064.dtsi.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index ebde2b7..06b3a70 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -21,15 +21,6 @@
 	};
 
 	soc {
-		pinctrl@800000 {
-			i2c1_pins: i2c1 {
-				mux {
-					pins = "gpio20", "gpio21";
-					function = "gsbi1";
-				};
-			};
-		};
-
 		rpm@108000 {
 			regulators {
 				vin_lvs1_3_6-supply = <&pm8921_s4>;
-- 
1.9.1
