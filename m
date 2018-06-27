Return-Path: <SRS0=eG0j=JN=bitwise.fi=anssi.hannula@kernel.org>
From: Anssi Hannula <anssi.hannula@bitwise.fi>
Subject: [PATCH 3/3] can: xilinx_can: add support for Xilinx CAN FD core
Date: Wed, 27 Jun 2018 17:34:14 +0300
Message-Id: <20180627143414.7114-4-anssi.hannula@bitwise.fi>
In-Reply-To: <20180627143414.7114-1-anssi.hannula@bitwise.fi>
References: <20180627143414.7114-1-anssi.hannula@bitwise.fi>
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support for Xilinx CAN FD core.

The major difference from the previously supported cores is that there
are TX mailboxes instead of a TX FIFO and the RX FIFO access method is
different.

We only transmit one frame at a time to prevent the HW from reordering
frames (it uses CAN ID priority order).

Support for CAN FD protocol is not added yet.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Cc: Michal Simek <michal.simek@xilinx.com>
---
 drivers/net/can/xilinx_can.c | 314 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 274 insertions(+), 40 deletions(-)

diff --git a/drivers/net/can/xilinx_can.c b/drivers/net/can/xilinx_can.c
index 615223b..e07a2f8 100644
--- a/drivers/net/can/xilinx_can.c
+++ b/drivers/net/can/xilinx_can.c
@@ -2,7 +2,7 @@
  *
  * Copyright (C) 2012 - 2014 Xilinx, Inc.
  * Copyright (C) 2009 PetaLogix. All rights reserved.
- * Copyright (C) 2017 Sandvik Mining and Construction Oy
+ * Copyright (C) 2017 - 2018 Sandvik Mining and Construction Oy
  *
  * Description:
  * This driver is developed for Axi CAN IP and for Zynq CANPS Controller.
@@ -51,8 +51,18 @@ enum xcan_reg {
 	XCAN_ISR_OFFSET		= 0x1C, /* Interrupt status */
 	XCAN_IER_OFFSET		= 0x20, /* Interrupt enable */
 	XCAN_ICR_OFFSET		= 0x24, /* Interrupt clear */
+
+	/* not on CAN FD cores */
 	XCAN_TXFIFO_OFFSET	= 0x30, /* TX FIFO base */
 	XCAN_RXFIFO_OFFSET	= 0x50, /* RX FIFO base */
+	XCAN_AFR_OFFSET		= 0x60, /* Acceptance Filter */
+
+	/* only on CAN FD cores */
+	XCAN_TRR_OFFSET		= 0x0090, /* TX Buffer Ready Request */
+	XCAN_AFR_EXT_OFFSET	= 0x00E0, /* Acceptance Filter */
+	XCAN_FSR_OFFSET		= 0x00E8, /* RX FIFO Status */
+	XCAN_TXMSG_BASE_OFFSET	= 0x0100, /* TX Message Space */
+	XCAN_RXMSG_BASE_OFFSET	= 0x1100, /* RX Message Space */
 };
 
 #define XCAN_FRAME_ID_OFFSET(frame_base)	((frame_base) + 0x00)
