From: "Ramuthevar,Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v3 2/3] mtd: spi-nor: cadence-quadspi: Disable the DAC for Intel LGM SoC
Date: Mon,  9 Sep 2019 18:47:32 +0800
Message-ID: <20190909104733.14273-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at, jwboyer@gmail.com, boris.brezillon@free-electrons.com, cyrille.pitchen@atmel.com, david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com, tudor.ambarus@gmail.com, vigneshr@ti.com, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

on Intel's Lightning Mountain(LGM) SoCs QSPI controller do not use
Direct Access Controller(DAC).

This patch introduces to properly disable the Direct Access Controller
for data transfer instead it uses indirect data transfer.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/mtd/spi-nor/Kconfig           |  2 +-
 drivers/mtd/spi-nor/cadence-quadspi.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 6de83277ce8b..ba2e372ae514 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -34,7 +34,7 @@ config SPI_ASPEED_SMC
 
 config SPI_CADENCE_QUADSPI
 	tristate "Cadence Quad SPI controller"
-	depends on OF && (ARM || ARM64 || COMPILE_TEST)
+	depends on OF && (ARM || ARM64 || COMPILE_TEST || X86)
 	help
 	  Enable support for the Cadence Quad SPI Flash controller.
 
diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 67f15a1f16fd..73b9fbd1508a 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -33,6 +33,7 @@
 
 /* Quirks */
 #define CQSPI_NEEDS_WR_DELAY		BIT(0)
+#define CQSPI_DISABLE_DAC_MODE		BIT(1)
 
 /* Capabilities mask */
 #define CQSPI_BASE_HWCAPS_MASK					\
@@ -609,6 +610,13 @@ static int cqspi_write_setup(struct spi_nor *nor)
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	void __iomem *reg_base = cqspi->iobase;
 
+	/* Disable direct access controller */
+	if (!f_pdata->use_direct_mode) {
+		reg = readl(reg_base + CQSPI_REG_CONFIG);
+		reg &= ~CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL;
+		writel(reg, reg_base + CQSPI_REG_CONFIG);
+	}
+
 	/* Set opcode. */
 	reg = nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
 	writel(reg, reg_base + CQSPI_REG_WR_INSTR);
@@ -1328,6 +1336,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct resource *res_ahb;
 	struct reset_control *rstc, *rstc_ocp;
 	const struct cqspi_driver_platdata *ddata;
+	struct cqspi_flash_pdata *f_pdata;
 	int ret;
 	int irq;
 
@@ -1436,6 +1445,9 @@ static int cqspi_probe(struct platform_device *pdev)
 		goto probe_setup_failed;
 	}
 
+	if (ddata && (ddata->quirks & CQSPI_DISABLE_DAC_MODE))
+		f_pdata->use_direct_mode = false;
+
 	return ret;
 probe_setup_failed:
 	cqspi_controller_enable(cqspi, 0);
@@ -1510,6 +1522,11 @@ static const struct cqspi_driver_platdata am654_ospi = {
 	.quirks = CQSPI_NEEDS_WR_DELAY,
 };
 
+static const struct cqspi_driver_platdata intel_lgm_qspi = {
+	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
+	.quirks = CQSPI_DISABLE_DAC_MODE,
+};
+
 static const struct of_device_id cqspi_dt_ids[] = {
 	{
 		.compatible = "cdns,qspi-nor",
@@ -1523,6 +1540,10 @@ static const struct of_device_id cqspi_dt_ids[] = {
 		.compatible = "ti,am654-ospi",
 		.data = &am654_ospi,
 	},
+	{
+		.compatible = "intel,lgm-qspi",
+		.data = &intel_lgm_qspi,
+	},
 	{ /* end of table */ }
 };
 
-- 
2.11.0
