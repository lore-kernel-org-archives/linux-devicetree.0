From: Olimpiu Dejeu <olimpiu@arcticsand.com>
Subject: [PATCH 2/2] backlight: arcxcnn: devicetree bindings for ArticSand devices
Date: Wed, 26 Oct 2016 16:30:01 -0400
Message-ID: <1477513801-31350-1-git-send-email-olimpiu@arcticsand.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, jg1.han@samsung.com, Olimpiu Dejeu <olimpiu@arcticsand.com>
List-Id: devicetree@vger.kernel.org

Resubmition of arcxcnn backliught driver bindings with added register
 documentation

Signed-off-by: Olimpiu Dejeu <olimpiu@arcticsand.com>

---
 .../bindings/leds/backlight/arcxcnn_bl.txt         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
new file mode 100644
index 0000000..a7b6ff2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
@@ -0,0 +1,31 @@
+Binding for ArcticSand arc2c0608 LED driver
+
+Required properties:
+- compatible: should be "arc,arc2c0608"
+- reg: slave address
+
+Optional properties:
+- default-brightness: brightness value on boot, value from: 0-4095
+- label: The name of the backlight device
+			See Documentation/devicetree/bindings/leds/common.txt
+- led-sources: List of enabled channels from 0 to 5.
+			See Documentation/devicetree/bindings/leds/common.txt
+
+- arcticsand,led-config-0: setting for register ILED_CONFIG_0
+- arcticsand,led-config-1: setting for register ILED_CONFIG_1
+- arcticsand,dim-freq: PWM mode frequence setting (bits [3:0] used)
+- arcticsand,comp-config: setting for register CONFIG_COMP
+- arcticsand,filter-config: setting for register FILTER_CONFIG
+- arcticsand,trim-config: setting for register IMAXTUNE
+
+Example:
+
+arc2c0608@30 {
+	compatible = "arc,arc2c0608";
+	reg = <0x30>;
+	default-brightness = <500>;
+	label = "lcd-backlight";
+	linux,default-trigger = "backlight";
+	led-sources = <0 1 2 5>;
+};
+
-- 
2.7.4
