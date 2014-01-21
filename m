From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 03/15] watchdog: orion: Use atomic access for shared registers
Date: Tue, 21 Jan 2014 10:26:02 -0300
Message-ID: <1390310774-20781-4-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1390310774-20781-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390310774-20781-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since the timer control register is shared with the clocksource driver,
use the recently introduced atomic_io_clear_set() to access such register.
Given the watchdog core already provides serialization for all the
watchdog ops, this commit allows to remove the spinlock entirely.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/watchdog/orion_wdt.c | 42 +++++-------------------------------------
 1 file changed, 5 insertions(+), 37 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index f7722a4..0433ea8 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -20,7 +20,6 @@
 #include <linux/watchdog.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/spinlock.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/of.h>
@@ -46,25 +45,16 @@ static unsigned int wdt_max_duration;	/* (seconds) */
 static struct clk *clk;
 static unsigned int wdt_tclk;
 static void __iomem *wdt_reg;
-static DEFINE_SPINLOCK(wdt_lock);
 
 static int orion_wdt_ping(struct watchdog_device *wdt_dev)
 {
-	spin_lock(&wdt_lock);
-
 	/* Reload watchdog duration */
 	writel(wdt_tclk * wdt_dev->timeout, wdt_reg + WDT_VAL);
-
-	spin_unlock(&wdt_lock);
 	return 0;
 }
 
 static int orion_wdt_start(struct watchdog_device *wdt_dev)
 {
-	u32 reg;
-
-	spin_lock(&wdt_lock);
-
 	/* Set watchdog duration */
 	writel(wdt_tclk * wdt_dev->timeout, wdt_reg + WDT_VAL);
 
@@ -72,48 +62,26 @@ static int orion_wdt_start(struct watchdog_device *wdt_dev)
 	writel(~WDT_INT_REQ, BRIDGE_CAUSE);
 
 	/* Enable watchdog timer */
-	reg = readl(wdt_reg + TIMER_CTRL);
-	reg |= WDT_EN;
-	writel(reg, wdt_reg + TIMER_CTRL);
+	atomic_io_modify(wdt_reg + TIMER_CTRL, WDT_EN, WDT_EN);
 
 	/* Enable reset on watchdog */
-	reg = readl(RSTOUTn_MASK);
-	reg |= WDT_RESET_OUT_EN;
-	writel(reg, RSTOUTn_MASK);
-
-	spin_unlock(&wdt_lock);
+	atomic_io_modify(RSTOUTn_MASK, WDT_RESET_OUT_EN, WDT_RESET_OUT_EN);
 	return 0;
 }
 
 static int orion_wdt_stop(struct watchdog_device *wdt_dev)
 {
-	u32 reg;
-
-	spin_lock(&wdt_lock);
-
 	/* Disable reset on watchdog */
-	reg = readl(RSTOUTn_MASK);
-	reg &= ~WDT_RESET_OUT_EN;
-	writel(reg, RSTOUTn_MASK);
+	atomic_io_modify(RSTOUTn_MASK, WDT_RESET_OUT_EN, 0);
 
 	/* Disable watchdog timer */
-	reg = readl(wdt_reg + TIMER_CTRL);
-	reg &= ~WDT_EN;
-	writel(reg, wdt_reg + TIMER_CTRL);
-
-	spin_unlock(&wdt_lock);
+	atomic_io_modify(wdt_reg + TIMER_CTRL, WDT_EN, 0);
 	return 0;
 }
 
 static unsigned int orion_wdt_get_timeleft(struct watchdog_device *wdt_dev)
 {
-	unsigned int time_left;
-
-	spin_lock(&wdt_lock);
-	time_left = readl(wdt_reg + WDT_VAL) / wdt_tclk;
-	spin_unlock(&wdt_lock);
-
-	return time_left;
+	return readl(wdt_reg + WDT_VAL) / wdt_tclk;
 }
 
 static int orion_wdt_set_timeout(struct watchdog_device *wdt_dev,
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
