From: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Subject: [PATCH] dt-bindings: at24/eeprom: add an undocumented compatible string
Date: Wed,  6 Dec 2017 11:12:19 +0100
Message-ID: <20171206101219.14011-1-brgl@bgdev.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Divagar Mohandass <divagar.mohandass-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The "atmel,sdp" compatible is reported by checkpatch as undocumented.

Add it to the device tree bindings document for at24.

Signed-off-by: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
---
 Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/eeprom.txt b/Documentation/devicetree/bindings/eeprom/eeprom.txt
index 27f2bc15298a..5b5ceee6ce02 100644
--- a/Documentation/devicetree/bindings/eeprom/eeprom.txt
+++ b/Documentation/devicetree/bindings/eeprom/eeprom.txt
@@ -8,6 +8,8 @@ Required properties:
 	"atmel,24c08", "atmel,24c16", "atmel,24c32", "atmel,24c64",
 	"atmel,24c128", "atmel,24c256", "atmel,24c512", "atmel,24c1024"
 
+	"atmel,spd"
+
 	"catalyst,24c32"
 
 	"microchip,24c128"
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
