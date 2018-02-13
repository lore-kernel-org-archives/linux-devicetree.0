From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v10 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM architecture
Date: Tue, 13 Feb 2018 12:09:59 -0800
Message-ID: <20180213200959.160157-4-brendanhiggins@google.com>
References: <20180213200959.160157-1-brendanhiggins@google.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180213200959.160157-1-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, julien.thierry-5wv7dgnIgG8@public.gmane.org, pombredanne-od1rfyK75/E@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44cb004c765d..2fa95aba0f7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1598,6 +1598,20 @@ F:	drivers/pinctrl/nomadik/
 F:	drivers/i2c/busses/i2c-nomadik.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
 
+ARM/NUVOTON NPCM ARCHITECTURE
+M:	Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+M:	Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+R:	Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
+R:	Nancy Yuen <yuenn-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
+R:	Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
+L:	openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-npcm/
+F:	arch/arm/boot/dts/nuvoton-npcm*
+F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
+F:	drivers/*/*npcm*
+F:	Documentation/*/*npcm*
+
 ARM/NUVOTON W90X900 ARM ARCHITECTURE
 M:	Wan ZongShun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
-- 
2.16.0.rc1.238.g530d649a79-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
