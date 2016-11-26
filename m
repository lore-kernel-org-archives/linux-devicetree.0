From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/5] Documentation: dt-bindings: Add documentation for Meson GXL USB2/3 PHYs
Date: Sat, 26 Nov 2016 15:56:31 +0100
Message-ID: <20161126145635.24488-2-martin.blumenstingl@googlemail.com>
References: <20161126145635.24488-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161126145635.24488-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the DT binding documentation for the USB2 and USB3 PHYs found
in the Meson GXL and GXM SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt | 25 ++++++++++++++++++++
 .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt | 27 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
new file mode 100644
index 0000000..e7828ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
@@ -0,0 +1,25 @@
+* Amlogic Meson GXL and GXM USB2 PHY binding
+
+This describes the USB2 PHY block which provides multiple USB2 PHY ports.
+
+Required properties:
+- compatible:	Should be "amlogic,meson-gxl-usb2-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	should be 1 (see phy-bindings.txt in this directory)
+- clocks:	phandle and clock identifier for the phy clocks
+- clock-names:	"usb" and "usb_ddr"
+- resets:	reference to the reset controller
+
+Optional properties:
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+	usb2_phys: phy@78000 {
+		compatible = "amlogic,meson-gxl-usb2-phy";
+		#phy-cells = <1>;
+		reg = <0x0 0x78000 0x0 0x80>;
+		clocks = <&clkc CLKID_USB1>, <&clkc CLKID_USB1_DDR_BRIDGE>;
+		clock-names = "usb", "usb_ddr";
+		resets = <&reset RESET_USB_OTG>;
+	};
diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
new file mode 100644
index 0000000..be779e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
@@ -0,0 +1,27 @@
+* Amlogic Meson GXL and GXM USB3 PHY binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-gxl-usb3-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	should be 0 (see phy-bindings.txt in this directory)
+- interrupts:	describes the OTG device/host mode detection interrupt
+- phys:		a list of related PHYs (typically the USB2 PHYs, see
+		meson-gxl-usb2-phy.txt in this directory). The mode of
+		the listed PHYs will be managed by the USB3 PHY (which
+		is required for OTG device/host detection to work).
+		The number of PHYs listed typically matches the number
+		of ports which are enabled in the USB controller which
+		uses this PHY.
+
+Optional properties:
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+	usb3_phy0: phy@78080 {
+		compatible = "amlogic,meson-gxl-usb3-phy";
+		#phy-cells = <0>;
+		reg = <0x0 0x78080 0x0 0x20>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&usb2_phys 0>, <&usb2_phys 1>;
+	};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
