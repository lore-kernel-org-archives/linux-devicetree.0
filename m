From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH 51/54] MAINTAINERS: Add file patterns for w1 device tree bindings
Date: Sun, 22 May 2016 11:06:28 +0200
Message-ID: <1463907991-7916-52-git-send-email-geert@linux-m68k.org>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463907991-7916-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Evgeniy Polyakov <zbr-i6C2adt8DTjR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Evgeniy Polyakov <zbr-i6C2adt8DTjR7s880joybQ@public.gmane.org>
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 28829bfa140c47b2..9f54762f002e16de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12357,6 +12357,7 @@ F:	drivers/mmc/host/vub300.c
 W1 DALLAS'S 1-WIRE BUS
 M:	Evgeniy Polyakov <zbr-i6C2adt8DTjR7s880joybQ@public.gmane.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/w1/
 F:	Documentation/w1/
 F:	drivers/w1/
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
