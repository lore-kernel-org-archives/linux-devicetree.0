From: Yixun Lan <dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: Add Meson AXG binding
Date: Sat, 14 Oct 2017 07:13:12 +0800
Message-ID: <20171013231313.22850-2-dlan@gentoo.org>
References: <20171013231313.22850-1-dlan@gentoo.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013231313.22850-1-dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Yixun Lan <dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce new bindings for the Meson AXG SoC which now have
different memory layout.

Signed-off-by: Yixun Lan <dlan-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 4e4bc0bae597..89ee830bd55c 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -41,6 +41,10 @@ Boards with the Amlogic Meson GXM S912 SoC shall have the following properties:
   Required root node property:
     compatible: "amlogic,s912", "amlogic,meson-gxm";
 
+Boards with the Amlogic Meson AXG A113D SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,a113d", "amlogic,meson-axg";
+
 Board compatible values (alphabetically, grouped by SoC):
 
   - "geniatech,atv1200" (Meson6)
@@ -74,6 +78,8 @@ Board compatible values (alphabetically, grouped by SoC):
   - "kingnovel,r-box-pro" (Meson gxm S912)
   - "nexbox,a1" (Meson gxm s912)
 
+  - "amlogic,s400" (Meson axg a113d)
+
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
