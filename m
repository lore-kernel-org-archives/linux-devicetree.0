From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] dt-bindings: add vendor prefix for Next Thing Co.
Date: Sun, 29 Oct 2017 14:25:48 +0100
Message-ID: <20171029132548.19816-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Next Thing Co. is the company behind the C.H.I.P. and C.H.I.P. Pro
miniature single board computers.
The "nextthing" vendor-prefix is already used for these two board as
well as their own "GR8" SoC.

Cc: Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 1afd298eddd7..3699d4cb1744 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -229,6 +229,7 @@ netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
 netron-dy	Netron DY
 netxeon		Shenzhen Netxeon Technology CO., LTD
 nexbox	Nexbox
+nextthing	Next Thing Co.
 newhaven	Newhaven Display International
 ni	National Instruments
 nintendo	Nintendo
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
