Return-Path: <SRS0=Ekl+=JQ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 2/7] mmc: pxamci: remove dma resources from private context
Date: Sat, 30 Jun 2018 20:14:00 +0200
Message-Id: <20180630181405.17630-3-daniel@zonque.org>
In-Reply-To: <20180630181405.17630-1-daniel@zonque.org>
References: <20180630181405.17630-1-daniel@zonque.org>
To: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: robert.jarzmik@free.fr, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

These members are no longer in use, so let's remove them.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mmc/host/pxamci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index f0968882dbd3..a826c0e8a096 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -71,12 +71,8 @@ struct pxamci_host {
 	struct dma_chan		*dma_chan_rx;
 	struct dma_chan		*dma_chan_tx;
 	dma_cookie_t		dma_cookie;
-	dma_addr_t		sg_dma;
 	unsigned int		dma_len;
-
 	unsigned int		dma_dir;
-	unsigned int		dma_drcmrrx;
-	unsigned int		dma_drcmrtx;
 
 	struct regulator	*vcc;
 };
-- 
2.17.1
