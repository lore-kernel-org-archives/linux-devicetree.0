From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH] dmaengine: nbpfaxi: add optional max-burst property for memory reads/writes
Date: Mon, 24 Oct 2016 15:29:15 +0200
Message-ID: <1477315755-4783-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Niklas Cassel <niklass@axis.com>
List-Id: devicetree@vger.kernel.org

From: Niklas Cassel <niklas.cassel@axis.com>

Due to a hardware bug, reading memory (from the Accelerator Coherency Port)
with a burst size equal to the maximum burst size allowed by the DMA
hardware's buffer size will cause a hardware hang on the ARTPEC-6 SoC,
where the only solution is a manual power cycle.
On ARTPEC-6, this hardware bug does not trigger when writing memory (to the
Accelerator Coherency Port) with a burst size equal to the maximum burst
size allowed by the DMA hardware's buffer size.

To avoid this hardware hang, introduce a new optional max-burst property
for memory reads. For completeness, also introduce a max-burst property for
memory writes.

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
---
 Documentation/devicetree/bindings/dma/nbpfaxi.txt |  8 +++++
 drivers/dma/nbpfaxi.c                             | 38 ++++++++++++++++++++---
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/nbpfaxi.txt b/Documentation/devicetree/bindings/dma/nbpfaxi.txt
index d5e2522b9ec1..d2e1e62e346a 100644
--- a/Documentation/devicetree/bindings/dma/nbpfaxi.txt
+++ b/Documentation/devicetree/bindings/dma/nbpfaxi.txt
@@ -23,6 +23,14 @@ Required properties
 #define NBPF_SLAVE_RQ_LEVEL	4
 
 Optional properties:
+- max-burst-mem-read:	limit burst size for memory reads
+  (DMA_MEM_TO_MEM/DMA_MEM_TO_DEV) to this value, specified in bytes, rather
+  than using the maximum burst size allowed by the hardware's buffer size.
+- max-burst-mem-write:	limit burst size for memory writes
+  (DMA_DEV_TO_MEM/DMA_MEM_TO_MEM) to this value, specified in bytes, rather
+  than using the maximum burst size allowed by the hardware's buffer size.
+  If both max-burst-mem-read and max-burst-mem-write are set, DMA_MEM_TO_MEM
+  will use the lower value.
 
 You can use dma-channels and dma-requests as described in dma.txt, although they
 won't be used, this information is derived from the compatibility string.
diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 09de71519d37..3f45b9bdf201 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -225,6 +225,8 @@ struct nbpf_channel {
 struct nbpf_device {
 	struct dma_device dma_dev;
 	void __iomem *base;
+	u32 max_burst_mem_read;
+	u32 max_burst_mem_write;
 	struct clk *clk;
 	const struct nbpf_config *config;
 	unsigned int eirq;
@@ -425,10 +427,33 @@ static void nbpf_chan_configure(struct nbpf_channel *chan)
 	nbpf_chan_write(chan, NBPF_CHAN_CFG, NBPF_CHAN_CFG_DMS | chan->dmarq_cfg);
 }
 
-static u32 nbpf_xfer_ds(struct nbpf_device *nbpf, size_t size)
+static u32 nbpf_xfer_ds(struct nbpf_device *nbpf, size_t size,
+			enum dma_transfer_direction direction)
 {
+	int max_burst = nbpf->config->buffer_size * 8;
+
+	if (nbpf->max_burst_mem_read || nbpf->max_burst_mem_write) {
+		switch (direction) {
+		case DMA_MEM_TO_MEM:
+			max_burst = min_not_zero(nbpf->max_burst_mem_read,
+						 nbpf->max_burst_mem_write);
+			break;
+		case DMA_MEM_TO_DEV:
+			if (nbpf->max_burst_mem_read)
+				max_burst = nbpf->max_burst_mem_read;
+			break;
+		case DMA_DEV_TO_MEM:
+			if (nbpf->max_burst_mem_write)
+				max_burst = nbpf->max_burst_mem_write;
+			break;
+		case DMA_DEV_TO_DEV:
+		default:
+			break;
+		}
+	}
+
 	/* Maximum supported bursts depend on the buffer size */
-	return min_t(int, __ffs(size), ilog2(nbpf->config->buffer_size * 8));
+	return min_t(int, __ffs(size), ilog2(max_burst));
 }
 
 static size_t nbpf_xfer_size(struct nbpf_device *nbpf,
@@ -458,7 +483,7 @@ static size_t nbpf_xfer_size(struct nbpf_device *nbpf,
 		size = burst;
 	}
 
-	return nbpf_xfer_ds(nbpf, size);
+	return nbpf_xfer_ds(nbpf, size, DMA_TRANS_NONE);
 }
 
 /*
@@ -507,7 +532,7 @@ static int nbpf_prep_one(struct nbpf_link_desc *ldesc,
 	 * transfers we enable the SBE bit and terminate the transfer in our
 	 * .device_pause handler.
 	 */
-	mem_xfer = nbpf_xfer_ds(chan->nbpf, size);
+	mem_xfer = nbpf_xfer_ds(chan->nbpf, size, direction);
 
 	switch (direction) {
 	case DMA_DEV_TO_MEM:
@@ -1313,6 +1338,11 @@ static int nbpf_probe(struct platform_device *pdev)
 	if (IS_ERR(nbpf->clk))
 		return PTR_ERR(nbpf->clk);
 
+	of_property_read_u32(np, "max-burst-mem-read",
+			     &nbpf->max_burst_mem_read);
+	of_property_read_u32(np, "max-burst-mem-write",
+			     &nbpf->max_burst_mem_write);
+
 	nbpf->config = cfg;
 
 	for (i = 0; irqs < ARRAY_SIZE(irqbuf); i++) {
-- 
2.1.4
