From: Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v9 1/2] media: i2c/ov5645: add the device tree binding document
Date: Tue, 11 Apr 2017 14:28:30 +0300
Message-ID: <1491910110-15586-1-git-send-email-todor.tomov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the document for ov5645 device tree binding.

Signed-off-by: Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Acked-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/media/i2c/ov5645.txt       | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
new file mode 100644
index 0000000..fd7aec9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
@@ -0,0 +1,54 @@
+* Omnivision 1/4-Inch 5Mp CMOS Digital Image Sensor
+
+The Omnivision OV5645 is a 1/4-Inch CMOS active pixel digital image sensor with
+an active array size of 2592H x 1944V. It is programmable through a serial I2C
+interface.
+
+Required Properties:
+- compatible: Value should be "ovti,ov5645".
+- clocks: Reference to the xclk clock.
+- clock-names: Should be "xclk".
+- clock-frequency: Frequency of the xclk clock.
+- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
+  to the hardware pin PWDNB which is physically active low.
+- reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
+  the hardware pin RESETB.
+- vdddo-supply: Chip digital IO regulator.
+- vdda-supply: Chip analog regulator.
+- vddd-supply: Chip digital core regulator.
+
+The device node must contain one 'port' child node for its digital output
+video port, in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+	&i2c1 {
+		...
+
+		ov5645: ov5645@78 {
+			compatible = "ovti,ov5645";
+			reg = <0x78>;
+
+			enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&camera_rear_default>;
+
+			clocks = <&clks 200>;
+			clock-names = "xclk";
+			clock-frequency = <23880000>;
+
+			vdddo-supply = <&camera_dovdd_1v8>;
+			vdda-supply = <&camera_avdd_2v8>;
+			vddd-supply = <&camera_dvdd_1v2>;
+
+			port {
+				ov5645_ep: endpoint {
+					clock-lanes = <1>;
+					data-lanes = <0 2>;
+					remote-endpoint = <&csi0_ep>;
+				};
+			};
+		};
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
