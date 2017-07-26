From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 3/6] dma: bcm-sba-raid: pre-ack async tx descriptor
Date: Wed, 26 Jul 2017 11:06:41 +0530
Message-ID: <1501047404-14456-4-git-send-email-anup.patel@broadcom.com>
References: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We should pre-ack async tx descriptor at time of
allocating SBA request (just like other RAID drivers).

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 drivers/dma/bcm-sba-raid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 321420b..db5e3db 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -236,6 +236,7 @@ static struct sba_request *sba_alloc_request(struct sba_device *sba)
 	atomic_set(&req->next_pending_count, 1);
 
 	dma_async_tx_descriptor_init(&req->tx, &sba->dma_chan);
+	async_tx_ack(&req->tx);
 
 	return req;
 }
-- 
2.7.4
