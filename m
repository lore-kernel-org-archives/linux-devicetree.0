From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v2 2/2] DW DMAC: add multi-block property to device tree
Date: Fri, 18 Nov 2016 19:53:09 +0300
Message-ID: <1479487989-24543-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1479487989-24543-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479487989-24543-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, vinod.koul@intel.com, dmaengine@vger.kernel.org, linux-snps-arc@lists.infradead.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Several versions of DW DMAC have multi block transfers hardware
support. Hardware support of multi block transfers is disabled
by default if we use DT to configure DMAC and software emulation
of multi block transfers used instead.
Add multi-block property, so it is possible to enable hardware
multi block transfers (if present) via DT.

Switch from per device is_nollp variable to multi_block array
to be able enable/disable multi block transfers separately per
channel.

Update DT documentation.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 Documentation/devicetree/bindings/dma/snps-dma.txt | 2 ++
 drivers/dma/dw/core.c                              | 2 +-
 drivers/dma/dw/platform.c                          | 5 +++++
 include/linux/platform_data/dma-dw.h               | 4 ++--
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documentation/devicetree/bindings/dma/snps-dma.txt
index 0f55832..03d6d6d 100644
--- a/Documentation/devicetree/bindings/dma/snps-dma.txt
+++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
@@ -27,6 +27,8 @@ Optional properties:
   that services interrupts for this device
 - is_private: The device channels should be marked as private and not for by the
   general purpose DMA channel allocator. False if not passed.
+- multi-block: Multi block transfers supported by hardware per AHB master.
+  0 (default): not supported, 1: supported.
 
 Example:
 
diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c2c0a61..f2a3d06 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -1569,7 +1569,7 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 				(dwc_params >> DWC_PARAMS_MBLK_EN & 0x1) == 0;
 		} else {
 			dwc->block_size = pdata->block_size;
-			dwc->nollp = pdata->is_nollp;
+			dwc->nollp = pdata->multi_block[i];
 		}
 	}
 
diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index aa7a5c1..b262fd3 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -152,6 +152,11 @@ dw_dma_parse_dt(struct platform_device *pdev)
 			pdata->data_width[tmp] = BIT(arr[tmp] & 0x07);
 	}
 
+	if (!of_property_read_u32_array(np, "multi-block", arr, nr_masters)) {
+		for (tmp = 0; tmp < nr_masters; tmp++)
+			pdata->multi_block[tmp] = arr[tmp];
+	}
+
 	return pdata;
 }
 #else
diff --git a/include/linux/platform_data/dma-dw.h b/include/linux/platform_data/dma-dw.h
index 5f0e11e..0773bb4 100644
--- a/include/linux/platform_data/dma-dw.h
+++ b/include/linux/platform_data/dma-dw.h
@@ -40,19 +40,18 @@ struct dw_dma_slave {
  * @is_private: The device channels should be marked as private and not for
  *	by the general purpose DMA channel allocator.
  * @is_memcpy: The device channels do support memory-to-memory transfers.
- * @is_nollp: The device channels does not support multi block transfers.
  * @chan_allocation_order: Allocate channels starting from 0 or 7
  * @chan_priority: Set channel priority increasing from 0 to 7 or 7 to 0.
  * @block_size: Maximum block size supported by the controller
  * @nr_masters: Number of AHB masters supported by the controller
  * @data_width: Maximum data width supported by hardware per AHB master
  *		(in bytes, power of 2)
+ * @multi_block: Multi block transfers supported by hardware per AHB master.
  */
 struct dw_dma_platform_data {
 	unsigned int	nr_channels;
 	bool		is_private;
 	bool		is_memcpy;
-	bool		is_nollp;
 #define CHAN_ALLOCATION_ASCENDING	0	/* zero to seven */
 #define CHAN_ALLOCATION_DESCENDING	1	/* seven to zero */
 	unsigned char	chan_allocation_order;
@@ -62,6 +61,7 @@ struct dw_dma_platform_data {
 	unsigned int	block_size;
 	unsigned char	nr_masters;
 	unsigned char	data_width[DW_DMA_MAX_NR_MASTERS];
+	unsigned char	multi_block[DW_DMA_MAX_NR_MASTERS];
 };
 
 #endif /* _PLATFORM_DATA_DMA_DW_H */
-- 
2.5.5
