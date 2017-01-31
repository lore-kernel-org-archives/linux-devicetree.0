From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] Documentation: devicetree: add the RC map name of the geekbox remote
Date: Tue, 31 Jan 2017 22:13:42 +0100
Message-ID: <20170131211342.3297-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
The geekbox keymap was added while the documentation patch was not
applied yet (and I wasn't aware of this pending patch). This ensures
that the documentation is in sync with the actual keymaps.

 Documentation/devicetree/bindings/media/rc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.txt b/Documentation/devicetree/bindings/media/rc.txt
index 0d16d14ccd2a..d3e7a012bfda 100644
--- a/Documentation/devicetree/bindings/media/rc.txt
+++ b/Documentation/devicetree/bindings/media/rc.txt
@@ -46,6 +46,7 @@ The following properties are common to the infrared remote controllers:
   * "rc-flyvideo"
   * "rc-fusionhdtv-mce"
   * "rc-gadmei-rm008z"
+  * "rc-geekbox"
   * "rc-genius-tvgo-a11mce"
   * "rc-gotview7135"
   * "rc-hauppauge"
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
