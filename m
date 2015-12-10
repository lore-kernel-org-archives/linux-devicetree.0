From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] arm64: dts: apq8016-sbc: add label properties for UART, I2C, and SPI
Date: Thu, 10 Dec 2015 15:21:12 -0600
Message-ID: <1449782473-20880-3-git-send-email-robh@kernel.org>
References: <1449782473-20880-1-git-send-email-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449782473-20880-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add label properties to provide a way to identify UART, I2C and SPI
ports based on their connector names. This follows naming convention in
96boards CE spec. Ports without external connections are not labelled.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 7505fa3..14fafa1 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -28,6 +28,7 @@
 
 	soc {
 		serial@78af000 {
+			label = "LS-UART0";
 			status = "okay";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp1_uart1_default>;
@@ -35,6 +36,7 @@
 		};
 
 		serial@78b0000 {
+			label = "LS-UART1";
 			status = "okay";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp1_uart2_default>;
@@ -43,26 +45,31 @@
 
 		i2c@78b6000 {
 		/* On Low speed expansion */
+			label = "LS-I2C0";
 			status = "okay";
 		};
 
 		i2c@78b8000 {
 		/* On High speed expansion */
+			label = "HS-I2C2";
 			status = "okay";
 		};
 
 		i2c@78ba000 {
 		/* On Low speed expansion */
+			label = "LS-I2C1";
 			status = "okay";
 		};
 
 		spi@78b7000 {
 		/* On High speed expansion */
+			label = "HS-SPI1";
 			status = "okay";
 		};
 
 		spi@78b9000 {
 		/* On Low speed expansion */
+			label = "LS-SPI0";
 			status = "okay";
 		};
 
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
