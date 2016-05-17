From: Jan Viktorin <viktorin@rehivetech.com>
Subject: [PATCH 1/4] uio: fix dmem_region_start computation
Date: Tue, 17 May 2016 11:22:17 +0200
Message-ID: <1463476940-26791-2-git-send-email-viktorin@rehivetech.com>
References: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jan Viktorin <viktorin@rehivetech.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

The variable i contains a total number of resources (including
IORESOURCE_IRQ). However, we want the dmem_region_start to point
after the last resource of type IORESOURCE_MEM. The original behaviour
leads (very likely) to skipping several UIO mapping regions and makes
them useless. Fix this by computing dmem_region_start from the uiomem
which points to the last used UIO mapping.

Fixes: 0a0c3b5a24bd ("Add new uio device for dynamic memory allocation")

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 drivers/uio/uio_dmem_genirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index 915facb..e1134a4 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -229,7 +229,7 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 		++uiomem;
 	}
 
-	priv->dmem_region_start = i;
+	priv->dmem_region_start = uiomem - &uioinfo->mem[0];
 	priv->num_dmem_regions = pdata->num_dynamic_regions;
 
 	for (i = 0; i < pdata->num_dynamic_regions; ++i) {
-- 
2.8.0
