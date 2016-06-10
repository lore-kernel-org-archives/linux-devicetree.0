From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] ARM: dts: apq8064: move sdcc3 pinctrls out of baord file
Date: Fri, 10 Jun 2016 10:38:35 +0100
Message-ID: <1465551515-21622-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1465551515-21622-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465551515-21622-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch move sdcc3 pinctrl nodes out of board file, so that
other boards do not duplicate the same thing.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-pins.dtsi           | 20 ++++++++++++++++++++
 .../arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts | 22 +---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
index ca683e5..6b801e7 100644
--- a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
@@ -27,6 +27,26 @@
 		};
 	};
 
+	sdcc3_pins: sdcc3-pin-active {
+		clk {
+			pins = "sdc3_clk";
+			drive-strengh = <8>;
+			bias-disable;
+		};
+
+		cmd {
+			pins = "sdc3_cmd";
+			drive-strengh = <8>;
+			bias-pull-up;
+		};
+
+		data {
+			pins = "sdc3_data";
+			drive-strengh = <8>;
+			bias-pull-up;
+		};
+	};
+
 	ps_hold: ps_hold {
 		mux {
 			pins = "gpio78";
diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
index 93d08b9..ebd675c 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dts
@@ -71,26 +71,6 @@
 			};
 
 
-			sdcc3_pin_a: sdcc3-pin-active {
-				clk {
-					pins = "sdc3_clk";
-					drive-strengh = <8>;
-					bias-disable;
-				};
-
-				cmd {
-					pins = "sdc3_cmd";
-					drive-strengh = <8>;
-					bias-pull-up;
-				};
-
-				data {
-					pins = "sdc3_data";
-					drive-strengh = <8>;
-					bias-pull-up;
-				};
-			};
-
 			sdcc3_cd_pin_a: sdcc3-cd-pin-active {
 				pins = "gpio26";
 				function = "gpio";
@@ -407,7 +387,7 @@
 				cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
 
 				pinctrl-names = "default";
-				pinctrl-0 = <&sdcc3_pin_a>, <&sdcc3_cd_pin_a>;
+				pinctrl-0 = <&sdcc3_pins>, <&sdcc3_cd_pin_a>;
 			};
 		};
 	};
-- 
2.8.3
