From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: msm8998: Enumerate i2c controllers
Date: Tue, 15 Jan 2019 11:36:23 -0700
Message-ID: <1547577383-13478-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

msm8998 has a dozen i2c controllers which can be used to connect to board
specific peripherals.  Enumerate the controllers so that boards can wire
up as needed.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---

v2:
-relabeled to include a link to the relevant blsp
-corrected the abh clocks for blsp2 instances
-padded the reg addresses to a full 4 bytes

 arch/arm64/boot/dts/qcom/msm8998.dtsi | 180 ++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 8d41b69..ab71e32 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -624,6 +624,186 @@
 			status = "disabled";
 		};
 
+		blsp1_i2c1: i2c@c175000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c175000 0x600>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp1_i2c2: i2c@c176000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c176000 0x600>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp1_i2c3: i2c@c177000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c177000 0x600>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp1_i2c4: i2c@c178000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c178000 0x600>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp1_i2c5: i2c@c179000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c179000 0x600>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp1_i2c6: i2c@c17a000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c17a000 0x600>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp2_i2c7: i2c@c1b5000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b5000 0x600>;
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp2_i2c8: i2c@c1b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b6000 0x600>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp2_i2c9: i2c@c1b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b7000 0x600>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp2_i2c10: i2c@c1b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b8000 0x600>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp2_i2c11: i2c@c1b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c1b9000 0x600>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		blsp2_i2c12: i2c@c1ba000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x0c175000 0x600>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			clock-frequency = <400000>;
+
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		blsp2_uart1: serial@c1b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xc1b0000 0x1000>;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
