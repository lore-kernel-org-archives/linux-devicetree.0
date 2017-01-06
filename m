From: Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
Subject: [PATCH v3 1/4] devicetree: hwmon: Add bindings for ADC128D818
Date: Fri,  6 Jan 2017 11:38:14 +0100
Message-ID: <20170106103817.11588-2-mail@alexanderkoch.net>
References: <20170106103817.11588-1-mail@alexanderkoch.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170106103817.11588-1-mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Michael Hornung <mhornung.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add bindings documentation for the ADC128D818 driver, featuring default I2C
properties along with the optional 'mode' property for chip operation mode
selection (see datasheet, sec. 8.4.1).

Signed-off-by: Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>
Acked-by: Michael Hornung <mhornung.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/hwmon/adc128d818.txt       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
new file mode 100644
index 000000000000..db213dcc1391
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
@@ -0,0 +1,39 @@
+TI ADC128D818 ADC System Monitor With Temperature Sensor
+--------------------------------------------------------
+
+Operation modes:
+
+ - Mode 0:  7 single-ended voltage readings (IN0-IN6),
+            1 temperature reading (internal)
+ - Mode 1:  8 single-ended voltage readings (IN0-IN7),
+            no temperature
+ - Mode 2:  4 pseudo-differential voltage readings
+              (IN0-IN1, IN3-IN2, IN4-IN5, IN7-IN6),
+            1 temperature reading (internal)
+ - Mode 3:  4 single-ended voltage readings (IN0-IN3),
+            2 pseudo-differential voltage readings
+              (IN4-IN5, IN7-IN6),
+            1 temperature reading (internal)
+
+If no operation mode is configured via device tree, the driver keeps the
+currently active chip operation mode (default is mode 0).
+
+
+Required node properties:
+
+ - compatible:  must be set to "ti,adc128d818"
+ - reg:         I2C address of the device
+
+Optional node properties:
+
+ - ti,mode:     Operation mode (see above).
+
+
+Example (operation mode 2):
+
+	adc128d818@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = <2>;
+	};
+
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
