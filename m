Return-Path: <SRS0=UGIV=KL=linuxtv.org=mchehab@kernel.org>
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Fri, 27 Jul 2018 16:37:52 +0000
Subject: [git:media_tree/master] media: ov2680: dt: Add bindings for OV2680
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1fj6Fd-0001LH-6S@www.linuxtv.org>
To: linuxtv-commits@linuxtv.org
Cc: Rob Herring <robh@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: ov2680: dt: Add bindings for OV2680
Author:  Rui Miguel Silva <rui.silva@linaro.org>
Date:    Tue Jul 3 10:08:02 2018 -0400

Add device tree binding documentation for the OV2680 camera sensor.

[Sakari Ailus: Squash MAINTAINERS entry from Rui]

CC: devicetree@vger.kernel.org
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 .../devicetree/bindings/media/i2c/ov2680.txt       | 46 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++++
 2 files changed, 54 insertions(+)

---

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.txt b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
new file mode 100644
index 000000000000..11e925ed9dad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
@@ -0,0 +1,46 @@
+* Omnivision OV2680 MIPI CSI-2 sensor
+
+Required Properties:
+- compatible: should be "ovti,ov2680".
+- clocks: reference to the xvclk input clock.
+- clock-names: should be "xvclk".
+- DOVDD-supply: Digital I/O voltage supply.
+- DVDD-supply: Digital core voltage supply.
+- AVDD-supply: Analog voltage supply.
+
+Optional Properties:
+- reset-gpios: reference to the GPIO connected to the powerdown/reset pin,
+               if any. This is an active low signal to the OV2680.
+
+The device node must contain one 'port' child node for its digital output
+video port, and this port must have a single endpoint in accordance with
+ the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Endpoint node required properties for CSI-2 connection are:
+- remote-endpoint: a phandle to the bus receiver's endpoint node.
+- clock-lanes: should be set to <0> (clock lane on hardware lane 0).
+- data-lanes: should be set to <1> (one CSI-2 lane supported).
+
+Example:
+
+&i2c2 {
+	ov2680: camera-sensor@36 {
+		compatible = "ovti,ov2680";
+		reg = <0x36>;
+		clocks = <&osc>;
+		clock-names = "xvclk";
+		reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+		DOVDD-supply = <&sw2_reg>;
+		DVDD-supply = <&sw2_reg>;
+		AVDD-supply = <&reg_peri_3p15v>;
+
+		port {
+			ov2680_to_mipi: endpoint {
+				remote-endpoint = <&mipi_from_sensor>;
+				clock-lanes = <0>;
+				data-lanes = <1>;
+			};
+		};
+	};
+};
diff --git a/MAINTAINERS b/MAINTAINERS
index a13344d6149a..ab739894d257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10490,6 +10490,14 @@ T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov13858.c
 
+OMNIVISION OV2680 SENSOR DRIVER
+M:	Rui Miguel Silva <rmfrfs@gmail.com>
+L:	linux-media@vger.kernel.org
+T:	git git://linuxtv.org/media_tree.git
+S:	Maintained
+F:	drivers/media/i2c/ov2680.c
+F:	Documentation/devicetree/bindings/media/i2c/ov2680.txt
+
 OMNIVISION OV2685 SENSOR DRIVER
 M:	Shunqian Zheng <zhengsq@rock-chips.com>
 L:	linux-media@vger.kernel.org
