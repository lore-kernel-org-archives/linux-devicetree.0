From: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Subject: [PATCH] Documentation: dt-binding: net: wireless: add bcm43430-fmac
Date: Tue, 29 Aug 2017 23:43:09 +0200
Message-ID: <20170829214309.34466-1-antony@phenome.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for Broadcom BCM43430
AMPAK AP6212A has this chip.

e.g
compatible = "brcm,bcm43430-fmac";

NanoPi NEO Plus2 has an AMPAK AP6212A WiFi module
with BCM43430 rev=1 inside.
brcmf_chip_recognition found AXI chip: BCM43430, rev=1
brcmf_ops_sdio_probe sdio vendor ID: 0x02d0
brcmf_ops_sdio_probe sdio device ID: 0xa9a6

Signed-off-by: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
---
 Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 NanoPi Neo Plus2 Kernel DT propsed patch
 https://patchwork.kernel.org/patch/9925387/

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
index 590f622..9107e1a 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
@@ -6,7 +6,9 @@ connects the device to the system.
 
 Required properties:
 
- - compatible : Should be "brcm,bcm4329-fmac".
+ - compatible : should be one of the following:
+	* "brcm,bcm4329-fmac"
+	* "brcm,bcm43430-fmac"
 
 Optional properties:
  - brcm,drive-strength : drive strength used for SDIO pins on device in mA
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
