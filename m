Return-Path: <SRS0=Pg3K=NR=linuxtv.org=mchehab@kernel.org>
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Tue, 06 Nov 2018 12:13:14 +0000
Subject: [git:media_tree/master] media: imx214: device tree binding
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1gK0Ic-00067I-4L@www.linuxtv.org>
To: linuxtv-commits@linuxtv.org
Cc: devicetree@vger.kernel.org, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: imx214: device tree binding
Author:  Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:    Fri Oct 5 18:50:11 2018 -0400

Document bindings for imx214 camera sensor

[Sakari Ailus: Move MAINTAINERS entry here, fix DT binding filename]

Cc: devicetree@vger.kernel.org
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 .../devicetree/bindings/media/i2c/sony,imx214.txt  | 53 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++++
 2 files changed, 61 insertions(+)

---

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt b/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
new file mode 100644
index 000000000000..f11f28a5fda4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
@@ -0,0 +1,53 @@
+* Sony 1/3.06-Inch 13.13Mp CMOS Digital Image Sensor
+
+The Sony imx214 is a 1/3.06-inch CMOS active pixel digital image sensor with
+an active array size of 4224H x 3200V. It is programmable through an I2C
+interface.
+Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a maximum
+throughput of 1.2Gbps/lane.
+
+
+Required Properties:
+- compatible: Shall be "sony,imx214".
+- reg: I2C bus address of the device. Depending on how the sensor is wired,
+       it shall be <0x10> or <0x1a>;
+- enable-gpios: GPIO descriptor for the enable pin.
+- vdddo-supply: Chip digital IO regulator (1.8V).
+- vdda-supply: Chip analog regulator (2.7V).
+- vddd-supply: Chip digital core regulator (1.12V).
+- clocks: Reference to the xclk clock.
+- clock-frequency: Frequency of the xclk clock.
+
+Optional Properties:
+- flash-leds: See ../video-interfaces.txt
+- lens-focus: See ../video-interfaces.txt
+
+The imx214 device node shall contain one 'port' child node with
+an 'endpoint' subnode. For further reading on port node refer to
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Required Properties on endpoint:
+- data-lanes: check ../video-interfaces.txt
+- link-frequencies: check ../video-interfaces.txt
+- remote-endpoint: check ../video-interfaces.txt
+
+Example:
+
+	camera-sensor@1a {
+		compatible = "sony,imx214";
+		reg = <0x1a>;
+		vdddo-supply = <&pm8994_lvs1>;
+		vddd-supply = <&camera_vddd_1v12>;
+		vdda-supply = <&pm8994_l17>;
+		lens-focus = <&ad5820>;
+		enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+		clocks = <&mmcc CAMSS_MCLK0_CLK>;
+		clock-frequency = <24000000>;
+		port {
+			imx214_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <480000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index f4855974f325..a8588dedc683 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13823,6 +13823,14 @@ S:	Maintained
 F:	drivers/ssb/
 F:	include/linux/ssb/
 
+SONY IMX214 SENSOR DRIVER
+M:	Ricardo Ribalda <ricardo.ribalda@gmail.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/imx214.c
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx214.txt
+
 SONY IMX258 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
