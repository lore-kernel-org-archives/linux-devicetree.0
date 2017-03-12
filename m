From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 13/23] MAINTAINERS: Add file patterns for mediatek device tree bindings
Date: Sun, 12 Mar 2017 14:16:57 +0100
Message-ID: <1489324627-19126-14-git-send-email-geert@linux-m68k.org>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489324627-19126-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
Please apply this patch directly if you want to be involved in device
tree binding documentation for your subsystem.

v2:
  - Add Reviewed-by.

Impact on next-20170310:

-Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:4/4=100%)
+Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (maintainer:ARM/Mediatek SoC support)
+Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (commit_signer:3/4=75%)
-Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> (commit_signer:1/4=25%,authored:1/4=25%)
-John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> (commit_signer:1/4=25%,authored:1/4=25%)
-James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> (commit_signer:1/4=25%)
-Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (authored:1/4=25%)
-Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> (authored:1/4=25%)
+linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated list:ARM/Mediatek SoC support)
+linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated list:ARM/Mediatek SoC support)
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e108e31636d4db2..7bda27689fff4214 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1525,6 +1525,7 @@ M:	Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
 L:	linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/soc/mediatek/
 F:	arch/arm/boot/dts/mt6*
 F:	arch/arm/boot/dts/mt7*
 F:	arch/arm/boot/dts/mt8*
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
