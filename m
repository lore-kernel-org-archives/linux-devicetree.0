From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 2/7] watchdog: orion: Introduce per-SoC stop() function
Date: Tue,  4 Mar 2014 13:07:19 -0300
Message-ID: <1393949244-5011-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393949244-5011-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393949244-5011-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to support other SoCs, it's needed to have a different stop()
implementation for each SoC. This commit adds no functionality, and it
consists of preparation work.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/watchdog/orion_wdt.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index 383da34..c3ee305 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -59,6 +59,7 @@ struct orion_watchdog_data {
 	int (*clock_init)(struct platform_device *,
 			  struct orion_watchdog *);
 	int (*start)(struct watchdog_device *);
+	int (*stop)(struct watchdog_device *);
 };
 
 struct orion_watchdog {
@@ -190,7 +191,7 @@ static int orion_wdt_start(struct watchdog_device *wdt_dev)
 	return dev->data->start(wdt_dev);
 }
 
-static int orion_wdt_stop(struct watchdog_device *wdt_dev)
+static int orion_stop(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
 
@@ -203,6 +204,26 @@ static int orion_wdt_stop(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static int armada370_stop(struct watchdog_device *wdt_dev)
+{
+	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
+
+	/* Disable reset on watchdog */
+	atomic_io_modify(dev->rstout, dev->data->rstout_enable_bit, 0);
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
@@ -275,6 +296,7 @@ static const struct orion_watchdog_data orion_data = {
 	.wdt_counter_offset = 0x24,
 	.clock_init = orion_wdt_clock_init,
 	.start = orion_start,
+	.stop = orion_stop,
 };
 
 static const struct orion_watchdog_data armada370_data = {
@@ -283,6 +305,7 @@ static const struct orion_watchdog_data armada370_data = {
 	.wdt_counter_offset = 0x34,
 	.clock_init = armada370_wdt_clock_init,
 	.start = armada370_start,
+	.stop = armada370_stop,
 };
 
 static const struct orion_watchdog_data armadaxp_data = {
@@ -291,6 +314,7 @@ static const struct orion_watchdog_data armadaxp_data = {
 	.wdt_counter_offset = 0x34,
 	.clock_init = armadaxp_wdt_clock_init,
 	.start = armada370_start,
+	.stop = armada370_stop,
 };
 
 static const struct of_device_id orion_wdt_of_match_table[] = {
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
