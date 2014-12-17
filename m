From: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v2 2/3] Documentation: gpio: Add APM X-Gene standby GPIO controller DTS binding
Date: Wed, 17 Dec 2014 10:55:48 +0700
Message-ID: <1418788549-27108-3-git-send-email-yvo@apm.com>
References: <1418788549-27108-1-git-send-email-yvo@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418788549-27108-1-git-send-email-yvo-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Toan Le <toanle-qTEPVZfXA3Y@public.gmane.org>, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Documentation for APM X-Gene standby GPIO controller DTS binding.

Signed-off-by: Y Vo <yvo-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-xgene-sb.txt     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
new file mode 100644
index 0000000..3215e4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-xgene-sb.txt
@@ -0,0 +1,31 @@
+APM X-Gene Standby GPIO controller bindings
+
+This is a gpio controller in standby domain.
+
+There are 20 GPIO pins from 0..21. There is no GPIO_DS14 and GPIO_DS15. 
+Only GPIO_DS8..GPIO_DS13 support interrupt. IRQ mapping 0x28..0x2d.
+
+Required properties:
+- compatible: "apm,xgene-gpio-sb" for X-Gene Standby GPIO controller
+- reg: Physical base address and size of the controller's registers
+- #gpio-cells: Should be two.
+	- first cell is the pin number
+	- second cell is used to specify the gpio polarity:
+		0 = active high
+		1 = active low
+- gpio-controller: Marks the device node as a GPIO controller.
+- interrupts: Shall contains the interrupts.
+
+Example:
+	sbgpio: sbgpio@17001000 {
+		compatible = "apm,xgene-gpio-sb";
+		reg = <0x0 0x17001000 0x0 0x400>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupts = 	<0x0 0x28 0x1>,
+				<0x0 0x29 0x1>,
+				<0x0 0x2a 0x1>,
+				<0x0 0x2b 0x1>,
+				<0x0 0x2c 0x1>,
+				<0x0 0x2d 0x1>;
+	};
-- 
2.2.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
