Return-Path: <SRS0=W32e=OW=gmail.com=dwesterg@kernel.org>
From: dwesterg@gmail.com
Subject: [PATCH v2 net-next 03/10] net: eth: altera: fix altera_dmaops declaration
Date: Thu, 13 Dec 2018 09:52:45 -0800
Message-Id: <20181213175252.21143-4-dalon.westergreen@linux.intel.com>
In-Reply-To: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
References: <20181213175252.21143-1-dalon.westergreen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, dinguyen@kernel.org, thor.thayer@linux.intel.com, richardcochran@gmail.com, davem@davemloft.net, vbridger@opensource.altera.com, robh+dt@kernel.org, mark.rutland@arm.commark.rutland@arm.com, devicetree@vger.kernel.org, hean.loong.ong@intel.com
Cc: Dalon Westergreen <dalon.westergreen@intel.com>
List-ID: <devicetree@vger.kernel.org>

From: Dalon Westergreen <dalon.westergreen@intel.com>

The declaration of struct altera_dmaops does not have
identifier names.  Add identifier names to confrom with
required coding styles.

Signed-off-by: Dalon Westergreen <dalon.westergreen@intel.com>
---
 drivers/net/ethernet/altera/altera_tse.h | 30 +++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/altera/altera_tse.h b/drivers/net/ethernet/altera/altera_tse.h
index e2feee87180a..d5b97e02e6d6 100644
--- a/drivers/net/ethernet/altera/altera_tse.h
+++ b/drivers/net/ethernet/altera/altera_tse.h
@@ -396,20 +396,22 @@ struct altera_tse_private;
 struct altera_dmaops {
 	int altera_dtype;
 	int dmamask;
-	void (*reset_dma)(struct altera_tse_private *);
-	void (*enable_txirq)(struct altera_tse_private *);
-	void (*enable_rxirq)(struct altera_tse_private *);
-	void (*disable_txirq)(struct altera_tse_private *);
-	void (*disable_rxirq)(struct altera_tse_private *);
-	void (*clear_txirq)(struct altera_tse_private *);
-	void (*clear_rxirq)(struct altera_tse_private *);
-	int (*tx_buffer)(struct altera_tse_private *, struct tse_buffer *);
-	u32 (*tx_completions)(struct altera_tse_private *);
-	void (*add_rx_desc)(struct altera_tse_private *, struct tse_buffer *);
-	u32 (*get_rx_status)(struct altera_tse_private *);
-	int (*init_dma)(struct altera_tse_private *);
-	void (*uninit_dma)(struct altera_tse_private *);
-	void (*start_rxdma)(struct altera_tse_private *);
+	void (*reset_dma)(struct altera_tse_private *priv);
+	void (*enable_txirq)(struct altera_tse_private *priv);
+	void (*enable_rxirq)(struct altera_tse_private *priv);
+	void (*disable_txirq)(struct altera_tse_private *priv);
+	void (*disable_rxirq)(struct altera_tse_private *priv);
+	void (*clear_txirq)(struct altera_tse_private *priv);
+	void (*clear_rxirq)(struct altera_tse_private *priv);
+	int (*tx_buffer)(struct altera_tse_private *priv,
+			 struct tse_buffer *buffer);
+	u32 (*tx_completions)(struct altera_tse_private *priv);
+	void (*add_rx_desc)(struct altera_tse_private *priv,
+			    struct tse_buffer *buffer);
+	u32 (*get_rx_status)(struct altera_tse_private *priv);
+	int (*init_dma)(struct altera_tse_private *priv);
+	void (*uninit_dma)(struct altera_tse_private *priv);
+	void (*start_rxdma)(struct altera_tse_private *priv);
 };
 
 /* This structure is private to each device.
-- 
2.19.2
