From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 04/23] MAINTAINERS: Add file patterns for cris device tree bindings
Date: Sun, 12 Mar 2017 14:16:48 +0100
Message-ID: <1489324627-19126-5-git-send-email-geert@linux-m68k.org>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489324627-19126-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mikael Starvik <starvik-VrBV9hrLPhE@public.gmane.org>, Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>, linux-cris-kernel-VrBV9hrLPhE@public.gmane.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Acked-by: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
Cc: Mikael Starvik <starvik-VrBV9hrLPhE@public.gmane.org>
Cc: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
Cc: linux-cris-kernel-VrBV9hrLPhE@public.gmane.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

v2:
  - Add Acked-by.

Impact on next-20170310:

+Mikael Starvik <starvik-VrBV9hrLPhE@public.gmane.org> (maintainer:CRIS PORT)
+Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org> (maintainer:CRIS PORT)
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
+linux-cris-kernel-VrBV9hrLPhE@public.gmane.org (open list:CRIS PORT)
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 43dcdea3febb442a..6428d3c82fce9670 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3521,6 +3521,7 @@ L:	linux-cris-kernel-VrBV9hrLPhE@public.gmane.org
 W:	http://developer.axis.com
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jesper/cris.git
 S:	Maintained
+F:	Documentation/devicetree/bindings/cris/
 F:	arch/cris/
 F:	drivers/tty/serial/crisv10.*
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
