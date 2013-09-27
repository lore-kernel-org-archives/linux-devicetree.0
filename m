From: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v2 PATCH 11/14] Documentation: Add st_magn binding documentation
Date: Fri, 27 Sep 2013 18:32:15 +0200
Message-ID: <1380299538-22047-12-git-send-email-l.czerwinski@samsung.com>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380299538-22047-1-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the document for STMicroeletronics Magnetic Sensors driver under
Documentation/devicetree/bindings/iio/.

Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/iio/magnetometer/st_magnometer.txt    |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt b/Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt
new file mode 100644
index 0000000..fb4f473
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt
@@ -0,0 +1,33 @@
+STMicroelectronics Magnetic Sensors
+
+Required properties:
+
+  - compatible : value should be one of the following:
+	(a) "st,lsm303dlhc" for magnetometer in LSM330DLHC
+	(b) "st,lsm303dlm" for magnetometer in LIS3DH
+	(c) "st,lis3mdl" for magnetometer in LSM330
+
+  - reg : the I2C address of the magnetometer
+
+Optional properties:
+
+  - st,drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
+
+  - interrupts : Interrupt numbers for the ST accelerometers, as an array
+	in case the magnetometer have more interrupt lines:
+	<DataReady irq>,
+	<Event irq>;
+
+  - interrupt-names : Array of strings associated with the interrupt numbers
+
+Example:
+
+lis3mdl@1c {
+	compatible = "st,lis3mdl";
+	reg = <0x1C>;
+
+	st,drdy-int-pin = /bits/ 8 <1>;
+	interrupt-parent = <&gpf0>;
+	interrupts = <5 0>, <6 0>;
+	interrupt-names = "drdy-int", "event-int";
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
