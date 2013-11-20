From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH 2/7] mtd: nand: davinci: return ENOMEM if memory allocation is failed
Date: Wed, 20 Nov 2013 17:22:20 +0200
Message-ID: <1384960945-14528-3-git-send-email-ivan.khoronzhuk@ti.com>
References: <1384960945-14528-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1384960945-14528-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, grygorii.strashko@ti.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

In case when memory allocation is failed the driver should return
ENOMEM instead of ENODEV.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index d87213f..ddcd7c8 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -541,7 +541,7 @@ static struct davinci_nand_pdata
 				GFP_KERNEL);
 		pdev->dev.platform_data = pdata;
 		if (!pdata)
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 		if (!of_property_read_u32(pdev->dev.of_node,
 			"ti,davinci-chipselect", &prop))
 			pdev->id = prop;
@@ -598,6 +598,9 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	nand_ecc_modes_t		ecc_mode;
 
 	pdata = nand_davinci_get_pdata(pdev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
 	/* insist on board-specific configuration */
 	if (!pdata)
 		return -ENODEV;
-- 
1.7.9.5
