From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 4/4] MAINTAINERS: add i.MX8 DT path to i.MX architecture
Date: Thu,  1 Feb 2018 19:31:26 +0100
Message-ID: <20180201183126.32384-4-l.stach@pengutronix.de>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180201183126.32384-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Shawn agreed to take patches for the i.MX8 parts through his tree.
Also add the NXP Linux team as a reviewer.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa71ab52fd76..5e1f413d9ae5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1382,6 +1382,7 @@ ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
 M:	Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
 M:	Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
 R:	Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
+R:	NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>
 L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
@@ -1389,6 +1390,7 @@ F:	arch/arm/mach-imx/
 F:	arch/arm/mach-mxs/
 F:	arch/arm/boot/dts/imx*
 F:	arch/arm/configs/imx*_defconfig
+F:	arch/arm64/boot/dts/freescale/imx*
 F:	drivers/clk/imx/
 F:	drivers/soc/imx/
 F:	include/soc/imx/
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
