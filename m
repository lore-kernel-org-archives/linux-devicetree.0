Return-Path: <SRS0=oVvL=IM=nxp.com=wen.he_1@kernel.org>
From: Wen He <wen.he_1@nxp.com>
Subject: [v5 1/6] dmaengine: fsldma: Replace DMA_IN/OUT by FSL_DMA_IN/OUT
Date: Fri, 25 May 2018 19:19:15 +0800
Message-ID: <20180525111920.24498-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com, wen.he_1@nxp.com
List-ID: <devicetree@vger.kernel.org>

This patch implenment a standard macro call functions is
used to NXP dma drivers.

Signed-off-by: Wen He <wen.he_1@nxp.com>
---
change in v5:
	- no

change in v4:
	- no

change in v3:
	- no change

change in v2:
	- Replace 'ioread##width##be(addr) : ioread##width(addr)'
	  by 'fsl_ioread##width##be(addr) : fsl_ioread##width(addr)'
	- Fix macro FSL_DMA_IN/OUT build issues in powerpc
					   
 drivers/dma/fsldma.c |   16 +++++++-------
 drivers/dma/fsldma.h |   57 +++++++++++++++++++++++++++++++++----------------
 2 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 3eaece8..75479d6 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -53,42 +53,42 @@
 
 static void set_sr(struct fsldma_chan *chan, u32 val)
 {
-	DMA_OUT(chan, &chan->regs->sr, val, 32);
+	FSL_DMA_OUT(chan, &chan->regs->sr, val, 32);
 }
 
 static u32 get_sr(struct fsldma_chan *chan)
 {
-	return DMA_IN(chan, &chan->regs->sr, 32);
+	return FSL_DMA_IN(chan, &chan->regs->sr, 32);
 }
 
 static void set_mr(struct fsldma_chan *chan, u32 val)
 {
-	DMA_OUT(chan, &chan->regs->mr, val, 32);
+	FSL_DMA_OUT(chan, &chan->regs->mr, val, 32);
 }
 
 static u32 get_mr(struct fsldma_chan *chan)
 {
-	return DMA_IN(chan, &chan->regs->mr, 32);
+	return FSL_DMA_IN(chan, &chan->regs->mr, 32);
 }
 
 static void set_cdar(struct fsldma_chan *chan, dma_addr_t addr)
 {
-	DMA_OUT(chan, &chan->regs->cdar, addr | FSL_DMA_SNEN, 64);
+	FSL_DMA_OUT(chan, &chan->regs->cdar, addr | FSL_DMA_SNEN, 64);
 }
 
 static dma_addr_t get_cdar(struct fsldma_chan *chan)
 {
-	return DMA_IN(chan, &chan->regs->cdar, 64) & ~FSL_DMA_SNEN;
+	return FSL_DMA_IN(chan, &chan->regs->cdar, 64) & ~FSL_DMA_SNEN;
 }
 
 static void set_bcr(struct fsldma_chan *chan, u32 val)
 {
-	DMA_OUT(chan, &chan->regs->bcr, val, 32);
+	FSL_DMA_OUT(chan, &chan->regs->bcr, val, 32);
 }
 
 static u32 get_bcr(struct fsldma_chan *chan)
 {
-	return DMA_IN(chan, &chan->regs->bcr, 32);
+	return FSL_DMA_IN(chan, &chan->regs->bcr, 32);
 }
 
 /*
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index 4787d48..4c33a53 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -196,39 +196,58 @@ struct fsldma_chan {
 #define to_fsl_desc(lh) container_of(lh, struct fsl_desc_sw, node)
 #define tx_to_fsl_desc(tx) container_of(tx, struct fsl_desc_sw, async_tx)
 
+#ifdef	CONFIG_PPC
+#define fsl_ioread32(p)		in_le32(p)
+#define fsl_ioread32be(p)	in_be32(p)
+#define fsl_iowrite32(v, p)	out_le32(p, v)
+#define fsl_iowrite32be(v, p)	out_be32(p, v)
+
 #ifndef __powerpc64__
-static u64 in_be64(const u64 __iomem *addr)
+static u64 fsl_ioread64(const u64 __iomem *addr)
 {
-	return ((u64)in_be32((u32 __iomem *)addr) << 32) |
-		(in_be32((u32 __iomem *)addr + 1));
+	return ((u64)in_le32((u32 __iomem *)addr + 1) << 32) |
+		(in_le32((u32 __iomem *)addr));
 }
 
-static void out_be64(u64 __iomem *addr, u64 val)
+static void fsl_iowrite64(u64 val, u64 __iomem *addr)
 {
-	out_be32((u32 __iomem *)addr, val >> 32);
-	out_be32((u32 __iomem *)addr + 1, (u32)val);
+	out_le32((u32 __iomem *)addr + 1, val >> 32);
+	out_le32((u32 __iomem *)addr, (u32)val);
 }
 
-/* There is no asm instructions for 64 bits reverse loads and stores */
-static u64 in_le64(const u64 __iomem *addr)
+static u64 fsl_ioread64be(const u64 __iomem *addr)
 {
-	return ((u64)in_le32((u32 __iomem *)addr + 1) << 32) |
-		(in_le32((u32 __iomem *)addr));
+	return ((u64)in_be32((u32 __iomem *)addr) << 32) |
+		(in_be32((u32 __iomem *)addr + 1));
 }
 
-static void out_le64(u64 __iomem *addr, u64 val)
+static void fsl_iowrite64be(u64 val, u64 __iomem *addr)
 {
-	out_le32((u32 __iomem *)addr + 1, val >> 32);
-	out_le32((u32 __iomem *)addr, (u32)val);
+	out_be32((u32 __iomem *)addr, val >> 32);
+	out_be32((u32 __iomem *)addr + 1, (u32)val);
 }
 #endif
+#endif
 
-#define DMA_IN(fsl_chan, addr, width)					\
-		(((fsl_chan)->feature & FSL_DMA_BIG_ENDIAN) ?		\
-			in_be##width(addr) : in_le##width(addr))
-#define DMA_OUT(fsl_chan, addr, val, width)				\
-		(((fsl_chan)->feature & FSL_DMA_BIG_ENDIAN) ?		\
-			out_be##width(addr, val) : out_le##width(addr, val))
+#if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
+#define fsl_ioread32(p)		ioread32(p)
+#define fsl_ioread32be(p)	ioread32be(p)
+#define fsl_iowrite32(v, p)	iowrite32(v, p)
+#define fsl_iowrite32be(v, p)	iowrite32be(v, p)
+#define fsl_ioread64(p)		ioread64(p)
+#define fsl_ioread64be(p)	ioread64be(p)
+#define fsl_iowrite64(v, p)	iowrite64(v, p)
+#define fsl_iowrite64be(v, p)	iowrite64be(v, p)
+#endif
+
+#define FSL_DMA_IN(fsl_dma, addr, width)				\
+		(((fsl_dma)->feature & FSL_DMA_BIG_ENDIAN) ?		\
+			fsl_ioread##width##be(addr) : fsl_ioread##width(addr))
+
+#define FSL_DMA_OUT(fsl_dma, addr, val, width)				\
+		(((fsl_dma)->feature & FSL_DMA_BIG_ENDIAN) ?		\
+			fsl_iowrite##width##be(val, addr) : fsl_iowrite	\
+		##width(val, addr))
 
 #define DMA_TO_CPU(fsl_chan, d, width)					\
 		(((fsl_chan)->feature & FSL_DMA_BIG_ENDIAN) ?		\
-- 
1.7.1
