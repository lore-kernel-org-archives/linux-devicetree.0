Return-Path: <SRS0=W32e=OW=gmail.com=dwesterg@kernel.org>
From: dwesterg@gmail.com
Subject: [PATCH v2 net-next 02/10] net: eth: altera: set rx and tx ring size before init_dma call
Date: Thu, 13 Dec 2018 09:52:44 -0800
Message-Id: <20181213175252.21143-3-dalon.westergreen@linux.intel.com>
In-Reply-To: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, dinguyen@kernel.org, thor.thayer@linux.intel.com, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, mark.rutland@arm.commark.rutland@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Dalon Westergreen <dalon.westergreen@intel.com>

It is more appropriate to set the rx and tx ring size before calling
the init function for the dma.

Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index dcb330129e23..0c0e8f9bba9b 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1166,6 +1166,10 @@ static int tse_open(struct net_device *dev)
 	int i;
 	unsigned long int flags;
 
+	/* set tx and rx ring size */
+	priv->rx_ring_size = dma_rx_num;
+	priv->tx_ring_size = dma_tx_num;
+
 	/* Reset and configure TSE MAC and probe associated PHY */
 	ret = priv->dmaops->init_dma(priv);
 	if (ret != 0) {
@@ -1208,8 +1212,6 @@ static int tse_open(struct net_device *dev)
 	priv->dmaops->reset_dma(priv);
 
 	/* Create and initialize the TX/RX descriptors chains. */
-	priv->rx_ring_size = dma_rx_num;
-	priv->tx_ring_size = dma_tx_num;
 	ret = alloc_init_skbufs(priv);
 	if (ret) {
 		netdev_err(dev, "DMA descriptors initialization failed\n");
-- 
2.19.2
