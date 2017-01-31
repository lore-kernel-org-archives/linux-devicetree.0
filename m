From: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 4/5] ARM: dts: rockchip: add timer entries to rk3188 SoC
Date: Tue, 31 Jan 2017 15:43:15 +0300
Message-ID: <1485866596-32254-5-git-send-email-al.kochet@gmail.com>
References: <1485866596-32254-1-git-send-email-al.kochet@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485866596-32254-1-git-send-email-al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huang Tao <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The patch add two timers to all rk3188 based boards.

The first timer is from alive subsystem and it act as a backup
for the local timers at sleep time. It act the same as other
SoC rockchip timers already present in kernel.

The second timer is from CPU subsystem and act as replacement
for the arm-global-timer clocksource and sched clock. It run
at stable frequency 24MHz.

Signed-off-by: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/rk3188.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 31f81b2..0dc52fe 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -106,6 +106,22 @@
 		};
 	};
 
+	timer3: timer@2000e000 {
+		compatible = "rockchip,rk3188-timer", "rockchip,rk3288-timer";
+		reg = <0x2000e000 0x20>;
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TIMER3>, <&cru PCLK_TIMER3>;
+		clock-names = "timer", "pclk";
+	};
+
+	timer6: timer@200380a0 {
+		compatible = "rockchip,rk3188-timer", "rockchip,rk3288-timer";
+		reg = <0x200380a0 0x20>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TIMER6>, <&cru PCLK_TIMER0>;
+		clock-names = "timer", "pclk";
+	};
+
 	i2s0: i2s@1011a000 {
 		compatible = "rockchip,rk3188-i2s", "rockchip,rk3066-i2s";
 		reg = <0x1011a000 0x2000>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
