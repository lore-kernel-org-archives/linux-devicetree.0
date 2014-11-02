From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v1 1/3] usb: phy: device-tree documentation for gpio-vbus
Date: Sun,  2 Nov 2014 19:11:48 +0100
Message-ID: <1414951910-16075-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation for device-tree binding of the generic gpio-vbus phy
controller.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/phy/gpio-vbus.txt          | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/gpio-vbus.txt

diff --git a/Documentation/devicetree/bindings/phy/gpio-vbus.txt b/Documentation/devicetree/bindings/phy/gpio-vbus.txt
new file mode 100644
index 0000000..ffcfd35
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/gpio-vbus.txt
@@ -0,0 +1,23 @@
+GPIO VBus phy
+=============
+
+gpio-vbus is a phy controller supporting VBus detection and pullup activation on
+GPIOs.
+
+Required properties:
+- compatible : should be "generic,phy-gpio-vbus"
+- #phy-cells : from the generic PHY bindings, must be 1.
+- gpios      : set of 2 gpio properties (see gpio.txt for gpio properties format)
+               first gpio is required, it's the VBus sensing input gpio
+	       second gpio is optional, it's the D+ pullup controlling output
+	       gpio
+
+Optional properties:
+- wakeup     : boolean, if true the VBus gpio will wakeup the platform
+
+Example:
+	usb2phy : gpio-vbus@13 {
+		compatible = "generic,phy-gpio-vbus";
+		gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
+		wakeup;
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
