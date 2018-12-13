Return-Path: <SRS0=W32e=OW=gmail.com=dwesterg@kernel.org>
From: dwesterg@gmail.com
Subject: [PATCH v2 net-next 06/10] net: eth: altera: Add missing identifier names to function declarations
Date: Thu, 13 Dec 2018 09:52:48 -0800
Message-Id: <20181213175252.21143-7-dalon.westergreen@linux.intel.com>
In-Reply-To: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, dinguyen@kernel.org, thor.thayer@linux.intel.com, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, mark.rutland@arm.commark.rutland@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Dalon Westergreen <dalon.westergreen@linux.intel.com>

The sgdma and msgdma header files included function declarations
without identifier names for pointers.  Add appropriate identifier
names.

Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
---
 drivers/net/ethernet/altera/altera_msgdma.h | 30 ++++++++++---------
 drivers/net/ethernet/altera/altera_sgdma.h  | 32 +++++++++++----------
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_msgdma.h b/drivers/net/ethernet/altera/altera_msgdma.h
index 42cf61c81057..e18be91a48a7 100644
--- a/drivers/net/ethernet/altera/altera_msgdma.h
+++ b/drivers/net/ethernet/altera/altera_msgdma.h
@@ -17,19 +17,21 @@
 #ifndef __ALTERA_MSGDMA_H__
 #define __ALTERA_MSGDMA_H__
 
-void msgdma_reset(struct altera_tse_private *);
-void msgdma_enable_txirq(struct altera_tse_private *);
-void msgdma_enable_rxirq(struct altera_tse_private *);
-void msgdma_disable_rxirq(struct altera_tse_private *);
-void msgdma_disable_txirq(struct altera_tse_private *);
-void msgdma_clear_rxirq(struct altera_tse_private *);
-void msgdma_clear_txirq(struct altera_tse_private *);
-u32 msgdma_tx_completions(struct altera_tse_private *);
-void msgdma_add_rx_desc(struct altera_tse_private *, struct tse_buffer *);
-int msgdma_tx_buffer(struct altera_tse_private *, struct tse_buffer *);
-u32 msgdma_rx_status(struct altera_tse_private *);
-int msgdma_initialize(struct altera_tse_private *);
-void msgdma_uninitialize(struct altera_tse_private *);
-void msgdma_start_rxdma(struct altera_tse_private *);
+void msgdma_reset(struct altera_tse_private *priv);
+void msgdma_enable_txirq(struct altera_tse_private *priv);
+void msgdma_enable_rxirq(struct altera_tse_private *priv);
+void msgdma_disable_rxirq(struct altera_tse_private *priv);
+void msgdma_disable_txirq(struct altera_tse_private *priv);
+void msgdma_clear_rxirq(struct altera_tse_private *priv);
+void msgdma_clear_txirq(struct altera_tse_private *priv);
+u32 msgdma_tx_completions(struct altera_tse_private *priv);
+void msgdma_add_rx_desc(struct altera_tse_private *priv,
+			struct tse_buffer *buffer);
+int msgdma_tx_buffer(struct altera_tse_private *priv,
+		     struct tse_buffer *buffer);
+u32 msgdma_rx_status(struct altera_tse_private *priv);
+int msgdma_initialize(struct altera_tse_private *priv);
+void msgdma_uninitialize(struct altera_tse_private *priv);
+void msgdma_start_rxdma(struct altera_tse_private *priv);
 
 #endif /*  __ALTERA_MSGDMA_H__ */
diff --git a/drivers/net/ethernet/altera/altera_sgdma.h b/drivers/net/ethernet/altera/altera_sgdma.h
index 584977e29ef9..769e720a2043 100644
--- a/drivers/net/ethernet/altera/altera_sgdma.h
+++ b/drivers/net/ethernet/altera/altera_sgdma.h
@@ -17,20 +17,22 @@
 #ifndef __ALTERA_SGDMA_H__
 #define __ALTERA_SGDMA_H__
 
-void sgdma_reset(struct altera_tse_private *);
-void sgdma_enable_txirq(struct altera_tse_private *);
-void sgdma_enable_rxirq(struct altera_tse_private *);
-void sgdma_disable_rxirq(struct altera_tse_private *);
-void sgdma_disable_txirq(struct altera_tse_private *);
-void sgdma_clear_rxirq(struct altera_tse_private *);
-void sgdma_clear_txirq(struct altera_tse_private *);
-int sgdma_tx_buffer(struct altera_tse_private *priv, struct tse_buffer *);
-u32 sgdma_tx_completions(struct altera_tse_private *);
-void sgdma_add_rx_desc(struct altera_tse_private *priv, struct tse_buffer *);
-void sgdma_status(struct altera_tse_private *);
-u32 sgdma_rx_status(struct altera_tse_private *);
-int sgdma_initialize(struct altera_tse_private *);
-void sgdma_uninitialize(struct altera_tse_private *);
-void sgdma_start_rxdma(struct altera_tse_private *);
+void sgdma_reset(struct altera_tse_private *priv);
+void sgdma_enable_txirq(struct altera_tse_private *priv);
+void sgdma_enable_rxirq(struct altera_tse_private *priv);
+void sgdma_disable_rxirq(struct altera_tse_private *priv);
+void sgdma_disable_txirq(struct altera_tse_private *priv);
+void sgdma_clear_rxirq(struct altera_tse_private *priv);
+void sgdma_clear_txirq(struct altera_tse_private *priv);
+int sgdma_tx_buffer(struct altera_tse_private *priv,
+		    struct tse_buffer *buffer);
+u32 sgdma_tx_completions(struct altera_tse_private *priv);
+void sgdma_add_rx_desc(struct altera_tse_private *priv,
+		       struct tse_buffer *buffer);
+void sgdma_status(struct altera_tse_private *priv);
+u32 sgdma_rx_status(struct altera_tse_private *priv);
+int sgdma_initialize(struct altera_tse_private *priv);
+void sgdma_uninitialize(struct altera_tse_private *priv);
+void sgdma_start_rxdma(struct altera_tse_private *priv);
 
 #endif /*  __ALTERA_SGDMA_H__ */
-- 
2.19.2
