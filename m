From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: Add idle-states to device tree for rk3399
Date: Wed,  6 Jul 2016 16:20:54 +0800
Message-ID: <1467793254-10808-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

As the rk3399 ATF had been supported on ARM github [0], so we can add
idle-states for rk3399.
This patch adds idle-states bindings data collected through tests
experiments (latency and energy consumption) on rk3399 evb2 board.

You can see detail idle-states definitions on document [1].

* arm,psci-suspend-param: power_state parameter to pass to the PSCI
  suspend call.
* entry-latency: Worst case latency required to enter the idle state. The
  exit-latency may be guaranteed only after entry-latency has passed.
* min-residency: Minimum period, including preparation and entry, for a
  given idle state to be worthwhile energywise
* min-residency: Minimum period, including preparation and entry, for a
  given idle state to be worthwhile energywise.

[0]:
https://github.com/ARM-software/arm-trusted-firmware
[1]:
Documentation/devicetree/bindings/arm/psci.txt
Documentation/devicetree/bindings/arm/idle-states.txt

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index a6dd623..12ce265 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -101,6 +101,18 @@
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+			cpu_sleep: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <350>;
+				exit-latency-us = <600>;
+				min-residency-us = <1150>;
+			};
+		};
+
 		cpu_l0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
@@ -108,6 +120,7 @@
 			enable-method = "psci";
 			#cooling-cells = <2>; /* min followed by max */
 			clocks = <&cru ARMCLKL>;
+			cpu-idle-states = <&cpu_sleep>;
 		};
 
 		cpu_l1: cpu@1 {
@@ -116,6 +129,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			clocks = <&cru ARMCLKL>;
+			cpu-idle-states = <&cpu_sleep>;
 		};
 
 		cpu_l2: cpu@2 {
@@ -124,6 +138,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			clocks = <&cru ARMCLKL>;
+			cpu-idle-states = <&cpu_sleep>;
 		};
 
 		cpu_l3: cpu@3 {
@@ -132,6 +147,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			clocks = <&cru ARMCLKL>;
+			cpu-idle-states = <&cpu_sleep>;
 		};
 
 		cpu_b0: cpu@100 {
@@ -141,6 +157,7 @@
 			enable-method = "psci";
 			#cooling-cells = <2>; /* min followed by max */
 			clocks = <&cru ARMCLKB>;
+			cpu-idle-states = <&cpu_sleep>;
 		};
 
 		cpu_b1: cpu@101 {
@@ -149,6 +166,7 @@
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			clocks = <&cru ARMCLKB>;
+			cpu-idle-states = <&cpu_sleep>;
 		};
 	};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
