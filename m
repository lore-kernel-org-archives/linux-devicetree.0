From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: phy: Add support for the USB3 PHY on Amlogic Meson GXL SoCs
Date: Sun, 24 Sep 2017 21:49:59 +0200
Message-ID: <20170924195000.13276-2-martin.blumenstingl@googlemail.com>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924195000.13276-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Amlogic Meson GXL SoCs use a dwc3 controller with two (GXM - a variant
for GXL, has three) USB2 ports. The first USB2 port supports host and
peripheral (also called "device") mode.
While the dwc3 controller has no USB3 port enabled we still need the
USB3 PHY to be initialized, otherwise some boards (probably those where
the bootloader does not initialize the USB3 PHY) show errors with
high-speed USB devices connected to any of the USB2 ports.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
new file mode 100644
index 000000000000..2b7c3715d52d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
@@ -0,0 +1,19 @@
+* Amlogic Meson GXL and GXM USB3 PHY and OTG detection binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-gxl-usb3-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+
+Optional properties:
+- interrupts:	the interrupt specifier for the OTG detection
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+	usb3_phy0: phy@78080 {
+		compatible = "amlogic,meson-gxl-usb3-phy";
+		#phy-cells = <0>;
+		reg = <0x0 0x78080 0x0 0x20>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
