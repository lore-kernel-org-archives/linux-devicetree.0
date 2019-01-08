Return-Path: <SRS0=uJp/=PQ=gmail.com=akinobu.mita@kernel.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 02/13] media: i2c: mt9m001: dt: add binding for mt9m001
Date: Tue,  8 Jan 2019 23:51:39 +0900
Message-Id: <1546959110-19445-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
References: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Rob Herring <robh@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Add device tree binding documentation for the MT9M001 CMOS image sensor.

Cc: Rob Herring <robh@kernel.org>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
* v2
- Update binding doc suggested by Rob Herring.

 .../devicetree/bindings/media/i2c/mt9m001.txt      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/mt9m001.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m001.txt b/Documentation/devicetree/bindings/media/i2c/mt9m001.txt
new file mode 100644
index 0000000..c920552
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/mt9m001.txt
@@ -0,0 +1,38 @@
+MT9M001: 1/2-Inch Megapixel Digital Image Sensor
+
+The MT9M001 is an SXGA-format with a 1/2-inch CMOS active-pixel digital
+image sensor. It is programmable through I2C interface.
+
+Required Properties:
+
+- compatible: shall be "onnn,mt9m001".
+- clocks: reference to the master clock into sensor
+
+Optional Properties:
+
+- reset-gpios: GPIO handle which is connected to the reset pin of the chip.
+  Active low.
+- standby-gpios: GPIO handle which is connected to the standby pin of the chip.
+  Active high.
+
+The device node must contain one 'port' child node with one 'endpoint' child
+sub-node for its digital output video port, in accordance with the video
+interface bindings defined in:
+Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	&i2c1 {
+		camera-sensor@5d {
+			compatible = "onnn,mt9m001";
+			reg = <0x5d>;
+			reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+			standby-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+			clocks = <&camera_clk>;
+			port {
+				mt9m001_out: endpoint {
+					remote-endpoint = <&vcap_in>;
+				};
+			};
+		};
+	};
-- 
2.7.4
