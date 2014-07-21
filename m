From: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: [PATCH] Documentation: dts: tcs6507: Fix wrong statement about #gpio-cells
Date: Mon, 21 Jul 2014 23:17:18 +0200
Message-ID: <1405977438-15517-1-git-send-email-marek@goldelico.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, neilb-l3A5Bk7waGM@public.gmane.org, hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update comment about gpio-cells which says not correctly to be set to 0.
When we want to reference tca6507 gpio #gpio-cells must be set to 2 (it is
already correct in example).

Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/tca6507.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Documentation/devicetree/bindings/leds/tca6507.txt
index d7221b8..bad9102 100644
--- a/Documentation/devicetree/bindings/leds/tca6507.txt
+++ b/Documentation/devicetree/bindings/leds/tca6507.txt
@@ -8,7 +8,7 @@ Required properties:
 
 Optional properties:
 - gpio-controller: allows lines to be used as output-only GPIOs.
-- #gpio-cells: if present, must be 0.
+- #gpio-cells: if present, must not be 0.
 
 Each led is represented as a sub-node of the ti,tca6507 device.
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
