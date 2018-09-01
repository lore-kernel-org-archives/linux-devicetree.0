From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 net-next 1/7] MIPS: lantiq: dma: add dev pointer
Date: Sat,  1 Sep 2018 13:45:29 +0200
Message-ID: <20180901114535.9070-2-hauke@hauke-m.de>
References: <20180901114535.9070-1-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180901114535.9070-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

dma_zalloc_coherent() now crashes if no dev pointer is given.
Add a dev pointer to the ltq_dma_channel structure and fill it in the
driver using it.

This fixes a bug introduced in kernel 4.19.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/mips/include/asm/mach-lantiq/xway/xway_dma.h | 1 +
 arch/mips/lantiq/xway/dma.c                       | 4 ++--
 drivers/net/ethernet/lantiq_etop.c                | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-lantiq/xway/xway_dma.h b/arch/mips/include/asm/mach-lantiq/xway/xway_dma.h
index 4901833498f7..8441b2698e64 100644
--- a/arch/mips/include/asm/mach-lantiq/xway/xway_dma.h
+++ b/arch/mips/include/asm/mach-lantiq/xway/xway_dma.h
@@ -40,6 +40,7 @@ struct ltq_dma_channel {
 	int desc;			/* the current descriptor */
 	struct ltq_dma_desc *desc_base; /* the descriptor base */
 	int phys;			/* physical addr */
+	struct device *dev;
 };
 
 enum {
diff --git a/arch/mips/lantiq/xway/dma.c b/arch/mips/lantiq/xway/dma.c
index 4b9fbb6744ad..664f2f7f55c1 100644
--- a/arch/mips/lantiq/xway/dma.c
+++ b/arch/mips/lantiq/xway/dma.c
@@ -130,7 +130,7 @@ ltq_dma_alloc(struct ltq_dma_channel *ch)
 	unsigned long flags;
 
 	ch->desc = 0;
-	ch->desc_base = dma_zalloc_coherent(NULL,
+	ch->desc_base = dma_zalloc_coherent(ch->dev,
 				LTQ_DESC_NUM * LTQ_DESC_SIZE,
 				&ch->phys, GFP_ATOMIC);
 
@@ -182,7 +182,7 @@ ltq_dma_free(struct ltq_dma_channel *ch)
 	if (!ch->desc_base)
 		return;
 	ltq_dma_close(ch);
-	dma_free_coherent(NULL, LTQ_DESC_NUM * LTQ_DESC_SIZE,
+	dma_free_coherent(ch->dev, LTQ_DESC_NUM * LTQ_DESC_SIZE,
 		ch->desc_base, ch->phys);
 }
 EXPORT_SYMBOL_GPL(ltq_dma_free);
diff --git a/drivers/net/ethernet/lantiq_etop.c b/drivers/net/ethernet/lantiq_etop.c
index 7a637b51c7d2..e08301d833e2 100644
--- a/drivers/net/ethernet/lantiq_etop.c
+++ b/drivers/net/ethernet/lantiq_etop.c
@@ -274,6 +274,7 @@ ltq_etop_hw_init(struct net_device *dev)
 		struct ltq_etop_chan *ch = &priv->ch[i];
 
 		ch->idx = ch->dma.nr = i;
+		ch->dma.dev = &priv->pdev->dev;
 
 		if (IS_TX(i)) {
 			ltq_dma_alloc_tx(&ch->dma);
-- 
2.11.0
