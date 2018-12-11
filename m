From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller
Date: Tue, 11 Dec 2018 13:21:06 +0530
Message-ID: <20181211075106.21317-3-vigneshr@ti.com>
References: <20181211075106.21317-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211075106.21317-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Cadence OSPI controller IP supports Octal IO (x8 IO lines),
It also has an integrated PHY. IP register layout is very
similar to existing QSPI IP except for additional bits to support Octal
and Octal DDR mode. Therefore, extend current driver to support Octal
mode.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
v2:
Declare Octal mode capability based on compatible.

 drivers/mtd/spi-nor/cadence-quadspi.c | 54 +++++++++++++++++++++------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 04cedd3a2bf6..31ed50f78972 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -93,6 +93,11 @@ struct cqspi_st {
 	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
 };
 
+struct cqspi_driver_platdata {
+	u32 hwcaps_mask;
+	u8 quirks;
+};
+
 /* Operation timeout value */
 #define CQSPI_TIMEOUT_MS			500
 #define CQSPI_READ_TIMEOUT_MS			10
@@ -101,6 +106,7 @@ struct cqspi_st {
 #define CQSPI_INST_TYPE_SINGLE			0
 #define CQSPI_INST_TYPE_DUAL			1
 #define CQSPI_INST_TYPE_QUAD			2
+#define CQSPI_INST_TYPE_OCTAL			3
 
 #define CQSPI_DUMMY_CLKS_PER_BYTE		8
 #define CQSPI_DUMMY_BYTES_MAX			4
@@ -911,6 +917,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
 		case SNOR_PROTO_1_1_4:
 			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
 			break;
+		case SNOR_PROTO_1_1_8:
+			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -1213,21 +1222,19 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
 
 static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
 {
-	const struct spi_nor_hwcaps hwcaps = {
-		.mask = SNOR_HWCAPS_READ |
-			SNOR_HWCAPS_READ_FAST |
-			SNOR_HWCAPS_READ_1_1_2 |
-			SNOR_HWCAPS_READ_1_1_4 |
-			SNOR_HWCAPS_PP,
-	};
 	struct platform_device *pdev = cqspi->pdev;
 	struct device *dev = &pdev->dev;
+	struct cqspi_driver_platdata *ddata;
+	struct spi_nor_hwcaps hwcaps;
 	struct cqspi_flash_pdata *f_pdata;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
 	unsigned int cs;
 	int i, ret;
 
+	ddata = (struct cqspi_driver_platdata *)of_device_get_match_data(dev);
+	hwcaps.mask = ddata->hwcaps_mask;
+
 	/* Get flash device data */
 	for_each_available_child_of_node(dev->of_node, np) {
 		ret = of_property_read_u32(np, "reg", &cs);
@@ -1310,7 +1317,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct cqspi_st *cqspi;
 	struct resource *res;
 	struct resource *res_ahb;
-	unsigned long data;
+	struct cqspi_driver_platdata *ddata;
 	int ret;
 	int irq;
 
@@ -1377,8 +1384,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	}
 
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
-	data  = (unsigned long)of_device_get_match_data(dev);
-	if (data & CQSPI_NEEDS_WR_DELAY)
+	ddata  = (struct cqspi_driver_platdata *)of_device_get_match_data(dev);
+	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
 		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
 						   cqspi->master_ref_clk_hz);
 
@@ -1460,14 +1467,37 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
 #define CQSPI_DEV_PM_OPS	NULL
 #endif
 
+#define cqspi_base_hwcaps_mask					\
+	(SNOR_HWCAPS_READ | SNOR_HWCAPS_READ_FAST |		\
+	SNOR_HWCAPS_READ_1_1_2 | SNOR_HWCAPS_READ_1_1_4 |	\
+	SNOR_HWCAPS_PP)
+
+static const struct cqspi_driver_platdata cdns_qspi = {
+	.hwcaps_mask = cqspi_base_hwcaps_mask,
+};
+
+static const struct cqspi_driver_platdata k2g_qspi = {
+	.hwcaps_mask = cqspi_base_hwcaps_mask,
+	.quirks = CQSPI_NEEDS_WR_DELAY,
+};
+
+static const struct cqspi_driver_platdata am654_ospi = {
+	.hwcaps_mask = cqspi_base_hwcaps_mask | SNOR_HWCAPS_READ_1_1_8,
+	.quirks = CQSPI_NEEDS_WR_DELAY,
+};
+
 static const struct of_device_id cqspi_dt_ids[] = {
 	{
 		.compatible = "cdns,qspi-nor",
-		.data = (void *)0,
+		.data = (void *)&cdns_qspi,
 	},
 	{
 		.compatible = "ti,k2g-qspi",
-		.data = (void *)CQSPI_NEEDS_WR_DELAY,
+		.data = (void *)&k2g_qspi,
+	},
+	{
+		.compatible = "ti,am654-ospi",
+		.data = (void *)&am654_ospi,
 	},
 	{ /* end of table */ }
 };
-- 
2.19.2
