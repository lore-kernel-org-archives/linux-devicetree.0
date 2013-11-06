From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Fwd: [PATCH 3/8] watchdog: davinci: add GET_TIMELEFT option support
Date: Wed, 6 Nov 2013 13:31:59 +0200
Message-ID: <527A28AF.9040308@ti.com>
References: <1383680783-12114-4-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383680783-12114-4-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, the davinci watchdog can be read while counting,
so we can add ability to report the remaining time before
the system will reboot.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---
 drivers/watchdog/davinci_wdt.c |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
index 1fc2093..6cbf2e1 100644
--- a/drivers/watchdog/davinci_wdt.c
+++ b/drivers/watchdog/davinci_wdt.c
@@ -117,6 +117,33 @@ static int davinci_wdt_ping(struct watchdog_device *wdd)
 	return 0;
 }
 
+static unsigned int davinci_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	u64 timer_counter;
+	unsigned long freq;
+	u32 val;
+	struct davinci_wdt_device *davinci_wdt = watchdog_get_drvdata(wdd);
+
+	/* if timeout is occured then return 0 */
+	val = ioread32(davinci_wdt->base + WDTCR);
+	if (val & WDFLAG)
+		return 0;
+
+	freq = clk_get_rate(davinci_wdt->clk);
+
+	if (!freq) {
+		dev_err(wdd->dev, "clock freq is not set\n");
+		return 0;
+	}
+
+	timer_counter = ioread32(davinci_wdt->base + TIM12);
+	timer_counter |= ((u64)ioread32(davinci_wdt->base + TIM34) << 32);
+
+	do_div(timer_counter, freq);
+
+	return wdd->timeout - timer_counter;
+}
+
 static const struct watchdog_info davinci_wdt_info = {
 	.options = WDIOF_KEEPALIVEPING,
 	.identity = "DaVinci Watchdog",
@@ -127,6 +154,7 @@ static const struct watchdog_ops davinci_wdt_ops = {
 	.start		= davinci_wdt_start,
 	.stop		= davinci_wdt_ping,
 	.ping		= davinci_wdt_ping,
+	.get_timeleft	= davinci_wdt_get_timeleft,
 };
 
 static int davinci_wdt_probe(struct platform_device *pdev)
-- 
1.7.9.5



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