@@ -60,6 +70,13 @@ enum xcan_reg {
 #define XCAN_FRAME_DW1_OFFSET(frame_base)	((frame_base) + 0x08)
 #define XCAN_FRAME_DW2_OFFSET(frame_base)	((frame_base) + 0x0C)
 
+#define XCAN_CANFD_FRAME_SIZE		0x48
+#define XCAN_TXMSG_FRAME_OFFSET(n)	(XCAN_TXMSG_BASE_OFFSET + XCAN_CANFD_FRAME_SIZE * (n))
+#define XCAN_RXMSG_FRAME_OFFSET(n)	(XCAN_RXMSG_BASE_OFFSET + XCAN_CANFD_FRAME_SIZE * (n))
+
+/* the single TX mailbox used by this driver on CAN FD HW */
+#define XCAN_TX_MAILBOX_IDX		0
+
 /* CAN register bit masks - XCAN_<REG>_<BIT>_MASK */
 #define XCAN_SRR_CEN_MASK		0x00000002 /* CAN enable */
 #define XCAN_SRR_RESET_MASK		0x00000001 /* Soft Reset the CAN core */
@@ -69,6 +86,9 @@ enum xcan_reg {
 #define XCAN_BTR_SJW_MASK		0x00000180 /* Synchronous jump width */
 #define XCAN_BTR_TS2_MASK		0x00000070 /* Time segment 2 */
 #define XCAN_BTR_TS1_MASK		0x0000000F /* Time segment 1 */
+#define XCAN_BTR_SJW_MASK_CANFD		0x000F0000 /* Synchronous jump width */
+#define XCAN_BTR_TS2_MASK_CANFD		0x00000F00 /* Time segment 2 */
+#define XCAN_BTR_TS1_MASK_CANFD		0x0000003F /* Time segment 1 */
 #define XCAN_ECR_REC_MASK		0x0000FF00 /* Receive error counter */
 #define XCAN_ECR_TEC_MASK		0x000000FF /* Transmit error counter */
 #define XCAN_ESR_ACKER_MASK		0x00000010 /* ACK error */
@@ -82,6 +102,7 @@ enum xcan_reg {
 #define XCAN_SR_NORMAL_MASK		0x00000008 /* Normal mode */
 #define XCAN_SR_LBACK_MASK		0x00000002 /* Loop back mode */
 #define XCAN_SR_CONFIG_MASK		0x00000001 /* Configuration mode */
+#define XCAN_IXR_RXMNF_MASK		0x00020000 /* RX match not finished */
 #define XCAN_IXR_TXFEMP_MASK		0x00004000 /* TX FIFO Empty */
 #define XCAN_IXR_WKUP_MASK		0x00000800 /* Wake up interrupt */
 #define XCAN_IXR_SLP_MASK		0x00000400 /* Sleep interrupt */
@@ -99,10 +120,15 @@ enum xcan_reg {
 #define XCAN_IDR_ID2_MASK		0x0007FFFE /* Extended message ident */
 #define XCAN_IDR_RTR_MASK		0x00000001 /* Remote TX request */
 #define XCAN_DLCR_DLC_MASK		0xF0000000 /* Data length code */
+#define XCAN_FSR_FL_MASK		0x00003F00 /* RX Fill Level */
+#define XCAN_FSR_IRI_MASK		0x00000080 /* RX Increment Read Index */
+#define XCAN_FSR_RI_MASK		0x0000001F /* RX Read Index */
 
 /* CAN register bit shift - XCAN_<REG>_<BIT>_SHIFT */
 #define XCAN_BTR_SJW_SHIFT		7  /* Synchronous jump width */
 #define XCAN_BTR_TS2_SHIFT		4  /* Time segment 2 */
+#define XCAN_BTR_SJW_SHIFT_CANFD	16 /* Synchronous jump width */
+#define XCAN_BTR_TS2_SHIFT_CANFD	8  /* Time segment 2 */
 #define XCAN_IDR_ID1_SHIFT		21 /* Standard Messg Identifier */
 #define XCAN_IDR_ID2_SHIFT		1  /* Extended Message Identifier */
 #define XCAN_DLCR_DLC_SHIFT		28 /* Data length code */
@@ -112,13 +138,31 @@ enum xcan_reg {
 #define XCAN_FRAME_MAX_DATA_LEN		8
 #define XCAN_TIMEOUT			(1 * HZ)
 
+enum xcan_rx_mode {
+	RX_MODE_SEQUENTIAL,
+	RX_MODE_MAILBOX,
+	RX_MODE_UNKNOWN,
+};
+
 /* TX-FIFO-empty interrupt available */
 #define XCAN_FLAG_TXFEMP	0x0001
+/* RX Match Not Finished interrupt available */
+#define XCAN_FLAG_RXMNF		0x0002
+/* Extended acceptance filters with control at 0xE0 */
+#define XCAN_FLAG_EXT_FILTERS	0x0004
+/* TX mailboxes instead of TX FIFO */
+#define XCAN_FLAG_TX_MAILBOXES	0x0008
+/* RX FIFO with each buffer in separate registers at 0x1100
+ * instead of the regular FIFO at 0x50
+ */
+#define XCAN_FLAG_RX_FIFO_MULTI	0x0010
 
 struct xcan_devtype_data {
 	unsigned int flags;
 	const struct can_bittiming_const *bittiming_const;
 	const char *bus_clk_name;
+	unsigned int btr_ts2_shift;
+	unsigned int btr_sjw_shift;
 };
 
 /**
@@ -169,6 +213,18 @@ static const struct can_bittiming_const xcan_bittiming_const = {
 	.brp_inc = 1,
 };
 
+static const struct can_bittiming_const xcan_bittiming_const_canfd = {
+	.name = DRIVER_NAME,
+	.tseg1_min = 1,
+	.tseg1_max = 64,
+	.tseg2_min = 1,
+	.tseg2_max = 16,
+	.sjw_max = 16,
+	.brp_min = 1,
+	.brp_max = 256,
+	.brp_inc = 1,
+};
+
 /**
  * xcan_write_reg_le - Write a value to the device register little endian
  * @priv:	Driver private data structure
@@ -224,6 +280,23 @@ static u32 xcan_read_reg_be(const struct xcan_priv *priv, enum xcan_reg reg)
 }
 
 /**
+ * xcan_rx_int_mask - Get the mask for the receive interrupt
+ * @priv:	Driver private data structure
+ *
+ * Return: The receive interrupt mask used by the driver on this HW
+ */
+static u32 xcan_rx_int_mask(const struct xcan_priv *priv)
+{
+	/* RXNEMP is better suited for our use case as it cannot be cleared
+	 * while the FIFO is non-empty, but CAN FD HW does not have it
+	 */
+	if (priv->devtype.flags & XCAN_FLAG_RX_FIFO_MULTI)
+		return XCAN_IXR_RXOK_MASK;
+	else
+		return XCAN_IXR_RXNEMP_MASK;
+}
+
+/**
  * set_reset_mode - Resets the CAN device mode
  * @ndev:	Pointer to net_device structure
  *
@@ -287,10 +360,10 @@ static int xcan_set_bittiming(struct net_device *ndev)
 	btr1 = (bt->prop_seg + bt->phase_seg1 - 1);
 
 	/* Setting Time Segment 2 in BTR Register */
-	btr1 |= (bt->phase_seg2 - 1) << XCAN_BTR_TS2_SHIFT;
+	btr1 |= (bt->phase_seg2 - 1) << priv->devtype.btr_ts2_shift;
 
 	/* Setting Synchronous jump width in BTR Register */
-	btr1 |= (bt->sjw - 1) << XCAN_BTR_SJW_SHIFT;
+	btr1 |= (bt->sjw - 1) << priv->devtype.btr_sjw_shift;
 
 	priv->write_reg(priv, XCAN_BRPR_OFFSET, btr0);
 	priv->write_reg(priv, XCAN_BTR_OFFSET, btr1);
@@ -318,6 +391,7 @@ static int xcan_chip_start(struct net_device *ndev)
 	u32 reg_msr, reg_sr_mask;
 	int err;
 	unsigned long timeout;
+	u32 ier;
 
 	/* Check if it is in reset mode */
 	err = set_reset_mode(ndev);
@@ -329,11 +403,15 @@ static int xcan_chip_start(struct net_device *ndev)
 		return err;
 
 	/* Enable interrupts */
-	priv->write_reg(priv, XCAN_IER_OFFSET,
-			XCAN_IXR_TXOK_MASK | XCAN_IXR_BSOFF_MASK |
-			XCAN_IXR_WKUP_MASK | XCAN_IXR_SLP_MASK |
-			XCAN_IXR_RXNEMP_MASK | XCAN_IXR_ERROR_MASK |
-			XCAN_IXR_RXOFLW_MASK | XCAN_IXR_ARBLST_MASK);
+	ier = XCAN_IXR_TXOK_MASK | XCAN_IXR_BSOFF_MASK |
+		XCAN_IXR_WKUP_MASK | XCAN_IXR_SLP_MASK |
+		XCAN_IXR_ERROR_MASK | XCAN_IXR_RXOFLW_MASK |
+		XCAN_IXR_ARBLST_MASK | xcan_rx_int_mask(priv);
+
+	if (priv->devtype.flags & XCAN_FLAG_RXMNF)
+		ier |= XCAN_IXR_RXMNF_MASK;
+
+	priv->write_reg(priv, XCAN_IER_OFFSET, ier);
 
 	/* Check whether it is loopback mode or normal mode  */
 	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK) {
@@ -344,6 +422,12 @@ static int xcan_chip_start(struct net_device *ndev)
 		reg_sr_mask = XCAN_SR_NORMAL_MASK;
 	}
 
+	/* enable the first extended filter, if any, as cores with extended
+	 * filtering default to non-receipt if all filters are disabled
+	 */
+	if (priv->devtype.flags & XCAN_FLAG_EXT_FILTERS)
+		priv->write_reg(priv, XCAN_AFR_EXT_OFFSET, 0x00000001);
+
 	priv->write_reg(priv, XCAN_MSR_OFFSET, reg_msr);
 	priv->write_reg(priv, XCAN_SRR_OFFSET, XCAN_SRR_CEN_MASK);
 
@@ -439,12 +523,14 @@ static void xcan_write_frame(struct xcan_priv *priv, struct sk_buff *skb,
 		data[1] = be32_to_cpup((__be32 *)(cf->data + 4));
 
 	priv->write_reg(priv, XCAN_FRAME_ID_OFFSET(frame_offset), id);
-	/* If the CAN frame is RTR frame this write triggers transmission */
+	/* If the CAN frame is RTR frame this write triggers transmission
+	 * (not on CAN FD)
+	 */
 	priv->write_reg(priv, XCAN_FRAME_DLC_OFFSET(frame_offset), dlc);
 	if (!(cf->can_id & CAN_RTR_FLAG)) {
 		priv->write_reg(priv, XCAN_FRAME_DW1_OFFSET(frame_offset), data[0]);
 		/* If the CAN frame is Standard/Extended frame this
-		 * write triggers transmission
+		 * write triggers transmission (not on CAN FD)
 		 */
 		priv->write_reg(priv, XCAN_FRAME_DW2_OFFSET(frame_offset), data[1]);
 	}
@@ -487,24 +573,57 @@ static int xcan_start_xmit_fifo(struct sk_buff *skb, struct net_device *ndev)
 }
 
 /**
+ * xcan_start_xmit_mailbox - Starts the transmission (mailbox mode)
+ *
+ * Return: 0 on success, -ENOSPC if there is no space
+ */
+static int xcan_start_xmit_mailbox(struct sk_buff *skb, struct net_device *ndev)
+{
+	struct xcan_priv *priv = netdev_priv(ndev);
+	unsigned long flags;
+
+	if (unlikely(priv->read_reg(priv, XCAN_TRR_OFFSET) & BIT(XCAN_TX_MAILBOX_IDX)))
+		return -ENOSPC;
+
+	can_put_echo_skb(skb, ndev, 0);
+
+	spin_lock_irqsave(&priv->tx_lock, flags);
+
+	priv->tx_head++;
+
+	xcan_write_frame(priv, skb, XCAN_TXMSG_FRAME_OFFSET(XCAN_TX_MAILBOX_IDX));
+
+	/* Mark buffer as ready for transmit */
+	priv->write_reg(priv, XCAN_TRR_OFFSET, BIT(XCAN_TX_MAILBOX_IDX));
+
+	netif_stop_queue(ndev);
+
+	spin_unlock_irqrestore(&priv->tx_lock, flags);
+
+	return 0;
+}
+
+/**
  * xcan_start_xmit - Starts the transmission
  * @skb:	sk_buff pointer that contains data to be Txed
  * @ndev:	Pointer to net_device structure
  *
- * This function is invoked from upper layers to initiate transmission. This
- * function uses the next available free txbuff and populates their fields to
- * start the transmission.
+ * This function is invoked from upper layers to initiate transmission.
  *
  * Return: 0 on success and failure value on error
  */
 static int xcan_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
+	struct xcan_priv *priv = netdev_priv(ndev);
 	int ret;
 
 	if (can_dropped_invalid_skb(ndev, skb))
 		return NETDEV_TX_OK;
 
-	ret = xcan_start_xmit_fifo(skb, ndev);
+	if (priv->devtype.flags & XCAN_FLAG_TX_MAILBOXES)
+		ret = xcan_start_xmit_mailbox(skb, ndev);
+	else
+		ret = xcan_start_xmit_fifo(skb, ndev);
 
 	if (ret < 0) {
 		netdev_err(ndev, "BUG!, TX full when queue awake!\n");
@@ -737,6 +856,17 @@ static void xcan_err_interrupt(struct net_device *ndev, u32 isr)
 		}
 	}
 
+	/* Check for RX Match Not Finished interrupt */
+	if (isr & XCAN_IXR_RXMNF_MASK) {
+		stats->rx_dropped++;
+		stats->rx_errors++;
+		netdev_err(ndev, "RX match not finished, frame discarded\n");
+		if (skb) {
+			cf->can_id |= CAN_ERR_CRTL;
+			cf->data[1] |= CAN_ERR_CRTL_UNSPEC;
+		}
+	}
+
 	/* Check for error interrupt */
 	if (isr & XCAN_IXR_ERROR_MASK) {
 		if (skb)
@@ -821,6 +951,43 @@ static void xcan_state_interrupt(struct net_device *ndev, u32 isr)
 }
 
 /**
+ * xcan_rx_fifo_get_next_frame - Get register offset of next RX frame
+ *
+ * Return: Register offset of the next frame in RX FIFO.
+ */
+static int xcan_rx_fifo_get_next_frame(struct xcan_priv *priv)
+{
+	int offset;
+
+	if (priv->devtype.flags & XCAN_FLAG_RX_FIFO_MULTI) {
+		u32 fsr;
+
+		/* clear RXOK before the is-empty check so that any newly received
+		 * frame will reassert it without a race
+		 */
+		priv->write_reg(priv, XCAN_ICR_OFFSET, XCAN_IXR_RXOK_MASK);
+
+		fsr = priv->read_reg(priv, XCAN_FSR_OFFSET);
+
+		/* check if RX FIFO is empty */
+		if (!(fsr & XCAN_FSR_FL_MASK))
+			return -ENOENT;
+
+		offset = XCAN_RXMSG_FRAME_OFFSET(fsr & XCAN_FSR_RI_MASK);
+
+	} else {
+		/* check if RX FIFO is empty */
+		if (!(priv->read_reg(priv, XCAN_ISR_OFFSET) & XCAN_IXR_RXNEMP_MASK))
+			return -ENOENT;
+
+		/* frames are read from a static offset */
+		offset = XCAN_RXFIFO_OFFSET;
+	}
+
+	return offset;
+}
+
+/**
  * xcan_rx_poll - Poll routine for rx packets (NAPI)
  * @napi:	napi structure pointer
  * @quota:	Max number of rx packets to be processed.
@@ -834,14 +1001,20 @@ static int xcan_rx_poll(struct napi_struct *napi, int quota)
 {
 	struct net_device *ndev = napi->dev;
 	struct xcan_priv *priv = netdev_priv(ndev);
-	u32 isr, ier;
+	u32 ier;
 	int work_done = 0;
-
-	isr = priv->read_reg(priv, XCAN_ISR_OFFSET);
-	while ((isr & XCAN_IXR_RXNEMP_MASK) && (work_done < quota)) {
-		work_done += xcan_rx(ndev, XCAN_RXFIFO_OFFSET);
-		priv->write_reg(priv, XCAN_ICR_OFFSET, XCAN_IXR_RXNEMP_MASK);
-		isr = priv->read_reg(priv, XCAN_ISR_OFFSET);
+	int frame_offset;
+
+	while ((frame_offset = xcan_rx_fifo_get_next_frame(priv)) >= 0
+	       && (work_done < quota)) {
+		work_done += xcan_rx(ndev, frame_offset);
+
+		if (priv->devtype.flags & XCAN_FLAG_RX_FIFO_MULTI)
+			/* increment read index */
+			priv->write_reg(priv, XCAN_FSR_OFFSET, XCAN_FSR_IRI_MASK);
+		else
+			/* clear rx-not-empty (will actually clear only if empty) */
+			priv->write_reg(priv, XCAN_ICR_OFFSET, XCAN_IXR_RXNEMP_MASK);
 	}
 
 	if (work_done) {
@@ -852,7 +1025,7 @@ static int xcan_rx_poll(struct napi_struct *napi, int quota)
 	if (work_done < quota) {
 		napi_complete_done(napi, work_done);
 		ier = priv->read_reg(priv, XCAN_IER_OFFSET);
-		ier |= XCAN_IXR_RXNEMP_MASK;
+		ier |= xcan_rx_int_mask(priv);
 		priv->write_reg(priv, XCAN_IER_OFFSET, ier);
 	}
 	return work_done;
@@ -951,6 +1124,7 @@ static irqreturn_t xcan_interrupt(int irq, void *dev_id)
 	struct xcan_priv *priv = netdev_priv(ndev);
 	u32 isr, ier;
 	u32 isr_errors;
+	u32 rx_int_mask = xcan_rx_int_mask(priv);
 
 	/* Get the interrupt status from Xilinx CAN */
 	isr = priv->read_reg(priv, XCAN_ISR_OFFSET);
@@ -970,16 +1144,17 @@ static irqreturn_t xcan_interrupt(int irq, void *dev_id)
 
 	/* Check for the type of error interrupt and Processing it */
 	isr_errors = isr & (XCAN_IXR_ERROR_MASK | XCAN_IXR_RXOFLW_MASK |
-			    XCAN_IXR_BSOFF_MASK | XCAN_IXR_ARBLST_MASK);
+			    XCAN_IXR_BSOFF_MASK | XCAN_IXR_ARBLST_MASK |
+			    XCAN_IXR_RXMNF_MASK);
 	if (isr_errors) {
 		priv->write_reg(priv, XCAN_ICR_OFFSET, isr_errors);
 		xcan_err_interrupt(ndev, isr);
 	}
 
 	/* Check for the type of receive interrupt and Processing it */
-	if (isr & XCAN_IXR_RXNEMP_MASK) {
+	if (isr & rx_int_mask) {
 		ier = priv->read_reg(priv, XCAN_IER_OFFSET);
-		ier &= ~XCAN_IXR_RXNEMP_MASK;
+		ier &= ~rx_int_mask;
 		priv->write_reg(priv, XCAN_IER_OFFSET, ier);
 		napi_schedule(&priv->napi);
 	}
@@ -1226,14 +1401,27 @@ static const struct dev_pm_ops xcan_dev_pm_ops = {
 };
 
 static const struct xcan_devtype_data xcan_zynq_data = {
-	.flags = XCAN_FLAG_TXFEMP,
 	.bittiming_const = &xcan_bittiming_const,
+	.btr_ts2_shift = XCAN_BTR_TS2_SHIFT,
+	.btr_sjw_shift = XCAN_BTR_SJW_SHIFT,
 	.bus_clk_name = "pclk",
 };
 
 static const struct xcan_devtype_data xcan_axi_data = {
-	.flags = 0,
 	.bittiming_const = &xcan_bittiming_const,
+	.btr_ts2_shift = XCAN_BTR_TS2_SHIFT,
+	.btr_sjw_shift = XCAN_BTR_SJW_SHIFT,
+	.bus_clk_name = "s_axi_aclk",
+};
+
+static const struct xcan_devtype_data xcan_canfd_data = {
+	.flags = XCAN_FLAG_EXT_FILTERS |
+		 XCAN_FLAG_RXMNF |
+		 XCAN_FLAG_TX_MAILBOXES |
+		 XCAN_FLAG_RX_FIFO_MULTI,
+	.bittiming_const = &xcan_bittiming_const,
+	.btr_ts2_shift = XCAN_BTR_TS2_SHIFT_CANFD,
+	.btr_sjw_shift = XCAN_BTR_SJW_SHIFT_CANFD,
 	.bus_clk_name = "s_axi_aclk",
 };
 
@@ -1241,10 +1429,27 @@ static const struct xcan_devtype_data xcan_axi_data = {
 static const struct of_device_id xcan_of_match[] = {
 	{ .compatible = "xlnx,zynq-can-1.0", .data = &xcan_zynq_data },
 	{ .compatible = "xlnx,axi-can-1.00.a", .data = &xcan_axi_data },
+	{ .compatible = "xlnx,canfd-1.0", .data = &xcan_canfd_data },
 	{ /* end of list */ },
 };
 MODULE_DEVICE_TABLE(of, xcan_of_match);
 
+static enum xcan_rx_mode xcan_read_rx_mode(struct platform_device *pdev)
+{
+	const char *rx_mode_str;
+
+	if (of_property_read_string(pdev->dev.of_node, "rx-mode",
+				    &rx_mode_str) < 0)
+		return RX_MODE_SEQUENTIAL;
+	if (strcmp(rx_mode_str, "sequential") == 0)
+		return RX_MODE_SEQUENTIAL;
+	if (strcmp(rx_mode_str, "mailbox") == 0)
+		return RX_MODE_MAILBOX;
+
+	dev_err(&pdev->dev, "unknown RX mode \"%s\"\n", rx_mode_str);
+	return RX_MODE_UNKNOWN;
+}
+
 /**
  * xcan_probe - Platform registration call
  * @pdev:	Handle to the platform device structure
@@ -1262,7 +1467,11 @@ static int xcan_probe(struct platform_device *pdev)
 	const struct of_device_id *of_id;
 	const struct xcan_devtype_data *devtype = &xcan_axi_data;
 	void __iomem *addr;
-	int ret, rx_max, tx_max, tx_fifo_depth;
+	int ret;
+	int rx_max, tx_max;
+	int hw_tx_max, hw_rx_max;
+	enum xcan_rx_mode rx_mode;
+	const char *hw_tx_max_property;
 
 	/* Get the virtual base address for the device */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1272,21 +1481,38 @@ static int xcan_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = of_property_read_u32(pdev->dev.of_node, "tx-fifo-depth",
-				   &tx_fifo_depth);
-	if (ret < 0)
+	rx_mode = xcan_read_rx_mode(pdev);
+	if (rx_mode == RX_MODE_UNKNOWN) {
+		ret = -EINVAL;
 		goto err;
-
-	ret = of_property_read_u32(pdev->dev.of_node, "rx-fifo-depth", &rx_max);
-	if (ret < 0)
+	} else if (rx_mode == RX_MODE_MAILBOX) {
+		dev_err(&pdev->dev, "mailbox RX mode is not supported\n");
+		ret = -ENOSYS;
 		goto err;
+	}
 
 	of_id = of_match_device(xcan_of_match, &pdev->dev);
 	if (of_id && of_id->data)
 		devtype = of_id->data;
 
-	/* There is no way to directly figure out how many frames have been
-	 * sent when the TXOK interrupt is processed. If watermark programming
+	hw_tx_max_property = devtype->flags & XCAN_FLAG_TX_MAILBOXES ?
+			     "tx-mailbox-count" : "tx-fifo-depth";
+
+	ret = of_property_read_u32(pdev->dev.of_node, hw_tx_max_property,
+				   &hw_tx_max);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "missing %s property\n", hw_tx_max_property);
+		goto err;
+	}
+
+	ret = of_property_read_u32(pdev->dev.of_node, "rx-fifo-depth", &hw_rx_max);
+	if (ret < 0)
+		goto err;
+
+	/* With TX FIFO:
+	 *
+	 * There is no way to directly figure out how many frames have been
+	 * sent when the TXOK interrupt is processed. If TXFEMP
 	 * is supported, we can have 2 frames in the FIFO and use TXFEMP
 	 * to determine if 1 or 2 frames have been sent.
 	 * Theoretically we should be able to use TXFWMEMP to determine up
@@ -1295,12 +1521,20 @@ static int xcan_probe(struct platform_device *pdev)
 	 * than 2 frames in FIFO) is set anyway with no TXOK (a frame was
 	 * sent), which is not a sensible state - possibly TXFWMEMP is not
 	 * completely synchronized with the rest of the bits?
+	 *
+	 * With TX mailboxes:
+	 *
+	 * HW sends frames in CAN ID priority order. To preserve FIFO ordering
+	 * we submit frames one at a time.
 	 */
-	if (devtype->flags & XCAN_FLAG_TXFEMP)
-		tx_max = min(tx_fifo_depth, 2);
+	if (!(devtype->flags & XCAN_FLAG_TX_MAILBOXES) &&
+	    (devtype->flags & XCAN_FLAG_TXFEMP))
+		tx_max = min(hw_tx_max, 2);
 	else
 		tx_max = 1;
 
+	rx_max = hw_rx_max;
+
 	/* Create a CAN device instance */
 	ndev = alloc_candev(sizeof(struct xcan_priv), tx_max);
 	if (!ndev)
@@ -1371,9 +1605,9 @@ static int xcan_probe(struct platform_device *pdev)
 
 	pm_runtime_put(&pdev->dev);
 
-	netdev_dbg(ndev, "reg_base=0x%p irq=%d clock=%d, tx fifo depth: actual %d, using %d\n",
+	netdev_dbg(ndev, "reg_base=0x%p irq=%d clock=%d, tx buffers: actual %d, using %d\n",
 			priv->reg_base, ndev->irq, priv->can.clock.freq,
-			tx_fifo_depth, priv->tx_max);
+			hw_tx_max, priv->tx_max);
 
 	return 0;
 
-- 
2.8.3
