From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5 4/4] Documentation: add LP3943 DT bindings and document
Date: Fri, 6 Dec 2013 11:14:37 +0900
Message-ID: <1386296077-22801-5-git-send-email-milo.kim@ti.com>
References: <1386296077-22801-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386296077-22801-1-git-send-email-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: milo.kim-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Bindings for LP3943 MFD, GPIO and PWM controller are added.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Acked-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-lp3943.txt       |   37 +++++++++++++
 Documentation/devicetree/bindings/mfd/lp3943.txt   |   33 +++++++++++
 .../devicetree/bindings/pwm/pwm-lp3943.txt         |   58 ++++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/lp3943.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-lp3943.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-lp3943.txt b/Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
new file mode 100644
index 0000000..80fcb7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
@@ -0,0 +1,37 @@
+TI/National Semiconductor LP3943 GPIO controller
+
+Required properties:
+  - compatible: "ti,lp3943-gpio"
+  - gpio-controller: Marks the device node as a GPIO controller.
+  - #gpio-cells: Should be 2. See gpio.txt in this directory for a
+                 description of the cells format.
+
+Example:
+Simple LED controls with LP3943 GPIO controller
+
+&i2c4 {
+	lp3943@60 {
+		compatible = "ti,lp3943";
+		reg = <0x60>;
+
+		gpioex: gpio {
+			compatible = "ti,lp3943-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
+};
+
+leds {
+	compatible = "gpio-leds";
+	indicator1 {
+		label = "indi1";
+		gpios = <&gpioex 9 GPIO_ACTIVE_LOW>;
+	};
+
+	indicator2 {
+		label = "indi2";
+		gpios = <&gpioex 10 GPIO_ACTIVE_LOW>;
+		default-state = "off";
+	};
+};
diff --git a/Documentation/devicetree/bindings/mfd/lp3943.txt b/Documentation/devicetree/bindings/mfd/lp3943.txt
new file mode 100644
index 0000000..e8591d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/lp3943.txt
@@ -0,0 +1,33 @@
+TI/National Semiconductor LP3943 MFD driver
+
+Required properties:
+  - compatible: "ti,lp3943"
+  - reg: I2C slave address. From 0x60 to 0x67.
+
+LP3943 consists of two sub-devices, lp3943-gpio and lp3943-pwm.
+
+For the LP3943 GPIO properties please refer to:
+Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
+
+For the LP3943 PWM properties please refer to:
+Documentation/devicetree/bindings/pwm/pwm-lp3943.txt
+
+Example:
+
+lp3943@60 {
+	compatible = "ti,lp3943";
+	reg = <0x60>;
+
+	gpioex: gpio {
+		compatible = "ti,lp3943-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pwm3943: pwm {
+		compatible = "ti,lp3943-pwm";
+		#pwm-cells = <2>;
+		ti,pwm0 = <8 9 10>;
+		ti,pwm1 = <15>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/pwm/pwm-lp3943.txt b/Documentation/devicetree/bindings/pwm/pwm-lp3943.txt
new file mode 100644
index 0000000..7bd9d3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-lp3943.txt
@@ -0,0 +1,58 @@
+TI/National Semiconductor LP3943 PWM controller
+
+Required properties:
+  - compatible: "ti,lp3943-pwm"
+  - #pwm-cells: Should be 2. See pwm.txt in this directory for a
+                description of the cells format.
+                Note that this hardware limits the period length to the
+                range 6250~1600000.
+  - ti,pwm0 or ti,pwm1: Output pin number(s) for PWM channel 0 or 1.
+    0 = output 0
+    1 = output 1
+    .
+    .
+    15 = output 15
+
+Example:
+PWM 0 is for RGB LED brightness control
+PWM 1 is for brightness control of LP8557 backlight device
+
+&i2c3 {
+	lp3943@60 {
+		compatible = "ti,lp3943";
+		reg = <0x60>;
+
+		/*
+		 * PWM 0 : output 8, 9 and 10
+		 * PWM 1 : output 15
+		 */
+		pwm3943: pwm {
+			compatible = "ti,lp3943-pwm";
+			#pwm-cells = <2>;
+			ti,pwm0 = <8 9 10>;
+			ti,pwm1 = <15>;
+		};
+	};
+
+};
+
+/* LEDs control with PWM 0 of LP3943 */
+pwmleds {
+	compatible = "pwm-leds";
+	rgb {
+		label = "indi::rgb";
+		pwms = <&pwm3943 0 10000>;
+		max-brightness = <255>;
+	};
+};
+
+&i2c4 {
+	/* Backlight control with PWM 1 of LP3943 */
+	backlight@2c {
+		compatible = "ti,lp8557";
+		reg = <0x2c>;
+
+		pwms = <&pwm3943 1 10000>;
+		pwm-names = "lp8557";
+	};
+};
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
