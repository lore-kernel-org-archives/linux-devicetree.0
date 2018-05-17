Return-Path: <SRS0=Hy+M=IE=linuxtv.org=mchehab@kernel.org>
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Thu, 17 May 2018 10:22:08 +0000
Subject: [git:media_tree/master] media: dt-bindings: media: Binding document for OV7251 camera sensor
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1fJG4h-0005Ek-Mu@www.linuxtv.org>
To: linuxtv-commits@linuxtv.org
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: dt-bindings: media: Binding document for OV7251 camera sensor
Author:  Todor Tomov <todor.tomov@linaro.org>
Date:    Wed Apr 25 12:20:45 2018 -0400

Add the document for ov7251 device tree binding.

CC: Rob Herring <robh@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 .../devicetree/bindings/media/i2c/ov7251.txt       | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

---

diff --git a/Documentation/devicetree/bindings/media/i2c/ov7251.txt b/Documentation/devicetree/bindings/media/i2c/ov7251.txt
new file mode 100644
index 000000000000..8281151f7493
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov7251.txt
@@ -0,0 +1,52 @@
+* Omnivision 1/7.5-Inch B&W VGA CMOS Digital Image Sensor
+
+The Omnivision OV7251 is a 1/7.5-Inch CMOS active pixel digital image sensor
+with an active array size of 640H x 480V. It is programmable through a serial
+I2C interface.
+
+Required Properties:
+- compatible: Value should be "ovti,ov7251".
+- clocks: Reference to the xclk clock.
+- clock-names: Should be "xclk".
+- clock-frequency: Frequency of the xclk clock.
+- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
+  to the hardware pin XSHUTDOWN which is physically active low.
+- vdddo-supply: Chip digital IO regulator.
+- vdda-supply: Chip analog regulator.
+- vddd-supply: Chip digital core regulator.
+
+The device node shall contain one 'port' child node with a single 'endpoint'
+subnode for its digital output video port, in accordance with the video
+interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+	&i2c1 {
+		...
+
+		ov7251: camera-sensor@60 {
+			compatible = "ovti,ov7251";
+			reg = <0x60>;
+
+			enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&camera_bw_default>;
+
+			clocks = <&clks 200>;
+			clock-names = "xclk";
+			clock-frequency = <24000000>;
+
+			vdddo-supply = <&camera_dovdd_1v8>;
+			vdda-supply = <&camera_avdd_2v8>;
+			vddd-supply = <&camera_dvdd_1v2>;
+
+			port {
+				ov7251_ep: endpoint {
+					clock-lanes = <1>;
+					data-lanes = <0>;
+					remote-endpoint = <&csi0_ep>;
+				};
+			};
+		};
+	};
