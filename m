From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH] of: Add vendor prefix for Digi International Inc.
Date: Thu,  3 Apr 2014 19:01:35 +0400
Message-ID: <1396537295-10253-1-git-send-email-shc_work@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Using "digi" for Digi International Inc.
Additionally, this patch keep "dlink" entry sorted alphabetically.

Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0f01c9b..74a9f4f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -33,8 +33,9 @@ cortina	Cortina Systems, Inc.
 crystalfontz	Crystalfontz America, Inc.
 dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
 davicom	DAVICOM Semiconductor, Inc.
-dlink	D-Link Systems, Inc.
 denx	Denx Software Engineering
+digi	Digi International Inc.
+dlink	D-Link Systems, Inc.
 dmo	Data Modul AG
 edt	Emerging Display Technologies
 emmicro	EM Microelectronic
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
