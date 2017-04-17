From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v3 1/2] Documentation: dt-bindings: Add documentation for the Meson GXL USB2 PHY
Date: Mon, 17 Apr 2017 21:11:41 +0200
Message-ID: <20170417191142.26099-2-martin.blumenstingl@googlemail.com>
References: <20170318130013.20771-1-martin.blumenstingl@googlemail.com>
 <20170417191142.26099-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170417191142.26099-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hendrik-MJglGmTD+GWCT0AhDRffsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the DT binding documentation for the USB2 PHY(s) found in the
Meson GXL and GXM SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
new file mode 100644
index 000000000000..a105494a0fc9
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
@@ -0,0 +1,17 @@
+* Amlogic Meson GXL and GXM USB2 PHY binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-gxl-usb2-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+
+Optional properties:
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+	usb2_phy0: phy@78000 {
+		compatible = "amlogic,meson-gxl-usb2-phy";
+		#phy-cells = <0>;
+		reg = <0x0 0x78000 0x0 0x20>;
+	};
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
