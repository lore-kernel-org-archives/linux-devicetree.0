Return-Path: <SRS0=W32e=OW=gmail.com=dwesterg@kernel.org>
From: dwesterg@gmail.com
Subject: [PATCH v2 net-next 07/10] net: eth: altera: change tx functions to type netdev_tx_t
Date: Thu, 13 Dec 2018 09:52:49 -0800
Message-Id: <20181213175252.21143-8-dalon.westergreen@linux.intel.com>
In-Reply-To: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, dinguyen@kernel.org, thor.thayer@linux.intel.com, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, mark.rutland@arm.commark.rutland@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Dalon Westergreen <dalon.westergreen@linux.intel.com>

Modify all msgdma and sgdma tx_buffer functions to be of type
netdev_tx_t, and also modify main tx function to be of
netdev_tx_t type.

Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
---
 drivers/net/ethernet/altera/altera_msgdma.c   | 5 +++--
 drivers/net/ethernet/altera/altera_msgdma.h   | 4 ++--
 drivers/net/ethernet/altera/altera_sgdma.c    | 5 +++--
 drivers/net/ethernet/altera/altera_sgdma.h    | 4 ++--
 drivers/net/ethernet/altera/altera_tse.h      | 4 ++--
 drivers/net/ethernet/altera/altera_tse_main.c | 2 +-
 6 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_msgdma.c b/drivers/net/ethernet/altera/altera_msgdma.c
index 0fb986ba3290..95f016731cc2 100644
--- a/drivers/net/ethernet/altera/altera_msgdma.c
+++ b/drivers/net/ethernet/altera/altera_msgdma.c
@@ -117,7 +117,8 @@ void msgdma_clear_txirq(struct altera_tse_private *priv)
 }
 
 /* return 0 to indicate transmit is pending */
-int msgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
+netdev_tx_t
+msgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
 {
 	csrwr32(lower_32_bits(buffer->dma_addr), priv->tx_dma_desc,
 		msgdma_descroffs(read_addr_lo));
@@ -131,7 +132,7 @@ int msgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
 		msgdma_descroffs(stride));
 	csrwr32(MSGDMA_DESC_CTL_TX_SINGLE, priv->tx_dma_desc,
 		msgdma_descroffs(control));
-	return 0;
+	return NETDEV_TX_OK;
 }
 
 u32 msgdma_tx_completions(struct altera_tse_private *priv)
diff --git a/drivers/net/ethernet/altera/altera_msgdma.h b/drivers/net/ethernet/altera/altera_msgdma.h
index e18be91a48a7..e9008e3761b9 100644
--- a/drivers/net/ethernet/altera/altera_msgdma.h
+++ b/drivers/net/ethernet/altera/altera_msgdma.h
@@ -27,8 +27,8 @@ void msgdma_clear_txirq(struct altera_tse_private *priv);
 u32 msgdma_tx_completions(struct altera_tse_private *priv);
 void msgdma_add_rx_desc(struct altera_tse_private *priv,
 			struct tse_buffer *buffer);
-int msgdma_tx_buffer(struct altera_tse_private *priv,
-		     struct tse_buffer *buffer);
+netdev_tx_t msgdma_tx_buffer(struct altera_tse_private *priv,
+			     struct tse_buffer *buffer);
 u32 msgdma_rx_status(struct altera_tse_private *priv);
 int msgdma_initialize(struct altera_tse_private *priv);
 void msgdma_uninitialize(struct altera_tse_private *priv);
diff --git a/drivers/net/ethernet/altera/altera_sgdma.c b/drivers/net/ethernet/altera/altera_sgdma.c
index eb47b9b820bb..93f66af338de 100644
--- a/drivers/net/ethernet/altera/altera_sgdma.c
+++ b/drivers/net/ethernet/altera/altera_sgdma.c
@@ -177,7 +177,8 @@ void sgdma_clear_txirq(struct altera_tse_private *priv)
  *   will now actually look at the code, so from now, 0 is good and return
  *   NETDEV_TX_BUSY when busy.
  */
-int sgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
+netdev_tx_t
+sgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
 {
 	struct sgdma_descrip __iomem *descbase =
 		(struct sgdma_descrip __iomem *)priv->tx_dma_desc;
@@ -204,7 +205,7 @@ int sgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *buffer)
 	/* enqueue the request to the pending transmit queue */
 	queue_tx(priv, buffer);
 
-	return 0;
+	return NETDEV_TX_OK;
 }
 
 
diff --git a/drivers/net/ethernet/altera/altera_sgdma.h b/drivers/net/ethernet/altera/altera_sgdma.h
index 769e720a2043..984c00d81596 100644
--- a/drivers/net/ethernet/altera/altera_sgdma.h
+++ b/drivers/net/ethernet/altera/altera_sgdma.h
@@ -24,8 +24,8 @@ void sgdma_disable_rxirq(struct altera_tse_private *priv);
 void sgdma_disable_txirq(struct altera_tse_private *priv);
 void sgdma_clear_rxirq(struct altera_tse_private *priv);
 void sgdma_clear_txirq(struct altera_tse_private *priv);
-int sgdma_tx_buffer(struct altera_tse_private *priv,
-		    struct tse_buffer *buffer);
+netdev_tx_t sgdma_tx_buffer(struct altera_tse_private *priv,
+			    struct tse_buffer *buffer);
 u32 sgdma_tx_completions(struct altera_tse_private *priv);
 void sgdma_add_rx_desc(struct altera_tse_private *priv,
 		       struct tse_buffer *buffer);
diff --git a/drivers/net/ethernet/altera/altera_tse.h b/drivers/net/ethernet/altera/altera_tse.h
index f435fb0eca90..6e7f92ebf3cf 100644
--- a/drivers/net/ethernet/altera/altera_tse.h
+++ b/drivers/net/ethernet/altera/altera_tse.h
@@ -403,8 +403,8 @@ struct altera_dmaops {
 	void (*disable_rxirq)(struct altera_tse_private *priv);
 	void (*clear_txirq)(struct altera_tse_private *priv);
 	void (*clear_rxirq)(struct altera_tse_private *priv);
-	int (*tx_buffer)(struct altera_tse_private *priv,
-			 struct tse_buffer *buffer);
+	netdev_tx_t (*tx_buffer)(struct altera_tse_private *priv,
+				 struct tse_buffer *buffer);
 	u32 (*tx_completions)(struct altera_tse_private *priv);
 	void (*add_rx_desc)(struct altera_tse_private *priv,
 			    struct tse_buffer *buffer);
diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index b25d03506470..24915f72e965 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -564,7 +564,7 @@ static irqreturn_t altera_isr(int irq, void *dev_id)
  * physically contiguous fragment starting at
  * skb->data, for length of skb_headlen(skb).
  */
-static int tse_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t tse_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct altera_tse_private *priv = netdev_priv(dev);
 	unsigned int txsize = priv->tx_ring_size;
-- 
2.19.2
