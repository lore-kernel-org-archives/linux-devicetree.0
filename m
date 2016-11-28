From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv2 10/11] clocksource/drivers/rockchip_timer: implement reading
 64bit value from timer
Date: Mon, 28 Nov 2016 17:31:25 +0300
Message-ID: <1480343486-25539-11-git-send-email-al.kochet@gmail.com>
References: <1480343486-25539-1-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1480343486-25539-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
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
