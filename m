From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] spi: bcm-qspi: Enable the driver on BMIPS_GENERIC
Date: Tue, 27 Dec 2016 10:59:22 +0900
Message-ID: <20161227015923.882-2-jaedon.shin@gmail.com>
References: <20161227015923.882-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161227015923.882-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Broadcom BCM7XXX ARM and MIPS based SoCs share a similar hardware
block for SPI.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/spi/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ec4aa252d6e8..c982a01022ba 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -162,7 +162,8 @@ config SPI_BCM63XX_HSSPI
 
 config SPI_BCM_QSPI
 	tristate "Broadcom BSPI and MSPI controller support"
-	depends on ARCH_BRCMSTB || ARCH_BCM || ARCH_BCM_IPROC || COMPILE_TEST
+	depends on ARCH_BRCMSTB || ARCH_BCM || ARCH_BCM_IPROC || \
+			BMIPS_GENERIC || COMPILE_TEST
 	default ARCH_BCM_IPROC
 	help
 	  Enables support for the Broadcom SPI flash and MSPI controller.
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
