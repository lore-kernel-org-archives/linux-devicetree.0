From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 1/8] uio: fix dmem_region_start computation
Date: Mon, 18 Jul 2016 14:44:13 +0530
Message-ID: <1468833260-5305-2-git-send-email-anup.patel@broadcom.com>
References: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468833260-5305-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Ankit Jindal <thatsjindal@gmail.com>, Jan Viktorin <viktorin@rehivetech.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Anup Patel <anup.patel@broadcom.com>, linux-stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Jan Viktorin <viktorin@rehivetech.com>

The variable i contains a total number of resources (including
IORESOURCE_IRQ). However, we want the dmem_region_start to point
after the last resource of type IORESOURCE_MEM. The original behaviour
leads (very likely) to skipping several UIO mapping regions and makes
them useless. Fix this by computing dmem_region_start from the uiomem
which points to the last used UIO mapping.

Fixes: 0a0c3b5a24bd ("Add new uio device for dynamic memory allocation")

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Cc: linux-stable <stable@vger.kernel.org>
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
1.9.1
