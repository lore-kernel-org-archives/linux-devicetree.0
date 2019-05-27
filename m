From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 3/7] dmaengine: sun6i: Add a quirk for setting DRQ fields
Date: Mon, 27 May 2019 22:14:55 +0200
Message-ID: <20190527201459.20130-4-peron.clem@gmail.com>
References: <20190527201459.20130-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527201459.20130-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 DMA has more than 32 possible DRQs. That means that current maximum
of 31 DRQs is not enough anymore.

Add a quirk which will set source and destination DRQ number.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/dma/sun6i-dma.c | 48 ++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7d9606997251..f725b93fd21a 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -68,15 +68,15 @@
 #define DMA_CHAN_LLI_ADDR	0x08
 
 #define DMA_CHAN_CUR_CFG	0x0c
-#define DMA_CHAN_MAX_DRQ		0x1f
-#define DMA_CHAN_CFG_SRC_DRQ(x)		((x) & DMA_CHAN_MAX_DRQ)
+#define DMA_CHAN_MAX_DRQ_A31		0x1f
+#define DMA_CHAN_CFG_SRC_DRQ_A31(x)	((x) & DMA_CHAN_MAX_DRQ_A31)
 #define DMA_CHAN_CFG_SRC_IO_MODE	BIT(5)
 #define DMA_CHAN_CFG_SRC_LINEAR_MODE	(0 << 5)
 #define DMA_CHAN_CFG_SRC_BURST_A31(x)	(((x) & 0x3) << 7)
 #define DMA_CHAN_CFG_SRC_BURST_H3(x)	(((x) & 0x3) << 6)
 #define DMA_CHAN_CFG_SRC_WIDTH(x)	(((x) & 0x3) << 9)
 
-#define DMA_CHAN_CFG_DST_DRQ(x)		(DMA_CHAN_CFG_SRC_DRQ(x) << 16)
+#define DMA_CHAN_CFG_DST_DRQ_A31(x)	(DMA_CHAN_CFG_SRC_DRQ_A31(x) << 16)
 #define DMA_CHAN_CFG_DST_IO_MODE	(DMA_CHAN_CFG_SRC_IO_MODE << 16)
 #define DMA_CHAN_CFG_DST_LINEAR_MODE	(DMA_CHAN_CFG_SRC_LINEAR_MODE << 16)
 #define DMA_CHAN_CFG_DST_BURST_A31(x)	(DMA_CHAN_CFG_SRC_BURST_A31(x) << 16)
@@ -125,6 +125,7 @@ struct sun6i_dma_config {
 	 */
 	void (*clock_autogate_enable)(struct sun6i_dma_dev *);
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
+	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
@@ -311,6 +312,12 @@ static void sun6i_set_burst_length_h3(u32 *p_cfg, s8 src_burst, s8 dst_burst)
 		  DMA_CHAN_CFG_DST_BURST_H3(dst_burst);
 }
 
+static void sun6i_set_drq_a31(u32 *p_cfg, s8 src_drq, s8 dst_drq)
+{
+	*p_cfg |= DMA_CHAN_CFG_SRC_DRQ_A31(src_drq) |
+		  DMA_CHAN_CFG_DST_DRQ_A31(dst_drq);
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -634,14 +641,13 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 
 	burst = convert_burst(8);
 	width = convert_buswidth(DMA_SLAVE_BUSWIDTH_4_BYTES);
-	v_lli->cfg = DMA_CHAN_CFG_SRC_DRQ(DRQ_SDRAM) |
-		DMA_CHAN_CFG_DST_DRQ(DRQ_SDRAM) |
-		DMA_CHAN_CFG_DST_LINEAR_MODE |
+	v_lli->cfg = DMA_CHAN_CFG_DST_LINEAR_MODE |
 		DMA_CHAN_CFG_SRC_LINEAR_MODE |
 		DMA_CHAN_CFG_SRC_WIDTH(width) |
 		DMA_CHAN_CFG_DST_WIDTH(width);
 
 	sdev->cfg->set_burst_length(&v_lli->cfg, burst, burst);
+	sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, DRQ_SDRAM);
 
 	sun6i_dma_lli_add(NULL, v_lli, p_lli, txd);
 
