From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 14/19] ARM: dts: aspeed: Sort ASPEED entries in makefile
Date: Fri, 15 Dec 2017 16:54:38 +1030
Message-ID: <20171215062443.23059-15-joel@jms.id.au>
References: <20171215062443.23059-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215062443.23059-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

In preperation for adding more boards.

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 arch/arm/boot/dts/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9caf21..5d1e9d37bf3a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1101,7 +1101,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt8127-moose.dtb \
 	mt8135-evbp1.dtb
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
-dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
-	aspeed-bmc-opp-romulus.dtb \
-	aspeed-ast2500-evb.dtb
+dtb-$(CONFIG_ARCH_ASPEED) += \
+	aspeed-ast2500-evb.dtb \
+	aspeed-bmc-opp-palmetto.dtb \
+	aspeed-bmc-opp-romulus.dtb
 endif
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
