From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 1/4] pinctrl: Cygnus: define Broadcom Cygnus GPIO/PINCONF binding
Date: Tue, 3 Feb 2015 17:09:05 -0800
Message-ID: <1423012148-22560-2-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
 <1423012148-22560-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423012148-22560-1-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the GPIO/PINCONF device tree binding for Broadcom Cygnus SoC

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/pinctrl/brcm,cygnus-gpio.txt          |  102 ++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
new file mode 100644
index 0000000..9b9196c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-gpio.txt
@@ -0,0 +1,102 @@
+Broadcom Cygnus GPIO/PINCONF Controller
+
+Required properties:
+
+- compatible:
+    Must be "brcm,cygnus-gpio"
+
+- reg:
+    Define the base and range of the I/O address space that contains the Cygnus
+GPIO/PINCONF controller registers
+
+- ngpios:
+    Total number of GPIOs the controller provides
+
+- #gpio-cells:
+    Must be two. The first cell is the GPIO pin number (within the
+controller's pin space) and the second cell is used for the following:
+    bit[0]: polarity (0 for active high and 1 for active low)
+
+- gpio-controller:
+    Specifies that the node is a GPIO controller
+
+Optional properties:
+
+- interrupts:
+    Interrupt ID
+
+- interrupt-controller:
+    Specifies that the node is an interrupt controller
+
+- pinmux:
+    Specifies the phandle to the IOMUX device, where pins can be individually
+muxed to GPIO
+
+Supported generic PINCONF properties in child nodes:
+
+- pins:
+    The list of pins (within the controller's own pin space) that properties
+in the node apply to. Pin names are "gpio-<pin>"
+
+- bias-disable:
+    Disable pin bias
+
+- bias-pull-up:
+    Enable internal pull up resistor
+
+- bias-pull-down:
+    Enable internal pull down resistor
+
+- drive-strength:
+    Valid drive strength values include 2, 4, 6, 8, 10, 12, 14, 16 (mA)
+
+Example:
+	gpio_ccm: gpio@1800a000 {
+		compatible = "brcm,cygnus-gpio";
+		reg = <0x1800a000 0x50>,
+		      <0x0301d164 0x20>;
+		ngpios = <24>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+
+		touch_pins: touch_pins {
+			pwr: pwr {
+				pins = "gpio-0";
+				drive-strength = <16>;
+			};
+
+			event: event {
+				pins = "gpio-1";
+				bias-pull-up;
+			};
+		};
+	};
+
+	gpio_asiu: gpio@180a5000 {
+		compatible = "brcm,cygnus-gpio";
+		reg = <0x180a5000 0x668>;
+		ngpios = <146>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+	};
+
+	/*
+	 * Touchscreen that uses the CCM GPIO 0 and 1
+	 */
+	tsc {
+		...
+		...
+		gpio-pwr = <&gpio_ccm 0 0>;
+		gpio-event = <&gpio_ccm 1 0>;
+	};
+
+	/* Bluetooth that uses the ASIU GPIO 5, with polarity inverted */
+	bluetooth {
+		...
+		...
+		bcm,rfkill-bank-sel = <&gpio_asiu 5 1>
+	}
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
