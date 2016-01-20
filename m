From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 1/6] dma: enable mxs-dma for imx6ul
Date: Wed, 20 Jan 2016 13:57:01 +0100
Message-ID: <1453294626-17608-2-git-send-email-LW@KARO-electronics.de>
References: <1453294626-17608-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453294626-17608-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mxs-dma unit is also available on i.MX6UL. Make it possible to
select it in Kconfig.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 drivers/dma/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 79b1390..2516524 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -341,12 +341,13 @@ config MV_XOR
=20
 config MXS_DMA
 	bool "MXS DMA support"
-	depends on SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q
+	depends on SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q || SOC_MX6UL
 	select STMP_DEVICE
 	select DMA_ENGINE
 	help
 	  Support the MXS DMA engine. This engine including APBH-DMA
-	  and APBX-DMA is integrated into Freescale i.MX23/28/MX6Q/MX6DL chip=
s.
+	  and APBX-DMA is integrated into Freescale
+	  i.MX23/28/MX6Q/MX6DL/MX6UL chips.
=20
 config MX3_IPU
 	bool "MX3x Image Processing Unit support"
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
