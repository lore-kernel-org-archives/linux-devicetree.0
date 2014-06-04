From: nyushchenko@dev.rtsoft.ru
Subject: [PATCH 12/21] mpc5121_nfc: use devm_irq_of_parse_and_map()
Date: Wed,  4 Jun 2014 15:13:12 +0400
Message-ID: <1401880402-30091-13-git-send-email-nyushchenko@dev.rtsoft.ru>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, lugovskoy@dev.rtsoft.ru, Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
List-Id: devicetree@vger.kernel.org

From: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>

This avoids leak of IRQ mapping on error paths, and makes it possible
to use devm_request_irq() without facing unmap-while-handler-installed
issues.

Signed-off-by: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
---
 drivers/mtd/nand/mpc5121_nfc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index e78841a..b710168 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -669,10 +669,10 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return retval;
 	}
 
-	prv->irq = irq_of_parse_and_map(dn, 0);
-	if (prv->irq == NO_IRQ) {
+	prv->irq = devm_irq_of_parse_and_map(dev, dn, 0);
+	if (prv->irq <= 0) {
 		dev_err(dev, "Error mapping IRQ!\n");
-		return -EINVAL;
+		return prv->irq ? prv->irq : -EINVAL;
 	}
 
 	retval = of_address_to_resource(dn, 0, &res);
-- 
1.7.10.4
