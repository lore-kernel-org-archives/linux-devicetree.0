From: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v6 1/2] dt-bindings: misc: achc: Add device tree binding for GE ACHC
Date: Fri, 18 Aug 2017 16:53:47 +0100
Message-ID: <1503071628-11899-2-git-send-email-martyn.welch@collabora.co.uk>
References: <1503071628-11899-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503071628-11899-1-git-send-email-martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Device Tree binding document for GE Healthcare USB Management
Controller (ACHC).

Signed-off-by: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 Documentation/devicetree/bindings/misc/ge-achc.txt | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/ge-achc.txt

diff --git a/Documentation/devicetree/bindings/misc/ge-achc.txt b/Documentation/devicetree/bindings/misc/ge-achc.txt
new file mode 100644
index 0000000..77df94d
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/ge-achc.txt
@@ -0,0 +1,26 @@
+* GE Healthcare USB Management Controller
+
+A device which handles data aquisition from compatible USB based peripherals.
+SPI is used for device management.
+
+Note: This device does not expose the peripherals as USB devices.
+
+Required properties:
+
+- compatible : Should be "ge,achc"
+
+Required SPI properties:
+
+- reg : Should be address of the device chip select within
+  the controller.
+
+- spi-max-frequency : Maximum SPI clocking speed of device in Hz, should be
+  1MHz for the GE ACHC.
+
+Example:
+
+spidev0: spi@0 {
+	compatible = "ge,achc";
+	reg = <0>;
+	spi-max-frequency = <1000000>;
+};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
