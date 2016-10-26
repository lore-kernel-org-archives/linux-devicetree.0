From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH 1/2] DT: binding: bcm2835-mbox: fix address typo in example
Date: Wed, 26 Oct 2016 18:13:59 +0000
Message-ID: <1477505640-26658-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The address of the mailbox node in the example has a typo.
So fix it accordingly.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Fixes: d4b5c782b9f4 ("dt/bindings: Add binding for the BCM2835 mailbox driver")
---
 .../bindings/mailbox/brcm,bcm2835-mbox.txt         |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
index e893615..b48d7d3 100644
--- a/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/brcm,bcm2835-mbox.txt
@@ -12,7 +12,7 @@ Required properties:
 
 Example:
 
-mailbox: mailbox@7e00b800 {
+mailbox: mailbox@7e00b880 {
 	compatible = "brcm,bcm2835-mbox";
 	reg = <0x7e00b880 0x40>;
 	interrupts = <0 1>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
