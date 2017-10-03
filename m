From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/2] dt-bindings: arm: amlogic: Add Tronsmart Vega S96 binding
Date: Tue,  3 Oct 2017 17:29:45 +0200
Message-ID: <1507044585-20117-3-git-send-email-narmstrong@baylibre.com>
References: <1507044585-20117-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507044585-20117-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbes-150-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org, support-QbXJUBtoW2jby3iVrkZq2A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cc: support-QbXJUBtoW2jby3iVrkZq2A@public.gmane.org
Acked-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Signed-off-by: Oleg Ivanov <balbes-150-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 4e4bc0b..d6163ac 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -73,6 +73,7 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,q201" (Meson gxm s912)
   - "kingnovel,r-box-pro" (Meson gxm S912)
   - "nexbox,a1" (Meson gxm s912)
+  - "tronsmart,vega-s96" (Meson gxm s912)
 
 Amlogic Meson Firmware registers Interface
 ------------------------------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
