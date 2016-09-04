From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 3/7] Documentation: dt-bindings: Add documentation for the Meson USB2 PHYs
Date: Sun,  4 Sep 2016 23:31:48 +0200
Message-ID: <20160904213152.25837-4-martin.blumenstingl@googlemail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160904213152.25837-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the documentation for the bindings for the Meson8b and GXBB USB2
PHYs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/phy/meson-usb2-phy.txt     | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
new file mode 100644
index 0000000..662b537
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
@@ -0,0 +1,27 @@
+* Amlogic USB2 PHY
+
+Required properties:
+- compatible:	Depending on the platform this should be one of:
+	"amlogic,meson8b-usb2-phy"
+	"amlogic,meson-gxbb-usb2-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	should be 0 (see phy-bindings.txt in this directory)
+- resets:	reference to the reset controller
+- clocks:	phandle and clock identifier for the phy clocks
+- clock-names:	"usb_general" and "usb"
+
+Optional properties:
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+
+usb0_phy: usb_phy@0 {
+	compatible = "amlogic,meson-gxbb-usb2-phy";
+	#phy-cells = <0>;
+	reg = <0x0 0x0 0x0 0x20>;
+	resets = <&reset 34>;
+	clocks = <&clkc CLKID_USB &clkc CLKID_USB0>;
+	clock-names = "usb_general", "usb";
+	phy-supply = <&usb_vbus>;
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
