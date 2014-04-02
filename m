From: stefan-XLVq0VzYD2Y@public.gmane.org
Subject: [PATCH 1/2] of: add vendor prefix for Toradex AG
Date: Wed,  2 Apr 2014 18:47:26 +0200
Message-ID: <b94e331a33407686547145a632ff2eb14ca42c9e.1396456704.git.stefan@agner.ch>
References: <cover.1396456704.git.stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1396456704.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>

Adds toradex to the list of DT vendor prefixes.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index e9d19e2..6a68eae 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -91,6 +91,7 @@ ti	Texas Instruments
 tlm	Trusted Logic Mobility
 toshiba	Toshiba Corporation
 toumaz	Toumaz
+toradex	Toradex AG
 v3	V3 Semiconductor
 via	VIA Technologies, Inc.
 voipac	Voipac Technologies s.r.o.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
