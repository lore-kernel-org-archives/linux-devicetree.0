From: Olimpiu Dejeu <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>
Subject: [PATCH v3 2/2] backlight arcxcnn devicetree bindings for ArcticSand
Date: Fri,  6 Jan 2017 15:48:34 -0500
Message-ID: <1483735714-5500-1-git-send-email-olimpiu@arcticsand.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bdodge-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org, Olimpiu Dejeu <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

backlight: Add devicetree bindings for the Arctic Sand backlight driver
This patch provides devicetree bindings for the Arctic Sand
    driver submitted in the previous patch
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Olimpiu Dejeu <olimpiu-eV7fy4qpoLhpLGFMi4vTTA@public.gmane.org>
---

v2 => v3:
- Version updated to match other patch in set. No other changes.
v1 => v2:
- Version updated to match other patch in set. No other changes.

 .../bindings/leds/backlight/arcxcnn_bl.txt         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
new file mode 100644
index 0000000..a7b6ff2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
@@ -0,0 +1,33 @@
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
+- arc,led-config-0: setting for register ILED_CONFIG_0
+- arc,led-config-1: setting for register ILED_CONFIG_1
+- arc,dim-freq: PWM mode frequence setting (bits [3:0] used)
+- arc,comp-config: setting for register CONFIG_COMP
+- arc,filter-config: setting for register FILTER_CONFIG
+- arc,trim-config: setting for register IMAXTUNE
+
+Note: Optional properties not specified will default to values in IC EPROM
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
