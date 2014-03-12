From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 3/8] watchdog: orion: Introduce per-SoC stop() function
Date: Wed, 12 Mar 2014 18:11:50 -0300
Message-ID: <1394658715-2017-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1394658715-2017-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394658715-2017-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to support other SoCs, it's needed to have a different stop()
implementation for each SoC. This commit adds no functionality, and it
consists of preparation work.

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/watchdog/orion_wdt.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 9c25012..1cb50d6 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -59,6 +59,7 @@ struct orion_watchdog_data {
 	int (*clock_init)(struct platform_device *,
 			  struct orion_watchdog *);
 	int (*start)(struct watchdog_device *);
+	int (*stop)(struct watchdog_device *);
 };
 
 struct orion_watchdog {
@@ -193,7 +194,7 @@ static int orion_wdt_start(struct watchdog_device *wdt_dev)
 	return dev->data->start(wdt_dev);
 }
 
-static int orion_wdt_stop(struct watchdog_device *wdt_dev)
+static int orion_stop(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
 
@@ -206,6 +207,29 @@ static int orion_wdt_stop(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static int armada370_stop(struct watchdog_device *wdt_dev)
+{
+	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
+	u32 reg;
+
+	/* Disable reset on watchdog */
+	reg = readl(dev->rstout);
+	reg &= ~dev->data->rstout_enable_bit;
+	writel(reg, dev->rstout);
+
+	/* Disable watchdog timer */
+	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit, 0);
+
+	return 0;
+}
+
+static int orion_wdt_stop(struct watchdog_device *wdt_dev)
+{
+	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
+
+	return dev->data->stop(wdt_dev);
+}
+
 static int orion_wdt_enabled(struct orion_watchdog *dev)
 {
 	bool enabled, running;
@@ -278,6 +302,7 @@ static const struct orion_watchdog_data orion_data = {
 	.wdt_counter_offset = 0x24,
 	.clock_init = orion_wdt_clock_init,
 	.start = orion_start,
+	.stop = orion_stop,
 };
 
 static const struct orion_watchdog_data armada370_data = {
@@ -286,6 +311,7 @@ static const struct orion_watchdog_data armada370_data = {
 	.wdt_counter_offset = 0x34,
 	.clock_init = armada370_wdt_clock_init,
 	.start = armada370_start,
+	.stop = armada370_stop,
 };
 
 static const struct orion_watchdog_data armadaxp_data = {
@@ -294,6 +320,7 @@ static const struct orion_watchdog_data armadaxp_data = {
 	.wdt_counter_offset = 0x34,
 	.clock_init = armadaxp_wdt_clock_init,
 	.start = armada370_start,
+	.stop = armada370_stop,
 };
 
 static const struct of_device_id orion_wdt_of_match_table[] = {
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
