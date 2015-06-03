From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 10/11] spi: add more debug prints in s3c64xx
Date: 3 Jun 2015 21:26:42 -0000
Message-ID: <305830ebf9c0ae98c4f6e0ebbdec7414d6762b36.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: devicetree@vger.kernel.org

The SPI NOR transfers mysteriously fail so add more debug prints about
SPI transactions.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 2a90705..0574f0e 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/platform_device.h>
@@ -469,6 +470,7 @@ static int wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
 {
 	void __iomem *regs = sdd->regs;
 	unsigned long val;
+	unsigned long start, end;
 	u32 status;
 	int ms;
 
@@ -477,8 +479,20 @@ static int wait_for_dma(struct s3c64xx_spi_driver_data *sdd,
 	ms += 10; /* some tolerance */
 	ms *= 10;
 
+	pr_debug("%s %s %s waiting for %ims transferring %zubytes@%iHz",
+		 __func__, sdd->pdev ? dev_name(&sdd->pdev->dev) : NULL,
+		 dev_name(&sdd->master->dev),
+		 ms, xfer->len, sdd->cur_speed);
+
 	val = msecs_to_jiffies(ms) + 10;
+	start = jiffies;
 	val = wait_for_completion_timeout(&sdd->xfer_completion, val);
+	end = jiffies;
+
+	pr_debug("%s %s %s waited %u ms",
+		 __func__, sdd->pdev ? dev_name(&sdd->pdev->dev) : NULL,
+		 dev_name(&sdd->master->dev),
+		 jiffies_to_msecs(end - start));
 
 	/*
 	 * If the previous xfer was completed within timeout, then
@@ -577,6 +591,14 @@ static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
 	void __iomem *regs = sdd->regs;
 	u32 val;
 
+	pr_debug("%s %s %s clk_from_cmu %i src_clk %s mode%s%s bpw %i",
+		 __func__, sdd->pdev ? dev_name(&sdd->pdev->dev) : NULL,
+		 dev_name(&sdd->master->dev), sdd->port_conf->clk_from_cmu,
+		 sdd->src_clk ? __clk_get_name(sdd->src_clk) : NULL,
+		 (sdd->cur_mode & SPI_CPOL) ? " SPI_CPOL" : "",
+		 (sdd->cur_mode & SPI_CPHA) ? " SPI_CPHA" : "",
+		 sdd->cur_bpw);
+
 	/* Disable Clock */
 	if (sdd->port_conf->clk_from_cmu) {
 		clk_disable_unprepare(sdd->src_clk);
@@ -679,6 +701,10 @@ static int s3c64xx_spi_transfer_one(struct spi_master *master,
 	unsigned long flags;
 	int use_dma;
 
+	pr_debug("%s %s %s %s xfer bpw %i speed %i",
+		 __func__, sdd->pdev ? dev_name(&sdd->pdev->dev) : NULL,
+		 dev_name(&master->dev), dev_name(&spi->dev),
+		 xfer->bits_per_word, xfer->speed_hz);
 	reinit_completion(&sdd->xfer_completion);
 
 	/* Only BPW and Speed may change across transfers */
@@ -697,6 +723,10 @@ static int s3c64xx_spi_transfer_one(struct spi_master *master,
 	    (sdd->rx_dma.ch && sdd->tx_dma.ch &&
 	     (xfer->len > ((FIFO_LVL_MASK(sdd) >> 1) + 1))))
 		use_dma = 1;
+	pr_debug("%s %s %s %s %susing dma",
+		 __func__, sdd->pdev ? dev_name(&sdd->pdev->dev) : NULL,
+		 dev_name(&master->dev), dev_name(&spi->dev),
+		 use_dma ? "" : "not ");
 
 	spin_lock_irqsave(&sdd->lock, flags);
 
-- 
2.1.4
