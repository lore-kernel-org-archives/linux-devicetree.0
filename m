From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Add qspi (quad SPI) node
Date: Thu,  4 Oct 2018 18:59:02 -0700
Message-ID: <20181005015902.134192-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Ryan Case <ryandcase@chromium.org>, linux-arm-msm@vger.kernel.org, Girish Mahadevan <girishm@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the Quad SPI controller to the main sdm845 device tree file.
Boards will be expected to assign the proper pinctrl depending on how
many chip selects they have hooked up and how many data lines.

This depends on commit 48735597f7bd ("clk: qcom: Add qspi (Quad SPI)
clock defines for sdm845 to header") to add the needed defines.  It
also shouldn't land until the patch ("dt-bindings: spi: Qualcomm Quad
SPI(QSPI) documentation") [1] lands.

[1] https://lkml.kernel.org/r/20181002214709.162330-1-ryandcase@chromium.org

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b72bdb0a31a5..cfc96262e8dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -822,6 +822,41 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			qspi_clk: qspi-clk {
+				pinmux {
+					pins = "gpio95";
+					function = "qspi_clk";
+				};
+			};
+
+			qspi_cs0: qspi-cs0 {
+				pinmux {
+					pins = "gpio90";
+					function = "qspi_cs";
+				};
+			};
+
+			qspi_cs1: qspi-cs1 {
+				pinmux {
+					pins = "gpio89";
+					function = "qspi_cs";
+				};
+			};
+
+			qspi_data01: qspi-data01 {
+				pinmux-data {
+					pins = "gpio91", "gpio92";
+					function = "qspi_data";
+				};
+			};
+
+			qspi_data12: qspi-data12 {
+				pinmux-data {
+					pins = "gpio93", "gpio94";
+					function = "qspi_data";
+				};
+			};
+
 			qup_i2c0_default: qup-i2c0-default {
 				pinmux {
 					pins = "gpio0", "gpio1";
@@ -1070,6 +1105,18 @@
 			};
 		};
 
+		qspi: qspi@88df000 {
+			compatible = "qcom,sdm845-qspi", "qcom,qspi-v1";
+			reg = <0x88df000 0x600>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface", "core";
+			status = "disabled";
+		};
+
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,sdm845-qusb2-phy";
 			reg = <0x88e2000 0x400>;
-- 
2.19.0.605.g01d371f741-goog
