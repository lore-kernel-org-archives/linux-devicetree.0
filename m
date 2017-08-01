From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 12/16] dmaengine: bcm-sba-raid: Pre-ack async tx descriptor
Date: Tue,  1 Aug 2017 16:07:56 +0530
Message-ID: <1501583880-32072-13-git-send-email-anup.patel@broadcom.com>
References: <1501583880-32072-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501583880-32072-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We should pre-ack async tx descriptor at time of
allocating sba_request (just like other RAID drivers).

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 drivers/dma/bcm-sba-raid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 399250e..2f444cc 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -237,6 +237,7 @@ static struct sba_request *sba_alloc_request(struct sba_device *sba)
 	atomic_set(&req->next_pending_count, 1);
 
 	dma_async_tx_descriptor_init(&req->tx, &sba->dma_chan);
+	async_tx_ack(&req->tx);
 
 	return req;
 }
-- 
2.7.4
