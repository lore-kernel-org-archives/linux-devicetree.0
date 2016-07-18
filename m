From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 8/8] uio: Use new memtypes in uio_dmem_genirq
Date: Mon, 18 Jul 2016 14:44:20 +0530
Message-ID: <1468833260-5305-9-git-send-email-anup.patel@broadcom.com>
References: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Ankit Jindal <thatsjindal@gmail.com>, Jan Viktorin <viktorin@rehivetech.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch extends uio_dmem_genirq driver to use recently
added memtypes as follows:
1. Use UIO_MEM_DEVICE memtype for MEM resources
2. Use UIO_MEM_PHYS_CACHE memtype for dynamic regions
when UIO DT node is marked as DMA coherent.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
---
 drivers/uio/uio_dmem_genirq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index 1db2559..ce36afd 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -327,7 +327,7 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 			break;
 		}
 
-		uiomem->memtype = UIO_MEM_PHYS;
+		uiomem->memtype = UIO_MEM_DEVICE;
 		uiomem->addr = r->start;
 		uiomem->size = resource_size(r);
 		++uiomem;
@@ -343,7 +343,12 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 					" dynamic and fixed memory regions.\n");
 			break;
 		}
-		uiomem->memtype = UIO_MEM_PHYS;
+
+		if (pdev->dev.of_node &&
+		    of_dma_is_coherent(pdev->dev.of_node))
+			uiomem->memtype = UIO_MEM_PHYS_CACHE;
+		else
+			uiomem->memtype = UIO_MEM_PHYS;
 		uiomem->addr = DMEM_MAP_ERROR;
 		uiomem->size = pdata->dynamic_region_sizes[i];
 		++uiomem;
-- 
1.9.1

