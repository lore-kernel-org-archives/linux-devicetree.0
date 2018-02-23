Return-Path: <SRS0=V9ZR=FR=samsung.com=jh80.chung@kernel.org>
From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 2/6] mmc: dw_mmc: remove the deprecated "num-slots"
Date: Fri, 23 Feb 2018 15:41:34 +0900
Message-id: <20180223064138.18401-2-jh80.chung@samsung.com>
In-reply-to: <20180223064138.18401-1-jh80.chung@samsung.com>
References: <20180223064138.18401-1-jh80.chung@samsung.com>
	<CGME20180223064140epcas2p41a734737c3fe7373329a94f485c21fd4@epcas2p4.samsung.com>
To: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, manabian@gmail.com, dinguyen@kernel.org, will.deacon@arm.com, xuwei5@hisilicon.com, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

'num-slots' property had already deprecated.
Remove the 'nom-slots' property that is kept to maintain the compatibility.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt | 5 -----
 drivers/mmc/host/dw_mmc-pci.c                              | 1 -
 drivers/mmc/host/dw_mmc.c                                  | 4 ----
 drivers/mmc/host/dw_mmc.h                                  | 3 ---
 4 files changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
index 75c9fdca4aaf..7e5e427a22ce 100644
--- a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt
@@ -59,11 +59,6 @@ Optional properties:
   is specified and the ciu clock is specified then we'll try to set the ciu
   clock to this at probe time.
 
-* num-slots (DEPRECATED): specifies the number of slots supported by the controller.
-  The number of physical slots actually used could be equal or less than the
-  value specified by num-slots. If this property is not specified, the value
-  of num-slot property is assumed to be 1.
-
 * fifo-depth: The maximum size of the tx/rx fifo's. If this property is not
   specified, the default value of the fifo size is determined from the
   controller registers.
diff --git a/drivers/mmc/host/dw_mmc-pci.c b/drivers/mmc/host/dw_mmc-pci.c
index ab8713297edb..3ad07d7b2c97 100644
--- a/drivers/mmc/host/dw_mmc-pci.c
+++ b/drivers/mmc/host/dw_mmc-pci.c
@@ -29,7 +29,6 @@
 				MMC_CAP_SDIO_IRQ)
 
 static struct dw_mci_board pci_board_data = {
-	.num_slots			= 1,
 	.caps				= DW_MCI_CAPABILITIES,
 	.bus_hz				= 33 * 1000 * 1000,
 	.detect_delay_ms		= 200,
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index 38e0e7c4ffd9..a63ca7bc1099 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -3124,10 +3124,6 @@ static struct dw_mci_board *dw_mci_parse_dt(struct dw_mci *host)
 			return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	/* find out number of slots supported */
-	if (!device_property_read_u32(dev, "num-slots", &pdata->num_slots))
-		dev_info(dev, "'num-slots' was deprecated.\n");
-
 	if (device_property_read_u32(dev, "fifo-depth", &pdata->fifo_depth))
 		dev_info(dev,
 			 "fifo-depth property not found, using value of FIFOTH register as default\n");
diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
index e3124f06a47e..80ff9a6c6fdd 100644
--- a/drivers/mmc/host/dw_mmc.h
+++ b/drivers/mmc/host/dw_mmc.h
@@ -102,7 +102,6 @@ struct dw_mci_dma_slave {
  * @bus_hz: The rate of @mck in Hz. This forms the basis for MMC bus
  *	rate and timeout calculations.
  * @current_speed: Configured rate of the controller.
- * @num_slots: Number of slots available.
  * @fifoth_val: The value of FIFOTH register.
  * @verid: Denote Version ID.
  * @dev: Device associated with the MMC controller.
@@ -253,8 +252,6 @@ struct dma_pdata;
 
 /* Board platform data */
 struct dw_mci_board {
-	u32 num_slots;
-
 	unsigned int bus_hz; /* Clock speed at the cclk_in pad */
 
 	u32 caps;	/* Capabilities */
-- 
2.15.1
