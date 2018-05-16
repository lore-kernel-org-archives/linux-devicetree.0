From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH V6 04/12] ARM: dts: ipq4019: Add ipq4019-ap.dk04.dtsi
Date: Wed, 16 May 2018 18:19:56 +0530
Message-ID: <1526475004-10341-5-git-send-email-sricharan@codeaurora.org>
References: <1526475004-10341-1-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1526475004-10341-1-git-send-email-sricharan@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, absahu@codeaurora.org, marc.zyngier@arm.com, richardcochran@gmail.com, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add the common parts for the dk04 boards.

Reviewed-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi | 111 ++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |   2 +-
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
new file mode 100644
index 0000000..7c1eb19
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018, The Linux Foundation. All rights reserved.
+
+#include "qcom-ipq4019.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK04.1";
+
+	aliases {
+		serial0 = &blsp1_uart1;
+		serial1 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>; /* 256MB */
+	};
+
+	soc {
+		pinctrl@1000000 {
+			serial_0_pins: serial0-pinmux {
+				pins = "gpio16", "gpio17";
+				function = "blsp_uart0";
+				bias-disable;
+			};
+
+			serial_1_pins: serial1-pinmux {
+				pins = "gpio8", "gpio9",
+					"gpio10", "gpio11";
+				function = "blsp_uart1";
+				bias-disable;
+			};
+
+			spi_0_pins: spi-0-pinmux {
+				pinmux {
+					function = "blsp_spi0";
+					pins = "gpio13", "gpio14", "gpio15";
+					bias-disable;
+				};
+				pinmux_cs {
+					function = "gpio";
+					pins = "gpio12";
+					bias-disable;
+					output-high;
+				};
+			};
+
+			i2c_0_pins: i2c-0-pinmux {
+				pins = "gpio20", "gpio21";
+				function = "blsp_i2c0";
+				bias-disable;
+			};
+
+			nand_pins: nand-pins {
+				pins = "gpio53", "gpio55", "gpio56",
+					"gpio57", "gpio58", "gpio59",
+					"gpio60", "gpio62", "gpio63",
+					"gpio64", "gpio65", "gpio66",
+					"gpio67", "gpio68", "gpio69";
+				function = "qpic";
+			};
+		};
+
+		serial@78af000 {
+			pinctrl-0 = <&serial_0_pins>;
+			pinctrl-names = "default";
+			status = "ok";
+		};
+
+		serial@78b0000 {
+			pinctrl-0 = <&serial_1_pins>;
+			pinctrl-names = "default";
+			status = "ok";
+		};
+
+		dma@7884000 {
+			status = "ok";
+		};
+
+		spi@78b5000 { /* BLSP1 QUP1 */
+			pinctrl-0 = <&spi_0_pins>;
+			pinctrl-names = "default";
+			status = "ok";
+			cs-gpios = <&tlmm 12 0>;
+
+			m25p80@0 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				compatible = "n25q128a11";
+				spi-max-frequency = <24000000>;
+			};
+		};
+
+		pci@40000000 {
+			status = "ok";
+			perst-gpio = <&tlmm 38 0x1>;
+		};
+
+		qpic-nand@79b0000 {
+			pinctrl-0 = <&nand_pins>;
+			pinctrl-names = "default";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 2c4ad7d..815c912 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -307,7 +307,7 @@
 			dma-names = "rx", "tx";
 		};
 
-		serial@78b0000 {
+		blsp1_uart2: serial@78b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x78b0000 0x200>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
