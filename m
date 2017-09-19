From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: [RESEND PATCH v2 4/5] mtd: spi-nor: cadence-quadspi: Add support to enable loop-back clock circuit
Date: Tue, 19 Sep 2017 16:26:04 +0530
Message-ID: <20170919105605.18533-5-vigneshr@ti.com>
References: <20170919105605.18533-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170919105605.18533-1-vigneshr-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cadence QSPI IP has a adapted loop-back circuit which can be enabled by
setting BYPASS field to 0 in READCAPTURE register. It enables use of
QSPI return clock to latch the data rather than the internal QSPI
reference clock. For high speed operations, adapted loop-back circuit
using QSPI return clock helps to increase data valid window.

Based on DT parameter cdns,rclk-en enable adapted loop-back circuit
for boards which do have QSPI return clock provided.
This patch also modifies cqspi_readdata_capture() function's bypass
parameter to bool to match how its used in the function.

Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index bb0cb02a6938..c11ced529ddd 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -78,6 +78,7 @@ struct cqspi_st {
 	bool			is_decoded_cs;
 	u32			fifo_depth;
 	u32			fifo_width;
+	bool			rclk_en;
 	u32			trigger_address;
 	u32			wr_delay;
 	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
@@ -788,7 +789,7 @@ static void cqspi_config_baudrate_div(struct cqspi_st *cqspi)
 }
 
 static void cqspi_readdata_capture(struct cqspi_st *cqspi,
-				   const unsigned int bypass,
+				   const bool bypass,
 				   const unsigned int delay)
 {
 	void __iomem *reg_base = cqspi->iobase;
@@ -852,7 +853,8 @@ static void cqspi_configure(struct spi_nor *nor)
 		cqspi->sclk = sclk;
 		cqspi_config_baudrate_div(cqspi);
 		cqspi_delay(nor);
-		cqspi_readdata_capture(cqspi, 1, f_pdata->read_delay);
+		cqspi_readdata_capture(cqspi, !cqspi->rclk_en,
+				       f_pdata->read_delay);
 	}
 
 	if (switch_cs || switch_ck)
@@ -1049,6 +1051,8 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
+
 	return 0;
 }
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
