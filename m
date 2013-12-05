From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH v3 9/9] mtd: nand: davinci: don't request AEMIF address range
Date: Thu, 5 Dec 2013 19:25:57 +0200
Message-ID: <1386264358-9738-10-git-send-email-ivan.khoronzhuk@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, grygorii.strashko@ti.com, dwmw2@infradead.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

The TI AEMIF driver registers are used to setup timings for each chip
select. The same registers range is used to setup NAND settings.
The AEMIF and NAND drivers not use the same registers in this range.

In case with TI AEMIF driver, the memory address range is requested
already by AEMIF, so we cannot request it twice, just ioremap.

Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Taras Kondratiuk <taras@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index f7b21b8..0cd4dbc 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -636,9 +636,11 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
-	base = devm_ioremap_resource(&pdev->dev, res2);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	base = devm_ioremap(&pdev->dev, res2->start, resource_size(res2));
+	if (!base) {
+		dev_err(&pdev->dev, "ioremap failed for resource %pR\n", res2);
+		return -EADDRNOTAVAIL;
+	}
 
 	info->dev		= &pdev->dev;
 	info->base		= base;
-- 
1.7.9.5
