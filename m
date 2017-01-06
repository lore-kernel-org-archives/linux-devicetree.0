From: linshunquan 00354166 <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v1] mtd: spi nor: modify the boot and flash type of FMC
Date: Fri, 6 Jan 2017 17:12:11 +0800
Message-ID: <1483693931-22249-1-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linshunquan 00354166 <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

(1) The HiSilicon Flash Memory Controller(FMC) is a multi-functions
 device which supports SPI Nor flash controller, SPI nand Flash
 controller and parallel nand flash controller. So when we are prepare
 to operation SPI Nor, we should make sure the flash type is SPI Nor.

(2) Make sure the boot type is Normal Type before initialize the SPI
    Nor controller.

Signed-off-by: linshunquan 00354166 <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 drivers/mtd/spi-nor/hisi-sfc.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index 20378b0..7855024 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -32,6 +32,8 @@
 #define FMC_CFG_OP_MODE_MASK		BIT_MASK(0)
 #define FMC_CFG_OP_MODE_BOOT		0
 #define FMC_CFG_OP_MODE_NORMAL		1
+#define FMC_CFG_OP_MODE_SEL(mode)      ((mode) & 0x1)
+#define FMC_CFG_FLASH_SEL_SPI_NOR	(0x0 << 1)
 #define FMC_CFG_FLASH_SEL(type)		(((type) & 0x3) << 1)
 #define FMC_CFG_FLASH_SEL_MASK		0x6
 #define FMC_ECC_TYPE(type)		(((type) & 0x7) << 5)
@@ -141,10 +143,36 @@ static int get_if_type(enum read_mode flash_read)
 	return if_type;
 }
 
+static void spi_nor_switch_spi_type(struct hifmc_host *host)
+{
+	unsigned int reg;
+
+	reg = readl(host->regbase + FMC_CFG);
+	if ((reg & FMC_CFG_FLASH_SEL_MASK)
+		   	== FMC_CFG_FLASH_SEL_SPI_NOR)
+		return;
+
+	/* if the flash type isn't spi nor, change it */
+	reg &= ~FMC_CFG_FLASH_SEL_MASK;
+	reg |= FMC_CFG_FLASH_SEL(0);
+	writel(reg, host->regbase + FMC_CFG);
+}
+
 static void hisi_spi_nor_init(struct hifmc_host *host)
 {
 	u32 reg;
 
+	/* switch the flash type to spi nor */
+	spi_nor_switch_spi_type(host);
+
+	/* set the boot mode to normal */
+	reg = readl(host->regbase + FMC_CFG);
+	if ((reg & FMC_CFG_OP_MODE_MASK) == FMC_CFG_OP_MODE_BOOT) {
+		reg |= FMC_CFG_OP_MODE_SEL(FMC_CFG_OP_MODE_NORMAL);
+		writel(reg, host->regbase + FMC_CFG);
+	}
+
+	/* set timming */
 	reg = TIMING_CFG_TCSH(CS_HOLD_TIME)
 		| TIMING_CFG_TCSS(CS_SETUP_TIME)
 		| TIMING_CFG_TSHSL(CS_DESELECT_TIME);
@@ -167,6 +195,8 @@ static int hisi_spi_nor_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 	if (ret)
 		goto out;
 
+	spi_nor_switch_spi_type(host);
+
 	return 0;
 
 out:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
