From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 09/13] clocksource/drivers/rockchip_timer: move TIMER_INT_UNMASK out of rk_timer_enable()
Date: Tue, 29 Nov 2016 16:45:14 +0300
Message-ID: <1480427118-5126-10-git-send-email-al.kochet@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
 <1480427118-5126-1-git-send-email-al.kochet@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480427118-5126-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This allow to enable timer without enabling interrupts from it.
As that mode will be used in clocksource implementation.

This is refactoring step without functional changes.

Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/rockchip_timer.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/rockchip_timer.c b/drivers/clocksource/rockchip_timer.c
index a17dc61..61c3bb1 100644
--- a/drivers/clocksource/rockchip_timer.c
+++ b/drivers/clocksource/rockchip_timer.c
@@ -60,8 +60,7 @@ static inline void rk_timer_disable(struct rk_timer *timer)
 
 static inline void rk_timer_enable(struct rk_timer *timer, u32 flags)
 {
-	writel_relaxed(TIMER_ENABLE | TIMER_INT_UNMASK | flags,
-		       timer->ctrl);
+	writel_relaxed(TIMER_ENABLE | flags, timer->ctrl);
 }
 
 static void rk_timer_update_counter(unsigned long cycles,
@@ -83,7 +82,8 @@ static inline int rk_timer_set_next_event(unsigned long cycles,
 
 	rk_timer_disable(timer);
 	rk_timer_update_counter(cycles, timer);
-	rk_timer_enable(timer, TIMER_MODE_USER_DEFINED_COUNT);
+	rk_timer_enable(timer, TIMER_MODE_USER_DEFINED_COUNT |
+			       TIMER_INT_UNMASK);
 	return 0;
 }
 
@@ -101,7 +101,7 @@ static int rk_timer_set_periodic(struct clock_event_device *ce)
 
 	rk_timer_disable(timer);
 	rk_timer_update_counter(timer->freq / HZ - 1, timer);
-	rk_timer_enable(timer, TIMER_MODE_FREE_RUNNING);
+	rk_timer_enable(timer, TIMER_MODE_FREE_RUNNING | TIMER_INT_UNMASK);
 	return 0;
 }
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
