From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: qcs404: Add QUP I2C and SPI nodes
Date: Sun, 18 Nov 2018 12:01:35 -0800
Message-ID: <20181118200135.25258-4-bjorn.andersson@linaro.org>
References: <20181118200135.25258-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118200135.25258-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define all six QUP controllers, both as SPI and I2C, allowing boards to
enable these as needed. Associated pinmux states are also defined, to
require only pinconf states to be specified by the boards, as they are
enabled.

Note that SPI has not been tested.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 235 +++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ca00987d6400..9d78183cbdd8 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -273,6 +273,38 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			blsp1_i2c0_default: blsp1-i2c0-default {
+				pins = "gpio32", "gpio33";
+				function = "blsp_i2c0";
+			};
+
+			blsp1_i2c1_default: blsp1-i2c1-default {
+				pins = "gpio24", "gpio25";
+				function = "blsp_i2c1";
+			};
+
+			blsp1_i2c2_default: blsp1-i2c2-default {
+				sda {
+					pins = "gpio19";
+					function = "blsp_i2c_sda_a2";
+				};
+
+				scl {
+					pins = "gpio20";
+					function = "blsp_i2c_scl_a2";
+				};
+			};
+
+			blsp1_i2c3_default: blsp1-i2c3-default {
+				pins = "gpio84", "gpio85";
+				function = "blsp_i2c3";
+			};
+
+			blsp1_i2c4_default: blsp1-i2c4-default {
+				pins = "gpio117", "gpio118";
+				function = "blsp_i2c4";
+			};
+
 			blsp1_uart0_default: blsp1-uart0-default {
 				pins = "gpio30", "gpio31", "gpio32", "gpio33";
 				function = "blsp_uart0";
@@ -300,6 +332,41 @@
 				function = "blsp_uart3";
 			};
 
+			blsp2_i2c0_default: blsp2-i2c0-default {
+				pins = "gpio28", "gpio29";
+				function = "blsp_i2c5";
+			};
+
+			blsp1_spi0_default: blsp1-spi0-default {
+				pins = "gpio30", "gpio31", "gpio32", "gpio33";
+				function = "blsp_spi0";
+			};
+
+			blsp1_spi1_default: blsp1-spi1-default {
+				pins = "gpio22", "gpio23", "gpio24", "gpio25";
+				function = "blsp_spi1";
+			};
+
+			blsp1_spi2_default: blsp1-spi2-default {
+				pins = "gpio17", "gpio18", "gpio19", "gpio20";
+				function = "blsp_spi2";
+			};
+
+			blsp1_spi3_default: blsp1-spi3-default {
+				pins = "gpio82", "gpio83", "gpio84", "gpio85";
+				function = "blsp_spi3";
+			};
+
+			blsp1_spi4_default: blsp1-spi4-default {
+				pins = "gpio37", "gpio38", "gpio117", "gpio118";
+				function = "blsp_spi4";
+			};
+
+			blsp2_spi0_default: blsp2-spi0-default {
+				pins = "gpio26", "gpio27", "gpio28", "gpio29";
+				function = "blsp_spi5";
+			};
+
 			blsp2_uart0_default: blsp2-uart0-default {
 				pins = "gpio26", "gpio27", "gpio28", "gpio29";
 				function = "blsp_uart5";
@@ -419,6 +486,146 @@
 			status = "disabled";
 		};
 
+		blsp1_i2c0: i2c@78b5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b5000 0x600>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP0_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_i2c0_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_spi0: spi@78b5000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b5000 0x600>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP0_SPI_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_spi0_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_i2c1: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b6000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_i2c1_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_spi1: spi@78b6000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b6000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_spi1_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_i2c2: i2c@78b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b7000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_i2c2_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_spi2: spi@78b7000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b7000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_spi2_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_i2c3: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b8000 0x600>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_i2c3_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_spi3: spi@78b8000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b8000 0x600>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_spi3_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_i2c4: i2c@78b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b9000 0x600>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_i2c4_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp1_spi4: spi@78b9000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b9000 0x600>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_spi4_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp2_dma: dma@7ac4000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07ac4000 0x17000>;
@@ -444,6 +651,34 @@
 			status = "disabled";
 		};
 
+		blsp2_i2c0: i2c@7af5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x07af5000 0x600>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP0_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp2_i2c0_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp2_spi0: spi@7af5000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x07af5000 0x600>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP0_SPI_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp2_spi0_default>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
2.18.0
