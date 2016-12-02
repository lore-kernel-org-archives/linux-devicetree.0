From: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
Subject: [PATCH] devicetree: add vendor prefix for National Instruments
Date: Fri, 2 Dec 2016 09:31:48 -0600
Message-ID: <1480692708-22009-1-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
---
This is required by "gpio: mmio: add support for NI 169445 NAND GPIO"

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f0a48ea..d37df5f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -187,6 +187,7 @@ netgear	NETGEAR
 netlogic	Broadcom Corporation (formerly NetLogic Microsystems)
 netxeon		Shenzhen Netxeon Technology CO., LTD
 newhaven	Newhaven Display International
+ni	National Instruments
 nintendo	Nintendo
 nokia	Nokia
 nuvoton	Nuvoton Technology Corporation
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
