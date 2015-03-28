From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH 1/2] Documentation: devicetree: root node serial-number property documentation
Date: Sat, 28 Mar 2015 18:39:30 +0100
Message-ID: <1427564371-26039-1-git-send-email-contact@paulk.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
---
 Documentation/devicetree/booting-without-of.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 7768518..8b055897 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -828,6 +828,10 @@ address which can extend beyond that limit.
   name may clash with standard defined ones, you prefix them with your
   vendor name and a comma.
 
+  Additional properties for the root node:
+
+    - serial-number : a string representing the board's serial number
+
   b) The /cpus node
 
   This node is the parent of all individual CPU nodes. It doesn't
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
