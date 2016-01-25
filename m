From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 1/4] dt-bindings: mfd: Add bindings for the MediaTek MT6323 PMIC
Date: Mon, 25 Jan 2016 11:14:44 +0100
Message-ID: <1453716887-38442-2-git-send-email-blogic@openwrt.org>
References: <1453716887-38442-1-git-send-email-blogic@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453716887-38442-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Steven Liu <steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/mfd/mt6397.txt |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 15043e6..949c85f 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -1,6 +1,6 @@
-MediaTek MT6397 Multifunction Device Driver
+MediaTek MT6397/MT6323 Multifunction Device Driver
 
-MT6397 is a multifunction device with the following sub modules:
+MT6397/MT6323 is a multifunction device with the following sub modules:
 - Regulator
 - RTC
 - Audio codec
@@ -8,14 +8,14 @@ MT6397 is a multifunction device with the following sub modules:
 - Clock
 
 It is interfaced to host controller using SPI interface by a proprietary hardware
-called PMIC wrapper or pwrap. MT6397 MFD is a child device of pwrap.
+called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
 See the following for pwarp node definitions:
 Documentation/devicetree/bindings/soc/pwrap.txt
 
 This document describes the binding for MFD device and its sub module.
 
 Required properties:
-compatible: "mediatek,mt6397"
+compatible: "mediatek,mt6397" or "mediatek,mt6323"
 
 Optional subnodes:
 
@@ -26,6 +26,8 @@ Optional subnodes:
 	Required properties:
 		- compatible: "mediatek,mt6397-regulator"
 	see Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+		- compatible: "mediatek,mt6323-regulator"
+	see Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
 - codec
 	Required properties:
 		- compatible: "mediatek,mt6397-codec"
-- 
1.7.10.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
