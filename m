From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v4 2/2] DW DMAC: add multi-block property to device tree
Date: Wed, 23 Nov 2016 21:37:48 +0300
Message-ID: <1479926268-29050-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1479926268-29050-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1479926268-29050-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-snps-arc@lists.infradead.org, arnd@arndb.de, vinod.koul@intel.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
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

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Also:
 Update DT documentation.
 Update existing platform data.

 Documentation/devicetree/bindings/dma/snps-dma.txt | 3 +++
 drivers/dma/dw/core.c                              | 2 +-
 drivers/dma/dw/platform.c                          | 5 +++++
 drivers/tty/serial/8250/8250_lpss.c                | 2 +-
 include/linux/platform_data/dma-dw.h               | 4 ++--
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documentation/devicetree/bindings/dma/snps-dma.txt
index 0f55832..0c6256d 100644
--- a/Documentation/devicetree/bindings/dma/snps-dma.txt
+++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
@@ -27,6 +27,9 @@ Optional properties:
   that services interrupts for this device
 - is_private: The device channels should be marked as private and not for by the
   general purpose DMA channel allocator. False if not passed.
+- multi-block: Multi block transfers supported by hardware per AHB master.
+  Array property with one cell per master. 0 (default): not supported,
+  1: supported.
 
 Example:
 
diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c2c0a61..e5adf5d 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -1569,7 +1569,7 @@ int dw_dma_probe(struct dw_dma_chip *chip)
 				(dwc_params >> DWC_PARAMS_MBLK_EN & 0x1) == 0;
 		} else {
 			dwc->block_size = pdata->block_size;
-			dwc->nollp = pdata->is_nollp;
+			dwc->nollp = !pdata->multi_block[i];
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
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index f607946..58cbb30 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -157,12 +157,12 @@ static int byt_serial_setup(struct lpss8250 *lpss, struct uart_port *port)
 static const struct dw_dma_platform_data qrk_serial_dma_pdata = {
 	.nr_channels = 2,
 	.is_private = true,
-	.is_nollp = true,
 	.chan_allocation_order = CHAN_ALLOCATION_ASCENDING,
 	.chan_priority = CHAN_PRIORITY_ASCENDING,
 	.block_size = 4095,
 	.nr_masters = 1,
 	.data_width = {4},
+	.multi_block = {0},
 };
 
 static void qrk_serial_setup_dma(struct lpss8250 *lpss, struct uart_port *port)
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
