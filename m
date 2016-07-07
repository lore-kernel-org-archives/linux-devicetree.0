From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 05/93] dt-bindings: Document rk3399 rk-timer bindings
Date: Thu,  7 Jul 2016 10:00:38 +0200
Message-ID: <1467878526-1238-5-git-send-email-daniel.lezcano@linaro.org>
References: <577E0BED.3020608@linaro.org>
 <1467878526-1238-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1467878526-1238-1-git-send-email-daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Add a compatible string for rk3399 SoC because the timer is slightly different
from the older SoCs. So rename the file name from rockchip,rk3288-timer.txt to
rockchip,rk-timer.txt and clarify rockchip,rk3288-timer supported SoCs.

Signed-off-by: Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/timer/rockchip,rk-timer.txt  | 20 ++++++++++++++++++++
 .../bindings/timer/rockchip,rk3288-timer.txt         | 18 ------------------
 2 files changed, 20 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/rockchip,rk3288-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
new file mode 100644
index 0000000..a41b184
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.txt
@@ -0,0 +1,20 @@
+Rockchip rk timer
+
+Required properties:
+- compatible: shall be one of:
+  "rockchip,rk3288-timer" - for rk3066, rk3036, rk3188, rk322x, rk3288, rk3368
+  "rockchip,rk3399-timer" - for rk3399
+- reg: base address of the timer register starting with TIMERS CONTROL register
+- interrupts: should contain the interrupts for Timer0
+- clocks : must contain an entry for each entry in clock-names
+- clock-names : must include the following entries:
+  "timer", "pclk"
+
+Example:
+	timer: timer@ff810000 {
+		compatible = "rockchip,rk3288-timer";
+		reg = <0xff810000 0x20>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&xin24m>, <&cru PCLK_TIMER>;
+		clock-names = "timer", "pclk";
+	};
diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk3288-timer.txt b/Documentation/devicetree/bindings/timer/rockchip,rk3288-timer.txt
deleted file mode 100644
index 87f0b00..0000000
--- a/Documentation/devicetree/bindings/timer/rockchip,rk3288-timer.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Rockchip rk3288 timer
-
-Required properties:
-- compatible: shall be "rockchip,rk3288-timer"
-- reg: base address of the timer register starting with TIMERS CONTROL register
-- interrupts: should contain the interrupts for Timer0
-- clocks : must contain an entry for each entry in clock-names
-- clock-names : must include the following entries:
-  "timer", "pclk"
-
-Example:
-	timer: timer@ff810000 {
-		compatible = "rockchip,rk3288-timer";
-		reg = <0xff810000 0x20>;
-		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&xin24m>, <&cru PCLK_TIMER>;
-		clock-names = "timer", "pclk";
-	};
-- 
1.9.1
