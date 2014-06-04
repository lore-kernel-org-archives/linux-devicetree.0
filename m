From: nyushchenko@dev.rtsoft.ru
Subject: [PATCH 16/21] bq24190_charger: use devm_irq_of_parse_and_map()
Date: Wed,  4 Jun 2014 15:13:16 +0400
Message-ID: <1401880402-30091-17-git-send-email-nyushchenko@dev.rtsoft.ru>
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
 drivers/power/bq24190_charger.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/bq24190_charger.c b/drivers/power/bq24190_charger.c
index ad3ff8f..7ba8c03 100644
--- a/drivers/power/bq24190_charger.c
+++ b/drivers/power/bq24190_charger.c
@@ -1315,7 +1315,7 @@ out:
 #ifdef CONFIG_OF
 static int bq24190_setup_dt(struct bq24190_dev_info *bdi)
 {
-	bdi->irq = irq_of_parse_and_map(bdi->dev->of_node, 0);
+	bdi->irq = devm_irq_of_parse_and_map(bdi->dev, bdi->dev->of_node, 0);
 	if (bdi->irq <= 0)
 		return -1;
 
-- 
1.7.10.4
