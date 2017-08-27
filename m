From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 2/3] dt-bindings: arm: realtek: Add ProBox2 AVA
Date: Sun, 27 Aug 2017 14:54:24 +0200
Message-ID: <20170827125425.3400-3-afaerber@suse.de>
References: <20170827125425.3400-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170827125425.3400-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, support-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document a compatible string for the PROBOX2 AVA TV Box.

Cc: support-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org
Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/realtek.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/realtek.txt b/Documentation/devicetree/bindings/arm/realtek.txt
index 13d755787b4f..297c15eb81e2 100644
--- a/Documentation/devicetree/bindings/arm/realtek.txt
+++ b/Documentation/devicetree/bindings/arm/realtek.txt
@@ -12,6 +12,7 @@ Required root node properties:
 
 Root node property compatible must contain, depending on board:
 
+ - ProBox2 AVA: "probox2,ava"
  - Zidoo X9S: "zidoo,x9s"
 
 
-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
