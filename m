From: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v2 PATCH 14/14] Documentation: Add st_accel binding documentation
Date: Fri, 27 Sep 2013 18:32:18 +0200
Message-ID: <1380299538-22047-15-git-send-email-l.czerwinski@samsung.com>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380299538-22047-1-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the document for STMicroeletronics Acceleration Sensors
driver under Documentation/devicetree/bindings/iio/.

Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../iio/accelerometer/st_accelerometer.txt         |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accelerometer/st_accelerometer.txt

diff --git a/Documentation/devicetree/bindings/iio/accelerometer/st_accelerometer.txt b/Documentation/devicetree/bindings/iio/accelerometer/st_accelerometer.txt
new file mode 100644
index 0000000..af70f29
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accelerometer/st_accelerometer.txt
@@ -0,0 +1,40 @@
+STMicroelectronics Acceleration Sensors
+
+Required properties:
+
+  - compatible : value should be one of the following:
+	(a) "st,lsm330dlhc-accel" for accelerometer in LSM330DLHC
+	(b) "st,lis3dh" for accelerometer in LIS3DH
+	(c) "st,lsm330d-accel" for accelerometer in LSM330
+	(d) "st,lsm330dl-accel" for accelerometer in LSM330DL
+	(e) "st,lsm330dlc-accel" for accelerometer in LSM330DLC
+	(f) "st,lsm331dlh" for accelerometer in LSM331DLH
+	(g) "st,lsm303dl-accel" for accelerometer in LSM303DL
+	(h) "st,lsm303dlh-accel" for accelerometer in LSM303DLH
+	(i) "st,lsm303dlm-accel" for accelerometer in LSM303DLM
+	(j) "st,lsm330-accel" for accelerometer in LMS330
+
+  - reg : the I2C address of the accelerometer
+
+Optional properties:
+
+  - st,drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
+
+  - interrupts : Interrupt numbers for the ST accelerometers, as an array
+	in case the accelerometer have more interrupt lines:
+	<DataReady irq>,
+	<Event irq>;
+
+  - interrupt-names : Array of strings associated with the interrupt numbers
+
+Example:
+
+lsm330dlc_accel@19 {
+	compatible = "st,lsm330dlc-accel";
+	reg = <0x19>;
+
+	st,drdy-int-pin = /bits/ 8 <1>;
+	interrupt-parent = <&gpx0>;
+	interrupts= <0 0>, <1 0>;
+	interrupt-names = "event-int". "drdy-int";\
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
