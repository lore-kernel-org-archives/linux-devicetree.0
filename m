From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 10/13] clocksource/drivers/rockchip_timer: implement loading 64bit value into timer
Date: Tue, 29 Nov 2016 16:45:15 +0300
Message-ID: <1480427118-5126-11-git-send-email-al.kochet@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
 <1480427118-5126-1-git-send-email-al.kochet@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480427118-5126-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clocksource/rockchip_timer.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/rockchip_timer.c b/drivers/clocksource/rockchip_timer.c
index 61c3bb1..c2b0454 100644
--- a/drivers/clocksource/rockchip_timer.c
+++ b/drivers/clocksource/rockchip_timer.c
@@ -63,11 +63,13 @@ static inline void rk_timer_enable(struct rk_timer *timer, u32 flags)
 	writel_relaxed(TIMER_ENABLE | flags, timer->ctrl);
 }
 
-static void rk_timer_update_counter(unsigned long cycles,
-				    struct rk_timer *timer)
+static void rk_timer_update_counter(u64 cycles, struct rk_timer *timer)
 {
-	writel_relaxed(cycles, timer->base + TIMER_LOAD_COUNT0);
-	writel_relaxed(0, timer->base + TIMER_LOAD_COUNT1);
+	u32 lower = cycles & 0xFFFFFFFF;
+	u32 upper = (cycles >> 32) & 0xFFFFFFFF;
+
+	writel_relaxed(lower, timer->base + TIMER_LOAD_COUNT0);
+	writel_relaxed(upper, timer->base + TIMER_LOAD_COUNT1);
 }
 
 static void rk_timer_interrupt_clear(struct rk_timer *timer)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
