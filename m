From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3] dt-bindings: GPIO: Add generic serializer binding
Date: Fri, 4 Mar 2016 12:58:44 -0600
Message-ID: <1457117924-7014-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding for generic parallel-in/serial-out shift register devices
used as GPIO.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
The driver was taken but it looks like this might have been lost,
anyway I've added a dual-string example as requested.

 .../devicetree/bindings/gpio/gpio-pisosr.txt       | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pisosr.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt b/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
new file mode 100644
index 0000000..dab8c9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-pisosr.txt
@@ -0,0 +1,34 @@
+Generic Parallel-in/Serial-out Shift Register GPIO Driver
+
+This binding describes generic parallel-in/serial-out shift register
+devices that can be used for GPI (General Purpose Input). This includes
+SN74165 serial-out shift registers and the SN65HVS88x series of
+industrial serializers.
+
+Required properties:
+ - compatible		: Should be "pisosr-gpio".
+ - gpio-controller	: Marks the device node as a GPIO controller.
+ - #gpio-cells		: Should be two. For consumer use see gpio.txt.
+
+Optional properties:
+ - ngpios		: Number of GPIO lines, default is 8.
+ - load-gpios		: GPIO pin specifier attached to load enable, this
+			  pin is pulsed before reading from the device to
+			  load input pin values into the the device.
+
+For other required and optional properties of SPI slave
+nodes please refer to ../spi/spi-bus.txt.
+
+Example:
+
+	gpio@0 {
+		compatible = "ti,sn65hvs882", "pisosr-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		load-gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+
+		reg = <0>;
+		spi-max-frequency = <1000000>;
+		spi-cpol;
+	};
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
