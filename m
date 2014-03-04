From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 3/7] watchdog: orion: Introduce per-SoC enabled() function
Date: Tue,  4 Mar 2014 13:07:20 -0300
Message-ID: <1393949244-5011-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393949244-5011-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393949244-5011-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to support other SoCs, it's needed to have a different enabled()
implementation for each SoC. This commit adds no functionality, and it
consists of preparation work.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/watchdog/orion_wdt.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index c3ee305..8fb8e65 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -58,6 +58,7 @@ struct orion_watchdog_data {
 	int rstout_enable_bit;
 	int (*clock_init)(struct platform_device *,
 			  struct orion_watchdog *);
+	int (*enabled)(struct orion_watchdog *);
 	int (*start)(struct watchdog_device *);
 	int (*stop)(struct watchdog_device *);
 };
@@ -224,7 +225,7 @@ static int orion_wdt_stop(struct watchdog_device *wdt_dev)
 	return dev->data->stop(wdt_dev);
 }
 
-static int orion_wdt_enabled(struct orion_watchdog *dev)
+static int orion_enabled(struct orion_watchdog *dev)
 {
 	bool enabled, running;
 
@@ -234,6 +235,13 @@ static int orion_wdt_enabled(struct orion_watchdog *dev)
 	return enabled && running;
 }
 
+static int orion_wdt_enabled(struct watchdog_device *wdt_dev)
+{
+	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
+
+	return dev->data->enabled(dev);
+}
+
 static unsigned int orion_wdt_get_timeleft(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev = watchdog_get_drvdata(wdt_dev);
@@ -295,6 +303,7 @@ static const struct orion_watchdog_data orion_data = {
 	.wdt_enable_bit = BIT(4),
 	.wdt_counter_offset = 0x24,
 	.clock_init = orion_wdt_clock_init,
+	.enabled = orion_enabled,
 	.start = orion_start,
 	.stop = orion_stop,
 };
@@ -304,6 +313,7 @@ static const struct orion_watchdog_data armada370_data = {
 	.wdt_enable_bit = BIT(8),
 	.wdt_counter_offset = 0x34,
 	.clock_init = armada370_wdt_clock_init,
+	.enabled = orion_enabled,
 	.start = armada370_start,
 	.stop = armada370_stop,
 };
@@ -313,6 +323,7 @@ static const struct orion_watchdog_data armadaxp_data = {
 	.wdt_enable_bit = BIT(8),
 	.wdt_counter_offset = 0x34,
 	.clock_init = armadaxp_wdt_clock_init,
+	.enabled = orion_enabled,
 	.start = armada370_start,
 	.stop = armada370_stop,
 };
@@ -410,7 +421,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
 	 * removed and re-insterted, or if the bootloader explicitly
 	 * set a running watchdog before booting the kernel.
 	 */
-	if (!orion_wdt_enabled(dev))
+	if (!orion_wdt_enabled(&dev->wdt))
 		orion_wdt_stop(&dev->wdt);
 
 	/* Request the IRQ only after the watchdog is disabled */
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
