From: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: max3421: Add bindings documentation
Date: Fri, 15 Sep 2017 18:58:46 +0200
Message-ID: <a69d2c5fc640fa0f4c9e9edb45da98fae39cfbac.1505492941.git.jules.maselbas@grenoble-inp.org>
References: <cover.1505492941.git.jules.maselbas@grenoble-inp.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1505492941.git.jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
In-Reply-To: <cover.1505492941.git.jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
References: <cover.1505492941.git.jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds bindings documentation for the max3421 driver.

Signed-off-by: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
---
 .../devicetree/bindings/usb/maxim,max3421.txt      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.txt

diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421.txt b/Documentation/devicetree/bindings/usb/maxim,max3421.txt
new file mode 100644
index 000000000000..7536c3ab3e5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/maxim,max3421.txt
@@ -0,0 +1,24 @@
+Maxim Integrated SPI-based USB 2.0 host controller MAX3421E
+
+Required properties:
+ - compatible: "maxim,max3421"
+ - spi-max-frequency: maximum frequency for this device must not exceed 26 MHz.
+ - reg: chip select number to which this device is connected.
+ - maxim,vbus-en-pin: <GPOUTx ACTIVE_LEVEL>
+   GPOUTx is the number (1-8) of the GPOUT pin of MAX3421E to drive Vbus.
+   ACTIVE_LEVEL is 0 or 1.
+ - interrupt-parent: the phandle of the associated interrupt controller.
+ - interrupts: the interuption line description for the interrupt controller.
+   The driver configures MAX3421E for active low level triggered interrupts,
+   configure your interrupt line accordingly.
+
+Example:
+
+	usb@0 {
+		compatible = "maxim,max3421";
+		reg = <0>;
+		maxim,vbus-en-pin = <3 1>;
+		spi-max-frequency = <26000000>;
+		interrupt-parent = <&PIC>;
+		interrupts = <42>;
+	};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