@@ -695,9 +701,8 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 			v_lli->dst = sconfig->dst_addr;
 			v_lli->cfg = lli_cfg |
 				DMA_CHAN_CFG_DST_IO_MODE |
-				DMA_CHAN_CFG_SRC_LINEAR_MODE |
-				DMA_CHAN_CFG_SRC_DRQ(DRQ_SDRAM) |
-				DMA_CHAN_CFG_DST_DRQ(vchan->port);
+				DMA_CHAN_CFG_SRC_LINEAR_MODE;
+			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
 
 			dev_dbg(chan2dev(chan),
 				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
@@ -710,9 +715,8 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 			v_lli->dst = sg_dma_address(sg);
 			v_lli->cfg = lli_cfg |
 				DMA_CHAN_CFG_DST_LINEAR_MODE |
-				DMA_CHAN_CFG_SRC_IO_MODE |
-				DMA_CHAN_CFG_DST_DRQ(DRQ_SDRAM) |
-				DMA_CHAN_CFG_SRC_DRQ(vchan->port);
+				DMA_CHAN_CFG_SRC_IO_MODE;
+			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
 
 			dev_dbg(chan2dev(chan),
 				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
@@ -780,17 +784,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 			v_lli->dst = sconfig->dst_addr;
 			v_lli->cfg = lli_cfg |
 				DMA_CHAN_CFG_DST_IO_MODE |
-				DMA_CHAN_CFG_SRC_LINEAR_MODE |
-				DMA_CHAN_CFG_SRC_DRQ(DRQ_SDRAM) |
-				DMA_CHAN_CFG_DST_DRQ(vchan->port);
+				DMA_CHAN_CFG_SRC_LINEAR_MODE;
+			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
 		} else {
 			v_lli->src = sconfig->src_addr;
 			v_lli->dst = buf_addr + period_len * i;
 			v_lli->cfg = lli_cfg |
 				DMA_CHAN_CFG_DST_LINEAR_MODE |
-				DMA_CHAN_CFG_SRC_IO_MODE |
-				DMA_CHAN_CFG_DST_DRQ(DRQ_SDRAM) |
-				DMA_CHAN_CFG_SRC_DRQ(vchan->port);
+				DMA_CHAN_CFG_SRC_IO_MODE;
+			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
 		}
 
 		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
@@ -1055,6 +1057,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.nr_max_requests = 30,
 	.nr_max_vchans   = 53,
 	.set_burst_length = sun6i_set_burst_length_a31,
+	.set_drq          = sun6i_set_drq_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1076,6 +1079,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.nr_max_vchans   = 37,
 	.clock_autogate_enable = sun6i_enable_clock_autogate_a23,
 	.set_burst_length = sun6i_set_burst_length_a31,
+	.set_drq          = sun6i_set_drq_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1092,6 +1096,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.nr_max_vchans   = 39,
 	.clock_autogate_enable = sun6i_enable_clock_autogate_a23,
 	.set_burst_length = sun6i_set_burst_length_a31,
+	.set_drq          = sun6i_set_drq_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1115,6 +1120,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.nr_max_vchans   = 34,
 	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
 	.set_burst_length = sun6i_set_burst_length_h3,
+	.set_drq          = sun6i_set_drq_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1134,6 +1140,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
 	.set_burst_length = sun6i_set_burst_length_h3,
+	.set_drq          = sun6i_set_drq_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1157,6 +1164,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.nr_max_vchans   = 24,
 	.clock_autogate_enable = sun6i_enable_clock_autogate_a23,
 	.set_burst_length = sun6i_set_burst_length_a31,
+	.set_drq          = sun6i_set_drq_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1272,8 +1280,8 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(np, "dma-requests", &sdc->max_request);
 	if (ret && !sdc->max_request) {
 		dev_info(&pdev->dev, "Missing dma-requests, using %u.\n",
-			 DMA_CHAN_MAX_DRQ);
-		sdc->max_request = DMA_CHAN_MAX_DRQ;
+			 DMA_CHAN_MAX_DRQ_A31);
+		sdc->max_request = DMA_CHAN_MAX_DRQ_A31;
 	}
 
 	/*
-- 
2.20.1
