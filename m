From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 10/23] MAINTAINERS: Add file patterns for ipmi device tree bindings
Date: Sun, 12 Mar 2017 14:16:54 +0100
Message-ID: <1489324627-19126-11-git-send-email-geert@linux-m68k.org>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489324627-19126-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Cc: openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

v2:
  - New.

Impact on next-20170310:

+Corey Minyard <minyard-HInyCGIudOg@public.gmane.org> (supporter:IPMI SUBSYSTEM)
 Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-"Cédric Le Goater" <clg-Bxea+6Xhats@public.gmane.org> (commit_signer:3/2=100%,authored:1/2=50%)
-Corey Minyard <cminyard-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org> (commit_signer:1/2=50%)
-Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> (commit_signer:1/2=50%)
-Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org> (commit_signer:1/2=50%)
-Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> (commit_signer:1/2=50%)
-Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org> (authored:1/2=50%)
+openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org (moderated list:IPMI SUBSYSTEM)
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3fbd1af0f49a7e9..bbed579cfccc092c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6784,6 +6784,7 @@ M:	Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
 L:	openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org (moderated for non-subscribers)
 W:	http://openipmi.sourceforge.net/
 S:	Supported
+F:	Documentation/devicetree/bindings/ipmi/
 F:	Documentation/IPMI.txt
 F:	drivers/char/ipmi/
 F:	include/linux/ipmi*
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
