From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/1] doc: dt-binding: ci-hdrc-usb2: improve property description
Date: Tue, 13 Oct 2015 17:25:17 +0800
Message-ID: <1444728317-4226-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shanw Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve the description of properties "tx-burst-size-dword"
and "rx-burst-size-dword".

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shanw Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 27dc705..781296b 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -37,11 +37,15 @@ Optional properties:
 - tx-burst-size-dword: it is vendor dependent, the tx burst size in dword
   (4 bytes), This register represents the maximum length of a the burst
   in 32-bit words while moving data from system memory to the USB
-  bus, changing this value takes effect only the SBUSCFG.AHBBRST is 0.
+  bus, the value of this property will only take effect if property
+  "ahb-burst-config" is set to 0, if this property is missing the reset
+  default of the hardware implementation will be used.
 - rx-burst-size-dword: it is vendor dependent, the rx burst size in dword
   (4 bytes), This register represents the maximum length of a the burst
   in 32-bit words while moving data from the USB bus to system memory,
-  changing this value takes effect only the SBUSCFG.AHBBRST is 0.
+  the value of this property will only take effect if property
+  "ahb-burst-config" is set to 0, if this property is missing the reset
+  default of the hardware implementation will be used.
 - extcon: phandles to external connector devices. First phandle should point to
   external connector, which provide "USB" cable events, the second should point
   to external connector device, which provide "USB-HOST" cable events. If one
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
