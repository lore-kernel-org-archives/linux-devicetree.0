From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH] clocksource: moxart: Add AST2500 compatible string
Date: Tue, 16 May 2017 15:58:40 +0800
Message-ID: <20170516075840.23130-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Also clean up space-before-tab issues in the documentation.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt | 5 +++--
 drivers/clocksource/moxart_timer.c                            | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt b/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
index e207c11630af..b6b8b4836d3b 100644
--- a/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
+++ b/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
@@ -3,8 +3,9 @@ MOXA ART timer
 Required properties:
 
 - compatible : Must be one of:
- 	- "moxa,moxart-timer"
- 	- "aspeed,ast2400-timer"
+	- "moxa,moxart-timer"
+	- "aspeed,ast2400-timer"
+	- "aspeed,ast2500-timer"
 - reg : Should contain registers location and length
 - interrupts : Should contain the timer interrupt number
 - clocks : Should contain phandle for the clock that drives the counter
diff --git a/drivers/clocksource/moxart_timer.c b/drivers/clocksource/moxart_timer.c
index 7f3430654fbd..b6fa319396c1 100644
--- a/drivers/clocksource/moxart_timer.c
+++ b/drivers/clocksource/moxart_timer.c
@@ -253,4 +253,5 @@ static int __init moxart_timer_init(struct device_node *node)
 	return ret;
 }
 CLOCKSOURCE_OF_DECLARE(moxart, "moxa,moxart-timer", moxart_timer_init);
-CLOCKSOURCE_OF_DECLARE(aspeed, "aspeed,ast2400-timer", moxart_timer_init);
+CLOCKSOURCE_OF_DECLARE(ast2400, "aspeed,ast2400-timer", moxart_timer_init);
+CLOCKSOURCE_OF_DECLARE(ast2500, "aspeed,ast2500-timer", moxart_timer_init);
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
