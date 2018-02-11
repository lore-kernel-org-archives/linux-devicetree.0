From: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/7] watchdog: sama5d4: make use of timeout-secs provided in devicetree
Date: Sun, 11 Feb 2018 21:08:41 +0100
Message-ID: <20180211200847.25000-1-marcus.folkesson@gmail.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

watchdog_init_timeout() will allways pick timeout_param since it
defaults to a valid timeout.

Following best practice described in
Documentation/watchdog/watchdog-kernel-api.txt to make use of
the parameter logic.

Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Notes:
    v3:
    	- Use wdd->timeout instead of wdt_timeout when print out
    	  timout in probe function.

 drivers/watchdog/sama5d4_wdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index 0ae947c3d7bc..255169916dbb 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -33,7 +33,7 @@ struct sama5d4_wdt {
 	unsigned long		last_ping;
 };
 
-static int wdt_timeout = WDT_DEFAULT_TIMEOUT;
+static int wdt_timeout;
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
 module_param(wdt_timeout, int, 0);
@@ -212,7 +212,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	wdd = &wdt->wdd;
-	wdd->timeout = wdt_timeout;
+	wdd->timeout = WDT_DEFAULT_TIMEOUT;
 	wdd->info = &sama5d4_wdt_info;
 	wdd->ops = &sama5d4_wdt_ops;
 	wdd->min_timeout = MIN_WDT_TIMEOUT;
@@ -273,7 +273,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, wdt);
 
 	dev_info(&pdev->dev, "initialized (timeout = %d sec, nowayout = %d)\n",
-		 wdt_timeout, nowayout);
+		 wdd->timeout, nowayout);
 
 	return 0;
 }
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
