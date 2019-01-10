Return-Path: <SRS0=qXSO=PS=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH RFC 2/2] spi-renesas-rpc: add R8A77970 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Message-ID: <db789714-df8b-2b96-345d-9bf0220978b0@cogentembedded.com>
Date: Thu, 10 Jan 2019 22:04:17 +0300
MIME-Version: 1.0
In-Reply-To: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Add the R-Car V3M (R8A77970) SoC support to the Renesas RPC-IF SPI driver.
This SoC has special RPC-IF register (DIVREG) that controls the RPC[D2]CK
clock divider instead of the CPG register (RPCCKCR) present in all other
R-Car gen3 SoC...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/spi/spi-renesas-rpc.c |   31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

Index: renesas/drivers/spi/spi-renesas-rpc.c
===================================================================
--- renesas.orig/drivers/spi/spi-renesas-rpc.c
+++ renesas/drivers/spi/spi-renesas-rpc.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/spi/spi.h>
@@ -140,6 +141,9 @@
 #define RPC_PHYOFFSET2		0x0084	// R/W
 #define RPC_PHYOFFSET2_OCTTMG(v) (((v) & 0x7) << 8)
 
+#define RPC_DIVREG		0x00A8	// R8A77970 only
+#define RPC_DIVREG_RATIO(v)	(((v) & 0x3) << 0)
+
 #define RPC_WBUF		0x8000	// Write Buffer
 #define RPC_WBUF_SIZE		256	// Write Buffer size
 
@@ -158,8 +162,24 @@ struct rpc_spi {
 	u32 totalxferlen;
 	enum spi_mem_data_dir xfer_dir;
 	struct reset_control *rstc;
+	int (*set_freq)(struct rpc_spi *rpc, unsigned long freq);
 };
 
+static int rpc_spi_clk_set_freq(struct rpc_spi *rpc, unsigned long freq)
+{
+	return clk_set_rate(rpc->clk_rpc, freq);
+}
+
+static int rpc_spi_v3m_set_freq(struct rpc_spi *rpc, unsigned long freq)
+{
+	u32 ratio;
+
+	ratio = ilog2(DIV_ROUND_UP(clk_get_rate(rpc->clk_rpc), freq));
+	if (ratio > 2)
+		ratio = 2;
+	return regmap_write(rpc->regmap, RPC_DIVREG, RPC_DIVREG_RATIO(ratio));
+}
+
 static int rpc_spi_set_freq(struct rpc_spi *rpc, unsigned long freq)
 {
 	int ret;
@@ -167,7 +187,7 @@ static int rpc_spi_set_freq(struct rpc_s
 	if (rpc->cur_speed_hz == freq)
 		return 0;
 
-	ret = clk_set_rate(rpc->clk_rpc, freq);
+	ret = rpc->set_freq(rpc, freq);
 	if (ret)
 		return ret;
 
@@ -650,7 +670,7 @@ static const struct regmap_config rpc_sp
 	.val_bits = 32,
 	.reg_stride = 4,
 	.fast_io = true,
-	.max_register = RPC_PHYOFFSET2,
+	.max_register = RPC_DIVREG,
 	.volatile_table = &rpc_spi_volatile_table,
 };
 
@@ -708,6 +728,8 @@ static int rpc_spi_probe(struct platform
 	if (IS_ERR(rpc->rstc))
 		return PTR_ERR(rpc->rstc);
 
+	rpc->set_freq = of_device_get_match_data(&pdev->dev);
+
 	pm_runtime_enable(&pdev->dev);
 	master->auto_runtime_pm = true;
 
@@ -745,8 +767,9 @@ static int rpc_spi_remove(struct platfor
 }
 
 static const struct of_device_id rpc_spi_of_ids[] = {
-	{ .compatible = "renesas,r8a77980-rpc", },
-	{ .compatible = "renesas,r8a77995-rpc", },
+	{ .compatible = "renesas,r8a77970-rpc", .data = rpc_spi_v3m_set_freq, },
+	{ .compatible = "renesas,r8a77980-rpc", .data = rpc_spi_clk_set_freq, },
+	{ .compatible = "renesas,r8a77995-rpc", .data = rpc_spi_clk_set_freq, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rpc_spi_of_ids);
