From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 4/6] dmaengine: sun6i: Add a quirk for setting
 mode fields
Date: Thu,  7 Mar 2019 17:58:27 +0100
Message-ID: <20190307165829.9086-5-jernej.skrabec@siol.net>
References: <20190307165829.9086-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBSE3QXSAKGQETOBSOQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190307165829.9086-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org
List-Id: devicetree@vger.kernel.org

H6 DMA has mode fields in different position than any other currently
supported DMA controller.

Add a quirk for that.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 46 ++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9dd23b76d841..6a37f8bb39b1 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -70,15 +70,13 @@
 #define DMA_CHAN_CUR_CFG	0x0c
 #define DMA_CHAN_MAX_DRQ_A31		0x1f
 #define DMA_CHAN_CFG_SRC_DRQ_A31(x)	((x) & DMA_CHAN_MAX_DRQ_A31)
-#define DMA_CHAN_CFG_SRC_IO_MODE	BIT(5)
-#define DMA_CHAN_CFG_SRC_LINEAR_MODE	(0 << 5)
+#define DMA_CHAN_CFG_SRC_MODE_A31(x)	(((x) & 0x1) << 5)
 #define DMA_CHAN_CFG_SRC_BURST_A31(x)	(((x) & 0x3) << 7)
 #define DMA_CHAN_CFG_SRC_BURST_H3(x)	(((x) & 0x3) << 6)
 #define DMA_CHAN_CFG_SRC_WIDTH(x)	(((x) & 0x3) << 9)
 
 #define DMA_CHAN_CFG_DST_DRQ_A31(x)	(DMA_CHAN_CFG_SRC_DRQ_A31(x) << 16)
-#define DMA_CHAN_CFG_DST_IO_MODE	(DMA_CHAN_CFG_SRC_IO_MODE << 16)
-#define DMA_CHAN_CFG_DST_LINEAR_MODE	(DMA_CHAN_CFG_SRC_LINEAR_MODE << 16)
+#define DMA_CHAN_CFG_DST_MODE_A31(x)	(DMA_CHAN_CFG_SRC_MODE_A31(x) << 16)
 #define DMA_CHAN_CFG_DST_BURST_A31(x)	(DMA_CHAN_CFG_SRC_BURST_A31(x) << 16)
 #define DMA_CHAN_CFG_DST_BURST_H3(x)	(DMA_CHAN_CFG_SRC_BURST_H3(x) << 16)
 #define DMA_CHAN_CFG_DST_WIDTH(x)	(DMA_CHAN_CFG_SRC_WIDTH(x) << 16)
@@ -98,6 +96,8 @@
 #define LLI_LAST_ITEM	0xfffff800
 #define NORMAL_WAIT	8
 #define DRQ_SDRAM	1
+#define LINEAR_MODE     0
+#define IO_MODE         1
 
 /* forward declaration */
 struct sun6i_dma_dev;
@@ -126,6 +126,7 @@ struct sun6i_dma_config {
 	void (*clock_autogate_enable)(struct sun6i_dma_dev *);
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
+	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
@@ -318,6 +319,12 @@ static void sun6i_set_drq_a31(u32 *p_cfg, s8 src_drq, s8 dst_drq)
 		  DMA_CHAN_CFG_DST_DRQ_A31(dst_drq);
 }
 
+static void sun6i_set_mode_a31(u32 *p_cfg, s8 src_mode, s8 dst_mode)
+{
+	*p_cfg |= DMA_CHAN_CFG_SRC_MODE_A31(src_mode) |
+		  DMA_CHAN_CFG_DST_MODE_A31(dst_mode);
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -641,13 +648,12 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 
 	burst = convert_burst(8);
 	width = convert_buswidth(DMA_SLAVE_BUSWIDTH_4_BYTES);
-	v_lli->cfg = DMA_CHAN_CFG_DST_LINEAR_MODE |
-		DMA_CHAN_CFG_SRC_LINEAR_MODE |
-		DMA_CHAN_CFG_SRC_WIDTH(width) |
+	v_lli->cfg = DMA_CHAN_CFG_SRC_WIDTH(width) |
 		DMA_CHAN_CFG_DST_WIDTH(width);
 
 	sdev->cfg->set_burst_length(&v_lli->cfg, burst, burst);
 	sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, DRQ_SDRAM);
