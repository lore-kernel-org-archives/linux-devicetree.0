From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v3 1/3] Documentation: dt-bindings: update the meson-usb2-phy example
Date: Sat,  1 Oct 2016 14:18:58 +0200
Message-ID: <20161001121900.1168-2-martin.blumenstingl@googlemail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20161001121900.1168-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161001121900.1168-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the example so the node name uses a dash (instead of an
underscore) as per convention.
Additionally it updates the example register offset to a real example
(the old value was taken from a draft where there was an additional PHY
bus).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/meson-usb2-phy.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
index 9da5ea2..bc616c1 100644
--- a/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/meson-usb2-phy.txt
@@ -16,10 +16,10 @@ Optional properties:
 
 Example:
 
-usb0_phy: usb_phy@0 {
+usb0_phy: usb-phy@c0000000 {
 	compatible = "amlogic,meson-gxbb-usb2-phy";
 	#phy-cells = <0>;
-	reg = <0x0 0x0 0x0 0x20>;
+	reg = <0x0 0xc0000000 0x0 0x20>;
 	resets = <&reset RESET_USB_OTG>;
 	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
 	clock-names = "usb_general", "usb";
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
