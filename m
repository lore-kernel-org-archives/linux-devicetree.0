From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH v3 2/4] dt-bindings: gpio: add raspberry pi GPIO expander binding
Date: Tue, 16 Jan 2018 14:45:08 +0200
Message-ID: <248ce2c6c79b281261184a0ccde8513a9074af4c.1516105893.git.baruch@tkos.co.il>
References: <cover.1516105893.git.baruch@tkos.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1516105893.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Stevenson <dave.stevenson-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware over
I2C. The firmware mailbox interface allows the ARM core to control the
GPIO lines.

Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
---
v3:
  * Rename node name.

v2:
  * Rename compatible string to raspberrypi,firmware-gpio
---
 .../bindings/gpio/raspberrypi,firmware-gpio.txt    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
new file mode 100644
index 000000000000..936dc59eba12
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
@@ -0,0 +1,24 @@
+Raspberry Pi GPIO expander
+
+The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware. The
+firmware exposes a mailbox interface that allows the ARM core to control the
+GPIO lines on the expander.
+
+Required properties:
+
+- compatible : Should be "raspberrypi,firmware-gpio"
+- gpio-controller : Marks the device node as a gpio controller
+- #gpio-cells : Should be two.  The first cell is the pin number, and
+  the second cell is used to specify the gpio polarity:
+  0 = active high
+  1 = active low
+- firmware : Reference to the RPi firmware device node
+
+Example:
+
+expgpio: gpio-expander {
+	compatible = "raspberrypi,firmware-gpio";
+	gpio-controller;
+	#gpio-cells = <2>;
+	firmware = <&firmware>;
+};
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
