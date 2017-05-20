From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 2/2] dt-bindings: phy: meson8b-usb2-phy: add support for the Meson8 SoCs
Date: Sat, 20 May 2017 16:12:50 +0200
Message-ID: <20170520141250.27388-3-martin.blumenstingl@googlemail.com>
References: <20170506173625.19501-1-martin.blumenstingl@googlemail.com>
 <20170520141250.27388-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170520141250.27388-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Meson8 uses the same USB PHY as found on the Meson8b and GXBB SoCs. This
adds a new compatible string to indicate that this binding also supports
the Meson8 SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
index 5fa73b9d20f5..d81d73aea608 100644
--- a/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
@@ -1,7 +1,8 @@
-* Amlogic Meson8b and GXBB USB2 PHY
+* Amlogic Meson8, Meson8b and GXBB USB2 PHY
 
 Required properties:
 - compatible:	Depending on the platform this should be one of:
+	"amlogic,meson8-usb2-phy"
 	"amlogic,meson8b-usb2-phy"
 	"amlogic,meson-gxbb-usb2-phy"
 - reg:		The base address and length of the registers
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
