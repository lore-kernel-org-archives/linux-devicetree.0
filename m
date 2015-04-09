From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 10/10] ARM: dts: apq8064 add i2c3 node for panel.
Date: Thu,  9 Apr 2015 09:23:59 +0100
Message-ID: <1428567839-11147-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: galak@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: bjorn.andersson@sonymobile.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds i2c3 node which is used for panel control on IFC6410.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 10 ++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 27 +++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 9bd9dfe..3edd1ce 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -20,6 +20,16 @@
 			};
 		};
 
+		gsbi3: gsbi@16200000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+			i2c3: i2c@16280000 {
+				status = "okay";
+				pinctrl-0 = <&i2c3_pins>;
+				pinctrl-names = "default";
+			};
+		};
+
 		gsbi@12440000 {
 			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C>;
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 2fa979f..b1f574d 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -136,6 +136,13 @@
 					function = "gsbi1";
 				};
 			};
+
+			i2c3_pins: i2c3 {
+				mux {
+					pins = "gpio8", "gpio9";
+					function = "gsbi3";
+				};
+			};
 		};
 
 		intc: interrupt-controller@2000000 {
@@ -249,6 +256,26 @@
 			};
 		};
 
+		gsbi3: gsbi@16200000 {
+			status = "disabled";
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16200000 0x100>;
+			clocks = <&gcc GSBI3_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			i2c3: i2c@16280000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16280000 0x1000>;
+				interrupts = <GIC_SPI 151 IRQ_TYPE_NONE>;
+				clocks = <&gcc GSBI3_QUP_CLK>,
+					 <&gcc GSBI3_H_CLK>;
+				clock-names = "core", "iface";
+			};
+		};
+
 		gsbi7: gsbi@16600000 {
 			status = "disabled";
 			compatible = "qcom,gsbi-v1.0.0";
-- 
1.9.1
