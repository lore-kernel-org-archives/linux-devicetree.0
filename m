From: nyushchenko@dev.rtsoft.ru
Subject: [PATCH 21/21] at91sam9_wdt: use devm_irq_of_parse_and_map()
Date: Wed,  4 Jun 2014 15:13:21 +0400
Message-ID: <1401880402-30091-22-git-send-email-nyushchenko@dev.rtsoft.ru>
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
 drivers/watchdog/at91sam9_wdt.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index 489729b..11ebe54 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -207,9 +207,9 @@ static int at91_wdt_init(struct platform_device *pdev, struct at91wdt *wdt)
 			 "min heartbeat and max heartbeat might be too close for the system to handle it correctly\n");
 
 	if ((tmp & AT91_WDT_WDFIEN) && wdt->irq) {
-		err = request_irq(wdt->irq, wdt_interrupt,
-				  IRQF_SHARED | IRQF_IRQPOLL,
-				  pdev->name, wdt);
+		err = devm_request_irq(dev, wdt->irq, wdt_interrupt,
+				       IRQF_SHARED | IRQF_IRQPOLL,
+				       pdev->name, wdt);
 		if (err)
 			return err;
 	}
@@ -270,9 +270,11 @@ static int of_at91wdt_init(struct device_node *np, struct at91wdt *wdt)
 	const char *tmp;
 
 	/* Get the interrupts property */
-	wdt->irq = irq_of_parse_and_map(np, 0);
-	if (!wdt->irq)
+	wdt->irq = devm_irq_of_parse_and_map(wdt->wdd.parent, np, 0);
+	if (wdt->irq <= 0) {
 		dev_warn(wdt->wdd.parent, "failed to get IRQ from DT\n");
+		wdt->irq = NO_IRQ;
+	}
 
 	if (!of_property_read_u32_index(np, "atmel,max-heartbeat-sec", 0,
 					&max)) {
-- 
1.7.10.4
