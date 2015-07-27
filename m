From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 6/7] ARM: dts: apq8064: Add DT support for GSBI6 and for UART pin mux
Date: Mon, 27 Jul 2015 14:52:10 +0100
Message-ID: <1438005130-16519-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Pramod Gurav <pramod.gurav@smartplayin.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Pramod Gurav <pramod.gurav@smartplayin.com>

This change adds DT support for GSBI6 and muxes the gpio pins
as UART lines. Also defines a alias for serial port on these lines.

Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
[Srinivas Kandagatla]: fix pinctrl location and rename alias correctly
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 13 +++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 30 +++++++++++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index cdfcf02..ec6a736 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -7,6 +7,7 @@
 
 	aliases {
 		serial0 = &gsbi7_serial;
+		serial1 = &gsbi6_serial;
 	};
 
 	soc {
@@ -125,6 +126,18 @@
 			};
 		};
 
+		gsbi@16500000 {
+			status = "ok";
+			qcom,mode = <GSBI_PROT_I2C_UART>;
+
+			serial@16540000 {
+				status = "ok";
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart_pins>;
+			};
+		};
+
 		gsbi@16600000 {
 			status = "ok";
 			qcom,mode = <GSBI_PROT_I2C_UART>;
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index da214f1..b7c282b 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -126,6 +126,13 @@
 					function = "gsbi3";
 				};
 			};
+
+			uart_pins: uart_pins {
+				mux {
+					pins = "gpio14", "gpio15", "gpio16", "gpio17";
+					function = "gsbi6";
+				};
+			};
 		};
 
 		intc: interrupt-controller@2000000 {
@@ -248,7 +255,6 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-
 			i2c3: i2c@16280000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x16280000 0x1000>;
@@ -259,6 +265,28 @@
 			};
 		};
 
+		gsbi6: gsbi@16500000 {
+			status = "disabled";
+			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <6>;
+			reg = <0x16500000 0x03>;
+			clocks = <&gcc GSBI6_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			gsbi6_serial: serial@16540000 {
+				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+				reg = <0x16540000 0x100>,
+				      <0x16500000 0x03>;
+				interrupts = <0 156 0x0>;
+				clocks = <&gcc GSBI6_UART_CLK>, <&gcc GSBI6_H_CLK>;
+				clock-names = "core", "iface";
+				status = "disabled";
+			};
+		};
+
 		gsbi7: gsbi@16600000 {
 			status = "disabled";
 			compatible = "qcom,gsbi-v1.0.0";
-- 
1.9.1
