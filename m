From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 1/5] arm: dts: qcom: Add pcie nodes for ipq8064
Date: Fri,  3 Aug 2018 19:40:15 +0530
Message-ID: <1533305419-29152-2-git-send-email-sricharan@codeaurora.org>
References: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Adding the pcie nodes and pins.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 182 ++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 70790ac..e02d588 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -2,8 +2,11 @@
 /dts-v1/;
 
 #include "skeleton.dtsi"
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
 #include <dt-bindings/clock/qcom,lcc-ipq806x.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/reset/qcom,gcc-ipq806x.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -114,6 +117,33 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+
+			pcie0_pins: pcie0_pinmux {
+				mux {
+					pins = "gpio3";
+					function = "pcie1_rst";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			pcie1_pins: pcie1_pinmux {
+				mux {
+					pins = "gpio48";
+					function = "pcie2_rst";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			pcie2_pins: pcie2_pinmux {
+				mux {
+					pins = "gpio63";
+					function = "pcie3_rst";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
 		};
 
 		intc: interrupt-controller@2000000 {
@@ -373,5 +403,157 @@
 			#reset-cells = <1>;
 		};
 
+		pcie0: pci@1b500000 {
+			compatible = "qcom,pcie-ipq8064";
+			reg = <0x1b500000 0x1000
+			       0x1b502000 0x80
+			       0x1b600000 0x100
+			       0x0ff00000 0x100000>;
+			reg-names = "dbi", "elbi", "parf", "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0 0x0fe00000 0x0fe00000 0 0x00100000   /* downstream I/O */
+				  0x82000000 0 0x08000000 0x08000000 0 0x07e00000>; /* non-prefetchable memory */
+
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 36 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 37 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 38 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 39 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+			clocks = <&gcc PCIE_A_CLK>,
+				 <&gcc PCIE_H_CLK>,
+				 <&gcc PCIE_PHY_CLK>,
+				 <&gcc PCIE_AUX_CLK>,
+				 <&gcc PCIE_ALT_REF_CLK>;
+			clock-names = "core", "iface", "phy", "aux", "ref";
+
+			assigned-clocks = <&gcc PCIE_ALT_REF_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc PCIE_ACLK_RESET>,
+				 <&gcc PCIE_HCLK_RESET>,
+				 <&gcc PCIE_POR_RESET>,
+				 <&gcc PCIE_PCI_RESET>,
+				 <&gcc PCIE_PHY_RESET>,
+				 <&gcc PCIE_EXT_RESET>;
+			reset-names = "axi", "ahb", "por", "pci", "phy", "ext";
+
+			pinctrl-0 = <&pcie0_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+			perst-gpio = <&qcom_pinmux 3 GPIO_ACTIVE_LOW>;
+		};
+
+		pcie1: pci@1b700000 {
+			compatible = "qcom,pcie-ipq8064";
+			reg = <0x1b700000 0x1000
+			       0x1b702000 0x80
+			       0x1b800000 0x100
+			       0x31f00000 0x100000>;
+			reg-names = "dbi", "elbi", "parf", "config";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0 0x31e00000 0x31e00000 0 0x00100000   /* downstream I/O */
+				  0x82000000 0 0x2e000000 0x2e000000 0 0x03e00000>; /* non-prefetchable memory */
+
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 58 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 59 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 60 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 61 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+			clocks = <&gcc PCIE_1_A_CLK>,
+				 <&gcc PCIE_1_H_CLK>,
+				 <&gcc PCIE_1_PHY_CLK>,
+				 <&gcc PCIE_1_AUX_CLK>,
+				 <&gcc PCIE_1_ALT_REF_CLK>;
+			clock-names = "core", "iface", "phy", "aux", "ref";
+
+			assigned-clocks = <&gcc PCIE_1_ALT_REF_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc PCIE_1_ACLK_RESET>,
+				 <&gcc PCIE_1_HCLK_RESET>,
+				 <&gcc PCIE_1_POR_RESET>,
+				 <&gcc PCIE_1_PCI_RESET>,
+				 <&gcc PCIE_1_PHY_RESET>,
+				 <&gcc PCIE_1_EXT_RESET>;
+			reset-names = "axi", "ahb", "por", "pci", "phy", "ext";
+
+			pinctrl-0 = <&pcie1_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+			perst-gpio = <&qcom_pinmux 48 GPIO_ACTIVE_LOW>;
+		};
+
+		pcie2: pci@1b900000 {
+			compatible = "qcom,pcie-ipq8064";
+			reg = <0x1b900000 0x1000
+			       0x1b902000 0x80
+			       0x1ba00000 0x100
+			       0x35f00000 0x100000>;
+			reg-names = "dbi", "elbi", "parf", "config";
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0 0x35e00000 0x35e00000 0 0x00100000   /* downstream I/O */
+				  0x82000000 0 0x32000000 0x32000000 0 0x03e00000>; /* non-prefetchable memory */
+
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 72 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 73 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 74 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 75 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+			clocks = <&gcc PCIE_2_A_CLK>,
+				 <&gcc PCIE_2_H_CLK>,
+				 <&gcc PCIE_2_PHY_CLK>,
+				 <&gcc PCIE_2_AUX_CLK>,
+				 <&gcc PCIE_2_ALT_REF_CLK>;
+			clock-names = "core", "iface", "phy", "aux", "ref";
+
+			assigned-clocks = <&gcc PCIE_2_ALT_REF_CLK>;
+			assigned-clock-rates = <100000000>;
+
+			resets = <&gcc PCIE_2_ACLK_RESET>,
+				 <&gcc PCIE_2_HCLK_RESET>,
+				 <&gcc PCIE_2_POR_RESET>,
+				 <&gcc PCIE_2_PCI_RESET>,
+				 <&gcc PCIE_2_PHY_RESET>,
+				 <&gcc PCIE_2_EXT_RESET>;
+			reset-names = "axi", "ahb", "por", "pci", "phy", "ext";
+
+			pinctrl-0 = <&pcie2_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+			perst-gpio = <&qcom_pinmux 63 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
