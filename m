From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/5] dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and clock
Date: Sun, 28 Jan 2018 21:22:41 +0100
Message-ID: <20180128202245.25021-2-martin.blumenstingl@googlemail.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180128202245.25021-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The OTG capable USB2 PHY has a reset line (which is shared with other
components, such as the USB3 PHY for example) and a clock (which are
both part of different registers). Add the properties
for the reset line and clocks as optional ones since not all PHYs have
them (currently only the OTG capable PHY is known to use these).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
index a105494a0fc9..b84a02ebffdf 100644
--- a/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
@@ -6,6 +6,10 @@ Required properties:
 - #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
 
 Optional properties:
+- clocks:	a phandle to the clock of this PHY
+- clock-names:	must be "phy"
+- resets:	a phandle to the reset line of this PHY
+- reset-names:	must be "phy"
 - phy-supply:	see phy-bindings.txt in this directory
 
 
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
