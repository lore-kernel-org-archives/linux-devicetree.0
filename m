From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 1/3] watchdog: dw_wdt: convert to SIMPLE_DEV_PM_OPS
Date: Wed, 26 Jun 2013 20:03:52 +0200
Message-ID: <201306262003.53192.heiko@sntech.de>
References: <201306262003.13256.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306262003.13256.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Jamie Iles <jamie@jamieiles.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The dw_wdt only provides PM_SLEEP operations, so convert the driver
to use SIMPLE_DEV_PM_OPS instead of populating the struct manually.
This has the added effect of simplifying the CONFIG_PM ifdefs.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/watchdog/dw_wdt.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index e621098..4d3906d 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -252,7 +252,7 @@ static int dw_wdt_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 static int dw_wdt_suspend(struct device *dev)
 {
 	clk_disable(dw_wdt.clk);
@@ -271,12 +271,9 @@ static int dw_wdt_resume(struct device *dev)
 
 	return 0;
 }
+#endif /* CONFIG_PM_SLEEP */
 
-static const struct dev_pm_ops dw_wdt_pm_ops = {
-	.suspend	= dw_wdt_suspend,
-	.resume		= dw_wdt_resume,
-};
-#endif /* CONFIG_PM */
+static SIMPLE_DEV_PM_OPS(dw_wdt_pm_ops, dw_wdt_suspend, dw_wdt_resume);
 
 static const struct file_operations wdt_fops = {
 	.owner		= THIS_MODULE,
@@ -346,9 +343,7 @@ static struct platform_driver dw_wdt_driver = {
 	.driver		= {
 		.name	= "dw_wdt",
 		.owner	= THIS_MODULE,
-#ifdef CONFIG_PM
 		.pm	= &dw_wdt_pm_ops,
-#endif /* CONFIG_PM */
 	},
 };
 
-- 
1.7.10.4