+	sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, LINEAR_MODE);
 
 	sun6i_dma_lli_add(NULL, v_lli, p_lli, txd);
 
@@ -699,10 +705,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		if (dir == DMA_MEM_TO_DEV) {
 			v_lli->src = sg_dma_address(sg);
 			v_lli->dst = sconfig->dst_addr;
-			v_lli->cfg = lli_cfg |
-				DMA_CHAN_CFG_DST_IO_MODE |
-				DMA_CHAN_CFG_SRC_LINEAR_MODE;
+			v_lli->cfg = lli_cfg;
 			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
+			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
 
 			dev_dbg(chan2dev(chan),
 				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
@@ -713,10 +718,9 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_slave_sg(
 		} else {
 			v_lli->src = sconfig->src_addr;
 			v_lli->dst = sg_dma_address(sg);
-			v_lli->cfg = lli_cfg |
-				DMA_CHAN_CFG_DST_LINEAR_MODE |
-				DMA_CHAN_CFG_SRC_IO_MODE;
+			v_lli->cfg = lli_cfg;
 			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
+			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
 
 			dev_dbg(chan2dev(chan),
 				"%s; chan: %d, dest: %pad, src: %pad, len: %u. flags: 0x%08lx\n",
@@ -782,17 +786,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 		if (dir == DMA_MEM_TO_DEV) {
 			v_lli->src = buf_addr + period_len * i;
 			v_lli->dst = sconfig->dst_addr;
-			v_lli->cfg = lli_cfg |
-				DMA_CHAN_CFG_DST_IO_MODE |
-				DMA_CHAN_CFG_SRC_LINEAR_MODE;
+			v_lli->cfg = lli_cfg;
 			sdev->cfg->set_drq(&v_lli->cfg, DRQ_SDRAM, vchan->port);
+			sdev->cfg->set_mode(&v_lli->cfg, LINEAR_MODE, IO_MODE);
 		} else {
 			v_lli->src = sconfig->src_addr;
 			v_lli->dst = buf_addr + period_len * i;
-			v_lli->cfg = lli_cfg |
-				DMA_CHAN_CFG_DST_LINEAR_MODE |
-				DMA_CHAN_CFG_SRC_IO_MODE;
+			v_lli->cfg = lli_cfg;
 			sdev->cfg->set_drq(&v_lli->cfg, vchan->port, DRQ_SDRAM);
+			sdev->cfg->set_mode(&v_lli->cfg, IO_MODE, LINEAR_MODE);
 		}
 
 		prev = sun6i_dma_lli_add(prev, v_lli, p_lli, txd);
@@ -1058,6 +1060,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.nr_max_vchans   = 53,
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
+	.set_mode         = sun6i_set_mode_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1080,6 +1083,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.clock_autogate_enable = sun6i_enable_clock_autogate_a23,
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
+	.set_mode         = sun6i_set_mode_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1097,6 +1101,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.clock_autogate_enable = sun6i_enable_clock_autogate_a23,
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
+	.set_mode         = sun6i_set_mode_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1121,6 +1126,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
+	.set_mode         = sun6i_set_mode_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1141,6 +1147,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
 	.set_burst_length = sun6i_set_burst_length_h3,
 	.set_drq          = sun6i_set_drq_a31,
+	.set_mode         = sun6i_set_mode_a31,
 	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
@@ -1165,6 +1172,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.clock_autogate_enable = sun6i_enable_clock_autogate_a23,
 	.set_burst_length = sun6i_set_burst_length_a31,
 	.set_drq          = sun6i_set_drq_a31,
+	.set_mode         = sun6i_set_mode_a31,
 	.src_burst_lengths = BIT(1) | BIT(8),
 	.dst_burst_lengths = BIT(1) | BIT(8),
 	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
-- 
2.21.0
