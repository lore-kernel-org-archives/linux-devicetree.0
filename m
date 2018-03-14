Return-Path: <SRS0=EV7f=GE=codeaurora.org=kramasub@kernel.org>
From: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Subject: [PATCH v4 1/6] dt-bindings: soc: qcom: Add device tree binding for GENI SE
Date: Wed, 14 Mar 2018 17:58:46 -0600
Message-Id: <1521071931-9294-2-git-send-email-kramasub@codeaurora.org>
In-Reply-To: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
To: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de, gregkh@linuxfoundation.org
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Add device tree binding support for the QCOM GENI SE driver.

Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
---
 .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
new file mode 100644
index 0000000..b71b5df
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
@@ -0,0 +1,123 @@
+Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
+
+Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
+is a programmable module for supporting a wide range of serial interfaces
+like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8 Serial
+Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
+Wrapper controller is modeled as a node with zero or more child nodes each
+representing a serial engine.
+
+Required properties:
+- compatible:		Must be "qcom,geni-se-qup".
+- reg:			Must contain QUP register address and length.
+- clock-names:		Must contain "m-ahb" and "s-ahb".
+- clocks:		AHB clocks needed by the device.
+
+Required properties if child node exists:
+- #address-cells: 	Must be <1> for Serial Engine Address
+- #size-cells: 		Must be <1> for Serial Engine Address Size
+- ranges: 		Must be present
+
+Properties for children:
+
+A GENI based QUP wrapper controller node can contain 0 or more child nodes
+representing serial devices.  These serial devices can be a QCOM UART, I2C
+controller, SPI controller, or some combination of aforementioned devices.
+Please refer below the child node definitions for the supported serial
+interface protocols.
+
+Qualcomm Technologies Inc. GENI Serial Engine based I2C Controller
+
+Required properties:
+- compatible:		Must be "qcom,geni-i2c".
+- reg: 			Must contain QUP register address and length.
+- interrupts: 		Must contain I2C interrupt.
+- clock-names: 		Must contain "se".
+- clocks: 		Serial engine core clock needed by the device.
+- #address-cells:	Must be <1> for I2C device address.
+- #size-cells:		Must be <0> as I2C addresses have no size component.
+
+Optional property:
+- clock-frequency:	Desired I2C bus clock frequency in Hz.
+			When missing default to 400000Hz.
+
+Child nodes should conform to I2C bus binding as described in i2c.txt.
+
+Qualcomm Technologies Inc. GENI Serial Engine based UART Controller
+
+Required properties:
+- compatible:		Must be "qcom,geni-debug-uart".
+- reg: 			Must contain UART register location and length.
+- interrupts: 		Must contain UART core interrupts.
+- clock-names:		Must contain "se".
+- clocks:		Serial engine core clock needed by the device.
+
+Qualcomm Technologies Inc. GENI Serial Engine based SPI Controller
+
+Required properties:
+- compatible:		Must contain "qcom,geni-spi".
+- reg:			Must contain SPI register location and length.
+- interrupts:		Must contain SPI controller interrupts.
+- clock-names:		Must contain "se".
+- clocks:		Serial engine core clock needed by the device.
+- spi-max-frequency:	Specifies maximum SPI clock frequency, units - Hz.
+- #address-cells:	Must be <1> to define a chip select address on
+			the SPI bus.
+- #size-cells:		Must be <0>.
+
+Optional property:
+- qcom,rt:		Indicates if the framework worker thread for this
+			controller device should have real-time priority.
+
+SPI slave nodes must be children of the SPI master node and conform to SPI bus
+binding as described in Documentation/devicetree/bindings/spi/spi-bus.txt.
+
+Example:
+	geniqup@8c0000 {
+		compatible = "qcom,geni-se-qup";
+		reg = <0x8c0000 0x6000>;
+		clock-names = "m-ahb", "s-ahb";
+		clocks = <&clock_gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+			<&clock_gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		i2c0: i2c@a94000 {
+			compatible = "qcom,geni-i2c";
+			reg = <0xa94000 0x4000>;
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "se";
+			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S5_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&qup_1_i2c_5_active>;
+			pinctrl-1 = <&qup_1_i2c_5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		uart0: serial@a88000 {
+			compatible = "qcom,geni-debug-uart";
+			reg = <0xa88000 0x7000>;
+			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "se";
+			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&qup_1_uart_3_active>;
+			pinctrl-1 = <&qup_1_uart_3_sleep>;
+		};
+
+		spi0: spi@a84000 {
+			compatible = "qcom,geni-spi";
+			reg = <0xa84000 0x4000>;
+			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "se";
+			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&qup_1_spi_2_active>;
+			pinctrl-1 = <&qup_1_spi_2_sleep>;
+			spi-max-frequency = <19200000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	}
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
