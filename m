From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 09/15] watchdog: orion: Add per-compatible clock initialization
Date: Tue, 21 Jan 2014 10:26:08 -0300
Message-ID: <1390310774-20781-10-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1390310774-20781-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390310774-20781-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Following the introduction of the compatible-data field,
it's now possible to further abstract the clock initialization.
This will allow to support SoC with a different clock setup.

While we're at it, let's fix the clock error handling by returning
PTR_ERR and checking clk_prepare_enable().

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/watchdog/orion_wdt.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 5108496..b8d0f87 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -44,10 +44,14 @@
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static int heartbeat = -1;		/* module parameter (seconds) */
 
+struct orion_watchdog;
+
 struct orion_watchdog_data {
 	int wdt_counter_offset;
 	int wdt_enable_bit;
 	int rstout_enable_bit;
+	int (*clock_init) (struct platform_device *,
+			   struct orion_watchdog *);
 };
 
 struct orion_watchdog {
@@ -59,6 +63,22 @@ struct orion_watchdog {
 	struct orion_watchdog_data *data;
 };
 
+static int orion_wdt_clock_init(struct platform_device *pdev,
+				struct orion_watchdog *dev)
+{
+	int ret;
+
+	dev->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(dev->clk))
+		return PTR_ERR(dev->clk);
+	ret = clk_prepare_enable(dev->clk);
+	if (ret)
+		return ret;
+
+	dev->clk_rate = clk_get_rate(dev->clk);
+	return 0;
+}
+
 static int orion_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
@@ -137,6 +157,7 @@ static const struct orion_watchdog_data orion_data = {
 	.rstout_enable_bit = BIT(1),
 	.wdt_enable_bit = BIT(4),
 	.wdt_counter_offset = 0x24,
+	.clock_init = orion_wdt_clock_init,
 };
 
 static const struct of_device_id orion_wdt_of_match_table[] = {
@@ -171,14 +192,6 @@ static int orion_wdt_probe(struct platform_device *pdev)
 	dev->wdt.min_timeout = 1;
 	dev->data = (struct orion_watchdog_data *)match->data;
 
-	dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		dev_err(&pdev->dev, "Orion Watchdog missing clock\n");
-		return -ENODEV;
-	}
-	clk_prepare_enable(dev->clk);
-	dev->clk_rate = clk_get_rate(dev->clk);
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
@@ -194,6 +207,12 @@ static int orion_wdt_probe(struct platform_device *pdev)
 	if (!dev->rstout)
 		return -ENOMEM;
 
+	ret = dev->data->clock_init(pdev, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "cannot initialize clock\n");
+		return ret;
+	}
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
 		/*
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
