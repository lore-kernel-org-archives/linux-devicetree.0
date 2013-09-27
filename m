From: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v2 PATCH 13/14] Documentation: Add st_pressure binding
 documentation
Date: Fri, 27 Sep 2013 18:32:17 +0200
Message-ID: <1380299538-22047-14-git-send-email-l.czerwinski@samsung.com>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380299538-22047-1-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the document for STMicroeletronics Pressure Sensors
driver under Documentation/devicetree/bindings/iio/.

Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../bindings/iio/barometer/st_barometer.txt        |   38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/barometer/st_barometer.txt

diff --git a/Documentation/devicetree/bindings/iio/barometer/st_barometer.txt b/Documentation/devicetree/bindings/iio/barometer/st_barometer.txt
new file mode 100644
index 0000000..5ce4bfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/barometer/st_barometer.txt
@@ -0,0 +1,38 @@
+STMicroelectronics Pressure Sensors
+
+Required properties:
+
+  - compatible : value should be:
+	(a) "st,lps331ap" for barometer in LPS331AP
+	(b) "st,lps001wp" for barometer in LPS001WP
+
+  - reg : the I2C address of the barometer
+
+Optional properties:
+
+  - st,drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
+
+  - interrupts : Interrupt numbers for the ST barometer, as an array
+	in case the barometer have more interrupt lines:
+	<DataReady irq>,
+	<Event irq>;
+
+  - interrupt-names : Array of strings associated with the interrupt numbers
+
+  - vdd-supply: Phandle to the Vdd supply regulator
+
+  - vddio-supply: Phandle to the Vdd-IO supply regulator
+
+Example:
+
+lps331ap5d@5d {
+	compatible = "st,lps331ap";
+	reg = <0x5d>;
+
+	st,drdy-int-pin = /bits/ 8 <1>;
+	interrupt-parent = <&gpf0>;
+	interrupts = <5 0>, <6 0>;
+	interrupt-names = "drdy-int", "event-int";
+	vdd-supply = <&ab8500_ldo_aux1_reg>;
+	vddio-supply = <&db8500_vsmps2_reg>;
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
