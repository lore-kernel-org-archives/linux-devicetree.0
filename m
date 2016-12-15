From: yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Subject: [PATCH 1/2] Documentation: omap-usb-host: fix OMAP OHCI/EHCI file names
Date: Thu, 15 Dec 2016 16:56:09 +0100
Message-ID: <1481817370-28242-1-git-send-email-yegorslists@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

OMAP related files are actually named ehci-omap.txt and ohci-omap3.txt.

Also add full path to ohci-omap3.txt.

Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/omap-usb-host.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/omap-usb-host.txt b/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
index 4721b2d..aa1eaa5 100644
--- a/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
+++ b/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
@@ -64,8 +64,8 @@ Required properties if child node exists:
 Properties for children:
 
 The OMAP HS USB Host subsystem contains EHCI and OHCI controllers.
-See Documentation/devicetree/bindings/usb/omap-ehci.txt and
-omap3-ohci.txt
+See Documentation/devicetree/bindings/usb/ehci-omap.txt and
+Documentation/devicetree/bindings/usb/ohci-omap3.txt.
 
 Example for OMAP4:
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
