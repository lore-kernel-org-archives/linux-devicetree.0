From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCHv4 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Date: Wed,  8 May 2019 08:43:38 -0500
Message-ID: <20190508134338.20565-2-dinguyen@kernel.org>
References: <20190508134338.20565-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508134338.20565-1-dinguyen@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: dinguyen@kernel.org, marex@denx.de, tudor.ambarus@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tien-Fong Chee <tien.fong.chee@intel.com>
List-Id: devicetree@vger.kernel.org

Get the reset control properties for the QSPI controller and bring them
out of reset. Most will have just one reset bit, but there is an additional
OCP reset bit that is used ECC. The OCP reset bit will also need to get
de-asserted as well. [1]

[1] https://www.intel.com/content/www/us/en/programmable/hps/arria-10/hps.html#reg_soc_top/sfo1429890575955.html

Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v4: fix compile error
v3: return full error by using PTR_ERR(rtsc)
    move reset control calls until after the clock enables
    use udelay(2) to be safe
    Add optional OCP(Open Core Protocol) reset signal
v2: use devm_reset_control_get_optional_exclusive
    print an error message
    return -EPROBE_DEFER
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 792628750eec..d3906e5a1d44 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -34,6 +34,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/spi/spi.h>
 #include <linux/timer.h>
@@ -1336,6 +1337,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct cqspi_st *cqspi;
 	struct resource *res;
 	struct resource *res_ahb;
+	struct reset_control *rstc;
+	struct reset_control *rstc_ocp;
 	const struct cqspi_driver_platdata *ddata;
 	int ret;
 	int irq;
@@ -1402,6 +1405,33 @@ static int cqspi_probe(struct platform_device *pdev)
 		goto probe_clk_failed;
 	}
 
+	/* Obtain QSPI reset control */
+	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
+	if (IS_ERR(rstc)) {
+		dev_err(dev, "Cannot get QSPI reset.\n");
+		if (PTR_ERR(rstc) == -EPROBE_DEFER)
+			return PTR_ERR(rstc);
+	}
+
+	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
+	if (IS_ERR(rstc_ocp)) {
+		dev_err(dev, "Cannot get QSPI OCP reset.\n");
+		if (PTR_ERR(rstc_ocp) == -EPROBE_DEFER)
+			return PTR_ERR(rstc_ocp);
+	}
+
+	if (rstc) {
+		reset_control_assert(rstc);
+		udelay(2);
+		reset_control_deassert(rstc);
+	}
+
+	if (rstc_ocp) {
+		reset_control_assert(rstc_ocp);
+		udelay(2);
+		reset_control_deassert(rstc_ocp);
+	}
+
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
 	ddata  = of_device_get_match_data(dev);
 	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
-- 
2.20.0
