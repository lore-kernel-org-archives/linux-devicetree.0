From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 11/13] clocksource/drivers/rockchip_timer: implement reading 64bit value from timer
Date: Tue, 29 Nov 2016 16:45:16 +0300
Message-ID: <1480427118-5126-12-git-send-email-al.kochet@gmail.com>
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
 drivers/clocksource/rockchip_timer.c |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clocksource/rockchip_timer.c b/drivers/clocksource/rockchip_timer.c
index c2b0454..6224aa9 100644
--- a/drivers/clocksource/rockchip_timer.c
+++ b/drivers/clocksource/rockchip_timer.c
@@ -19,6 +19,8 @@
 
 #define TIMER_LOAD_COUNT0	0x00
 #define TIMER_LOAD_COUNT1	0x04
+#define TIMER_CURRENT_VALUE0	0x08
+#define TIMER_CURRENT_VALUE1	0x0C
 #define TIMER_CONTROL_REG3288	0x10
 #define TIMER_CONTROL_REG3399	0x1c
 #define TIMER_INT_STATUS	0x18
@@ -72,6 +74,25 @@ static void rk_timer_update_counter(u64 cycles, struct rk_timer *timer)
 	writel_relaxed(upper, timer->base + TIMER_LOAD_COUNT1);
 }
 
+static u64 rk_timer_counter_read(struct rk_timer *timer)
+{
+	u64 counter;
+	u32 lower;
+	u32 upper, old_upper;
+
+	upper = readl_relaxed(timer->base + TIMER_CURRENT_VALUE1);
+	do {
+		old_upper = upper;
+		lower = readl_relaxed(timer->base + TIMER_CURRENT_VALUE0);
+		upper = readl_relaxed(timer->base + TIMER_CURRENT_VALUE1);
+	} while (upper != old_upper);
+
+	counter = upper;
+	counter <<= 32;
+	counter |= lower;
+	return counter;
+}
+
 static void rk_timer_interrupt_clear(struct rk_timer *timer)
 {
 	writel_relaxed(1, timer->base + TIMER_INT_STATUS);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
