From: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 3/7] mtd: spi-nor: fsl-quadspi: add support for layerscape
Date: Tue, 26 Jan 2016 15:23:57 +0800
Message-ID: <1453793041-35868-3-git-send-email-yao.yuan@freescale.com>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453793041-35868-1-git-send-email-yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yao.yuan-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

LS1043a and LS2080A in the Layerscape family also support Freescale Quad
SPI, make Quad SPI selectable for these hardwares.

Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
---
Changed in v4:
No changes.

Changed in v3:
No changes.

Changed in v2:
Update my email to <yao.yuan-3arQi8VN3Tc@public.gmane.org>
---
 drivers/mtd/spi-nor/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index a28c278..6b53deb 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -30,7 +30,7 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
