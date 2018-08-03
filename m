From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 3/5] arm: dts: qcom: Move common nodes to ipq8064-v.1.0.dtsi
Date: Fri,  3 Aug 2018 19:40:17 +0530
Message-ID: <1533305419-29152-4-git-send-email-sricharan@codeaurora.org>
References: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

The nodes in ipq8064-ap148.dts currently are common with
boards that we will add next. So move the common data to
ipq8064-v.1.0.dtsi.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 83 ++------------------------------
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi | 65 +++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-ipq8064.dtsi      |  9 ++++
 3 files changed, 77 insertions(+), 80 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
index bcf53e3..f45b05e 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
@@ -2,26 +2,8 @@
 #include "qcom-ipq8064-v1.0.dtsi"
 
 / {
-	model = "Qualcomm IPQ8064/AP148";
-	compatible = "qcom,ipq8064-ap148", "qcom,ipq8064";
-
-	aliases {
-		serial0 = &gsbi4_serial;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-		rsvd@41200000 {
-			reg = <0x41200000 0x300000>;
-			no-map;
-		};
-	};
+	model = "Qualcomm Technologies, Inc. IPQ8064/AP-148";
+	compatible = "qcom,ipq8064-ap148";
 
 	soc {
 		pinmux@800000 {
@@ -30,74 +12,15 @@
 				function = "gsbi4";
 				bias-disable;
 			};
-
-			spi_pins: spi_pins {
-				mux {
-					pins = "gpio18", "gpio19", "gpio21";
-					function = "gsbi5";
-					drive-strength = <10>;
-					bias-none;
-				};
-			};
 		};
 
 		gsbi@16300000 {
-			qcom,mode = <GSBI_PROT_I2C_UART>;
-			status = "ok";
-			serial@16340000 {
-				status = "ok";
-			};
-
-			i2c4: i2c@16380000 {
+			i2c@16380000 {
 				status = "ok";
-
 				clock-frequency = <200000>;
-
 				pinctrl-0 = <&i2c4_pins>;
 				pinctrl-names = "default";
 			};
 		};
-
-		gsbi5: gsbi@1a200000 {
-			qcom,mode = <GSBI_PROT_SPI>;
-			status = "ok";
-
-			spi4: spi@1a280000 {
-				status = "ok";
-				spi-max-frequency = <50000000>;
-
-				pinctrl-0 = <&spi_pins>;
-				pinctrl-names = "default";
-
-				cs-gpios = <&qcom_pinmux 20 0>;
-
-				flash: m25p80@0 {
-					compatible = "s25fl256s1";
-					#address-cells = <1>;
-					#size-cells = <1>;
-					spi-max-frequency = <50000000>;
-					reg = <0>;
-
-					partition@0 {
-						label = "rootfs";
-						reg = <0x0 0x1000000>;
-					};
-
-					partition@1 {
-						label = "scratch";
-						reg = <0x1000000 0x1000000>;
-					};
-				};
-			};
-		};
-
-		sata-phy@1b400000 {
-			status = "ok";
-		};
-
-		sata@29000000 {
-			ports-implemented = <0x1>;
-			status = "ok";
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index e118119..ee32f97 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -1,2 +1,67 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-ipq8064.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ8064-v1.0";
+
+	aliases {
+		serial0 = &gsbi4_serial;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	soc {
+		gsbi@16300000 {
+			qcom,mode = <GSBI_PROT_I2C_UART>;
+			status = "ok";
+
+			serial@16340000 {
+				status = "ok";
+			};
+		};
+
+		gsbi5: gsbi@1a200000 {
+			qcom,mode = <GSBI_PROT_SPI>;
+			status = "ok";
+
+			spi4: spi@1a280000 {
+				status = "ok";
+				spi-max-frequency = <50000000>;
+
+				pinctrl-0 = <&spi_pins>;
+				pinctrl-names = "default";
+
+				cs-gpios = <&qcom_pinmux 20 0>;
+
+				flash: m25p80@0 {
+					compatible = "s25fl256s1";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spi-max-frequency = <50000000>;
+					reg = <0>;
+
+					partition@0 {
+						label = "rootfs";
+						reg = <0x0 0x1000000>;
+					};
+
+					partition@1 {
+						label = "scratch";
+						reg = <0x1000000 0x1000000>;
+					};
+				};
+			};
+		};
+
+		sata-phy@1b400000 {
+			status = "ok";
+		};
+
+		sata@29000000 {
+			ports-implemented = <0x1>;
+			status = "ok";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index e78618e..04cc822 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -144,6 +144,15 @@
 					bias-disable;
 				};
 			};
+
+			spi_pins: spi_pins {
+				mux {
+					pins = "gpio18", "gpio19", "gpio21";
+					function = "gsbi5";
+					drive-strength = <10>;
+					bias-none;
+				};
+			};
 		};
 
 		intc: interrupt-controller@2000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
