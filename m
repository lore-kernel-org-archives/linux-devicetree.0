From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 04/12] ARM: dts: dragonboard-600c: add board support with serial
Date: Wed, 23 Mar 2016 19:47:22 +0000
Message-ID: <1458762442-9492-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458762366-9233-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support to DragonBoard600 with basic serial ports.
DragonBoard600 is based on APQ8064.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                         |  1 +
 .../arm/boot/dts/qcom-apq8064-dragonboard-600c.dts | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 52b34a0..265941a4 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -532,6 +532,7 @@ dtb-$(CONFIG_ARCH_PRIMA2) += \
 	prima2-evb.dtb
 dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8064-cm-qs600.dtb \
+	qcom-apq8064-dragonboard-600c.dtb \
 	qcom-apq8064-ifc6410.dtb \
 	qcom-apq8064-sony-xperia-yuga.dtb \
 	qcom-apq8064-asus-nexus7-flo.dtb \
diff --git a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
new file mode 100644
index 0000000..e96aab6
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
@@ -0,0 +1,36 @@
+#include "qcom-apq8064-v2.0.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. APQ8064 DragonBoard600c";
+	compatible = "qcom,apq8064-dragonboard600c", "qcom,apq8064";
+
+	aliases {
+		serial0 = &gsbi7_serial;
+		serial1 = &gsbi1_serial;
+	};
+
+	soc {
+		gsbi@12440000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_UART_W_FC>;
+			serial@12450000 {
+				label = "LS-UART1";
+				status = "okay";
+				pinctrl-names = "default";
+				pinctrl-0 = <&gsbi1_uart_4pins>;
+			};
+		};
+
+		/* DEBUG UART  */
+		gsbi@16600000 {
+			status = "okay";
+			qcom,mode = <GSBI_PROT_I2C_UART>;
+			serial@16640000 {
+				label = "LS-UART0";
+				status = "okay";
+				pinctrl-names = "default";
+				pinctrl-0 = <&gsbi7_uart_2pins>;
+			};
+		};
+	};
+};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
