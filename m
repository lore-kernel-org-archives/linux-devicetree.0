From: nyushchenko@dev.rtsoft.ru
Subject: [PATCH 03/21] exynos5440-cpufreq: use devm_irq_of_parse_and_map()
Date: Wed,  4 Jun 2014 15:13:03 +0400
Message-ID: <1401880402-30091-4-git-send-email-nyushchenko@dev.rtsoft.ru>
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
 drivers/cpufreq/exynos5440-cpufreq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
index a6b8214..a0b7121 100644
--- a/drivers/cpufreq/exynos5440-cpufreq.c
+++ b/drivers/cpufreq/exynos5440-cpufreq.c
@@ -353,8 +353,8 @@ static int exynos_cpufreq_probe(struct platform_device *pdev)
 		goto err_put_node;
 	}
 
-	dvfs_info->irq = irq_of_parse_and_map(np, 0);
-	if (!dvfs_info->irq) {
+	dvfs_info->irq = devm_irq_of_parse_and_map(dvfs_info->dev, np, 0);
+	if (dvfs_info->irq <= 0) {
 		dev_err(dvfs_info->dev, "No cpufreq irq found\n");
 		ret = -ENODEV;
 		goto err_put_node;
-- 
1.7.10.4
