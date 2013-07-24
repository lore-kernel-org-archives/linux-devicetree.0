Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db9lp0249.outbound.messaging.microsoft.com ([213.199.154.249]:22047
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750876Ab3GXGVv (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 24 Jul 2013 02:21:51 -0400
From: <hongbo.zhang@freescale.com>
Subject: [PATCH v5 4/4] DMA: Freescale: eliminate a compiling warning
Date: Wed, 24 Jul 2013 14:21:09 +0800
Message-ID: <1374646870-5162-5-git-send-email-hongbo.zhang@freescale.com>
In-Reply-To: <1374646870-5162-1-git-send-email-hongbo.zhang@freescale.com>
References: <1374646870-5162-1-git-send-email-hongbo.zhang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Hongbo Zhang <hongbo.zhang@freescale.com>
List-ID: <devicetree@vger.kernel.org>

From: Hongbo Zhang <hongbo.zhang@freescale.com>

The variable cookie is initialized in a list_for_each_entry loop, if(unlikely)
the list is empty, this variable will be used uninitialized, so we get a gcc
compiling warning about this. This patch fixes this defect by setting an
initial value to the varialble cookie.

Signed-off-by: Hongbo Zhang <hongbo.zhang@freescale.com>
---
 drivers/dma/fsldma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 16a9a48..14d68a4 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -406,7 +406,7 @@ static dma_cookie_t fsl_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	struct fsl_desc_sw *desc = tx_to_fsl_desc(tx);
 	struct fsl_desc_sw *child;
 	unsigned long flags;
-	dma_cookie_t cookie;
+	dma_cookie_t cookie = 0;
 
 	spin_lock_irqsave(&chan->desc_lock, flags);
 
-- 
1.7.9.5



