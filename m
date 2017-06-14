From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 1/3] dt-bindings: arm: amlogic: Add SoC information bindings
Date: Wed, 14 Jun 2017 14:05:44 +0200
Message-ID: <1497441946-24379-2-git-send-email-narmstrong@baylibre.com>
References: <1497441946-24379-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497441946-24379-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add bindings for the SoC information register of the Amlogic SoCs.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 5c01e65..a6d8754 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -60,3 +60,32 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,q201" (Meson gxm s912)
   - "kingnovel,r-box-pro" (Meson gxm S912)
   - "nexbox,a1" (Meson gxm s912)
+
+Amlogic Meson Firmware registers Interface
+------------------------------------------
+
+The Meson SoCs have a register bank with status and data shared with the
+secure firmware.
+
+Required properties:
+ - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
+
+Properties should indentify components of this register interface :
+
+Meson GX SoC Information
+------------------------
+A firmware register encodes the SoC type, package and revision information on
+the Meson GX SoCs.
+If present, the following property should be added :
+
+Optional properties:
+  - has-chip-id: If present, the interface gives the current SoC version.
+
+Example
+-------
+
+ao-secure@140 {
+	compatible = "amlogic,meson-gx-ao-secure", "syscon";
+	reg = <0x0 0x140 0x0 0x140>;
+	has-chip-id;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
