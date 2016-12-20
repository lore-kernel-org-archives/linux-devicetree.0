From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/7] Documentation: DT: bindings: iio: adc: add documentation for Allwinner SoCs' GPADC driver
Date: Tue, 20 Dec 2016 11:27:03 +0100
Message-ID: <20161220102709.9504-2-quentin.schulz@free-electrons.com>
References: <20161220102709.9504-1-quentin.schulz@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161220102709.9504-1-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Allwinner SoCs all have an ADC that can also act as a thermal sensor
and sometimes as a touchscreen controller. If there is a touchscreen
controller, the first four channels can be used either for the ADC or
the touchscreen and the fifth channel is used for the thermal sensor.
If there is not a touchscreen controller, the one and only channel is
used for the thermal sensor.

This patch adds the documentation for the driver of the Allwinner SoCs'
GPADC.

Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/iio/adc/sun4i-gpadc-iio.txt           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/sun4i-gpadc-iio.txt

diff --git a/Documentation/devicetree/bindings/iio/adc/sun4i-gpadc-iio.txt b/Documentation/devicetree/bindings/iio/adc/sun4i-gpadc-iio.txt
new file mode 100644
index 0000000..aab768d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/sun4i-gpadc-iio.txt
@@ -0,0 +1,57 @@
+Allwinner SoCs' GPADC Device Tree bindings
+------------------------------------------
+
+The Allwinner SoCs all have an ADC that can also act as a thermal sensor and
+sometimes as a touchscreen controller. If there is a touchscreen controller, the
+first four channels can be used either for the ADC or the touchscreen and the
+fifth channel is used for the thermal sensor.
+If there is not a touchscreen controller, the one and only channel is used for
+the thermal sensor.
+
+Currently, the touchscreen controller does not have a driver using this ADC
+driver. The touchscreen controller is currently driven only by
+input/touchscreen/sun4i-ts.c which is absolutely incompatible with this driver.
+
+The Allwinner A10, A13 and A31 SoCs already have a DT binding for the
+aforementioned input driver, thus an MFD driver matches the existing DT binding
+(mfd/sun4i-gpadc.c) and replaces the input driver. No DT binding is required for
+these SoCs' ADC, everything is handled by the MFD which is matching the existing
+DT binding for input/touchscreen/sun4i-ts.c.
+
+The Allwinner A33 GPADC only have a thermal sensor and have a proper DT binding
+for this driver unlike the previously mentioned SoCs.
+
+Required properties:
+ - compatible: "allwinner,sun8i-a33-gpadc-iio"
+
+Optional properties:
+(for use with thermal framework for CPU thermal throttling for example, and/or
+ IIO consumers)
+ - #thermal-sensor-cells = <0>; (see
+Documentation/devicetree/bindings/thermal/thermal.txt)
+ - #io-channel-cells = <0>; (see
+Documentation/devicetree/bindings/iio/iio-bindings.txt)
+
+Example:
+
+thermal-zones {
+	cpu_thermal {
+		thermal-sensors = <&rtp>;
+		[...]
+	};
+};
+
+soc@01c00000 {
+	[...]
+	rtp: rtp@01c25000 {
+		compatible = "allwinner,sun8i-a33-gpadc-iio";
+		reg = <0x01c25000 0x100>;
+		#thermal-sensor-cells = <0>;
+		#io-channel-cells = <0>;
+	};
+}
+
+iio_hwmon {
+	compatible = "iio-hwmon";
+	io-channels = <&rtp>;
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
