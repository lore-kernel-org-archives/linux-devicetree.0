From: George Joseph <george.joseph@fairview5.com>
Subject: [PATCH v3 1/1] dts: cubox: Map gpio-keys to gpio3 8
Date: Tue, 24 Mar 2015 10:31:35 -0600
Message-ID: <1427214695-16301-2-git-send-email-george.joseph@fairview5.com>
References: <1427214695-16301-1-git-send-email-george.joseph@fairview5.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427214695-16301-1-git-send-email-george.joseph@fairview5.com>
In-Reply-To: <1426542829-16786-1-git-send-email-george.joseph@fairview5.com>
References: <1426542829-16786-1-git-send-email-george.joseph@fairview5.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Cubox has a recessed button between the HDMI and RJ-45 connectors
that wasn't mapped in the device tree, so I've mapped it to gpio-keys
BTN_0.

Signed-off-by: George Joseph <george.joseph@fairview5.com>
Tested-by: George Joseph <george.joseph@fairview5.com>
---
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
index 4303bc0..d033bb1 100644
--- a/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-cubox-i.dtsi
@@ -41,6 +41,8 @@
  */
 #include "imx6qdl-microsom.dtsi"
 #include "imx6qdl-microsom-ar8035.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	ir_recv: ir-receiver {
@@ -104,6 +106,18 @@
 		spdif-controller = <&spdif>;
 		spdif-out;
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&pinctrl_gpio_key>;
+		pinctrl-names = "default";
+
+		button_0 {
+			label = "Button 0";
+			gpios = <&gpio3 8 GPIO_ACTIVE_LOW>;
+			linux,code = <BTN_0>;
+		};
+	};
 };
 
 &hdmi {
@@ -208,6 +222,12 @@
 				MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x13059
 			>;
 		};
+
+		pinctrl_gpio_key: gpio-key {
+			fsl,pins = <
+				MX6QDL_PAD_EIM_DA8__GPIO3_IO08	0x17059
+			>;
+		};
 	};
 };
 
-- 
2.1.0
