From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 1/8] dt-bindings: clarify compatible property for rockchip timers
Date: Tue, 24 Jan 2017 15:16:36 +0300
Message-ID: <1485260203-14216-2-git-send-email-al.kochet@gmail.com>
References: <1485260203-14216-1-git-send-email-al.kochet@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485260203-14216-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Make all properties description in form '"rockchip,<chip>-timer",
"rockchip,rk3288-timer"' for all chips found in linux kernel.

Suggested-by: Heiko Stübner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/timer/rockchip,rk-timer.txt           |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
index a41b184..16a5f45 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
@@ -1,9 +1,15 @@
 Rockchip rk timer
 
 Required properties:
-- compatible: shall be one of:
-  "rockchip,rk3288-timer" - for rk3066, rk3036, rk3188, rk322x, rk3288, rk3368
-  "rockchip,rk3399-timer" - for rk3399
+- compatible: should be:
+  "rockchip,rk3036-timer", "rockchip,rk3288-timer": for Rockchip RK3036
+  "rockchip,rk3066-timer", "rockchip,rk3288-timer": for Rockchip RK3066
+  "rockchip,rk3188-timer", "rockchip,rk3288-timer": for Rockchip RK3188
+  "rockchip,rk3228-timer", "rockchip,rk3288-timer": for Rockchip RK3228
+  "rockchip,rk3229-timer", "rockchip,rk3288-timer": for Rockchip RK3229
+  "rockchip,rk3288-timer": for Rockchip RK3288
+  "rockchip,rk3368-timer", "rockchip,rk3288-timer": for Rockchip RK3368
+  "rockchip,rk3399-timer": for Rockchip RK3399
 - reg: base address of the timer register starting with TIMERS CONTROL register
 - interrupts: should contain the interrupts for Timer0
 - clocks : must contain an entry for each entry in clock-names
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
