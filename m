From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 11/13] ARM: dts: db600c: add i2c support
Date: Tue, 12 Apr 2016 10:34:00 +0100
Message-ID: <1460453642-5809-12-git-send-email-srinivas.kandagatla@linaro.org>
References: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds nodes required to enable 4 i2c buses on the board which
are connected to various sensors and eeprom.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
index 8c18a4b..2f0dfff 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
@@ -9,6 +9,10 @@
 	aliases {
 		serial0 = &gsbi7_serial;
 		serial1 = &gsbi1_serial;
+		i2c0 = &gsbi2_i2c;
+		i2c1 = &gsbi3_i2c;
+		i2c2 = &gsbi4_i2c;
+		i2c3 = &gsbi7_i2c;
 	};
 
 	regulators {
@@ -141,6 +145,42 @@
 			};
 		};
 
+		gsbi@12480000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+			i2c@124a0000 {
+				/* On Low speed expansion and Sensors */
+				label = "LS-I2C0";
+				status = "okay";
+			};
+		};
+
+		gsbi@16200000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+			i2c@16280000 {
+			/* On Low speed expansion */
+				status = "okay";
+				label = "LS-I2C1";
+				clock-frequency = <200000>;
+				eeprom@52 {
+					compatible = "atmel,24c128";
+					reg = <0x52>;
+					pagesize = <64>;
+				};
+			};
+		};
+
+		gsbi@16300000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C>;
+			i2c@16380000 {
+				/* On High speed expansion */
+				label = "HS-CAM-I2C3";
+				status = "okay";
+			};
+		};
+
 		/* DEBUG UART  */
 		gsbi@16600000 {
 			status = "okay";
@@ -151,6 +191,12 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&gsbi7_uart_2pins>;
 			};
+
+			i2c@16680000 {
+				/* On High speed expansion */
+				status = "okay";
+				label = "HS-CAM-I2C2";
+			};
 		};
 
 		leds {
-- 
2.5.0
