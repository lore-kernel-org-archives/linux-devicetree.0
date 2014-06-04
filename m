From: nyushchenko@dev.rtsoft.ru
Subject: [PATCH 19/21] exynos_tmu: use devm_irq_of_parse_and_map()
Date: Wed,  4 Jun 2014 15:13:19 +0400
Message-ID: <1401880402-30091-20-git-send-email-nyushchenko@dev.rtsoft.ru>
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
 drivers/thermal/samsung/exynos_tmu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 0d96a51..eb1adb3 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -553,7 +553,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	if (data->id < 0)
 		data->id = 0;
 
-	data->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	data->irq = devm_irq_of_parse_and_map(&pdev->dev, pdev->dev.of_node, 0);
 	if (data->irq <= 0) {
 		dev_err(&pdev->dev, "failed to get IRQ\n");
 		return -ENODEV;
-- 
1.7.10.4
