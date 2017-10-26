From: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v9 1/2] media:imx274 device tree binding file
Date: Wed, 25 Oct 2017 23:51:02 -0700
Message-ID: <20171026065103.28213-1-leonl@leopardimaging.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The binding file for imx274 CMOS sensor V4l2 driver

Signed-off-by: Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
Acked-by: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v9:
 - add an entry in MAINTAINERS
v8:
 - no changes
v7:
 - no changes
v6:
 - no changes
v5:
 - add 'port' and 'endpoint' information
v4:
 - no changes
v3:
 - remove redundant properties and references
 - document 'reg' property
v2:
 - no changes
---
 .../devicetree/bindings/media/i2c/imx274.txt       | 33 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
new file mode 100644
index 000000000000..80f2e89568e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
@@ -0,0 +1,33 @@
+* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
+
+The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
+an active array size of 3864H x 2202V. It is programmable through I2C
+interface. The I2C address is fixed to 0x1a as per sensor data sheet.
+Image data is sent through MIPI CSI-2, which is configured as 4 lanes
+at 1440 Mbps.
+
+
+Required Properties:
+- compatible: value should be "sony,imx274" for imx274 sensor
+- reg: I2C bus address of the device
+
+Optional Properties:
+- reset-gpios: Sensor reset GPIO
+
+The imx274 device node should contain one 'port' child node with
+an 'endpoint' subnode. For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+	sensor@1a {
+		compatible = "sony,imx274";
+		reg = <0x1a>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reset-gpios = <&gpio_sensor 0 0>;
+		port {
+			sensor_out: endpoint {
+				remote-endpoint = <&csiss_in>;
+			};
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 90230fe020f3..b5927bd4fe1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12486,6 +12486,14 @@ S:	Maintained
 F:	drivers/ssb/
 F:	include/linux/ssb/
 
+SONY IMX274 SENSOR DRIVER
+M:	Leon Luo <leonl-+iDsysdzPxZTt5vwKEO50dBPR1lH4CV8@public.gmane.org>
+L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/imx274.c
+F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
+
 SONY MEMORYSTICK CARD SUPPORT
 M:	Alex Dubov <oakad-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
 W:	http://tifmxx.berlios.de/
-- 
2.14.0.rc1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
