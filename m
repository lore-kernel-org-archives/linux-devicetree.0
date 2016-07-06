From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: support the pmu node for rk3399
Date: Wed,  6 Jul 2016 16:05:57 +0800
Message-ID: <1467792357-9749-3-git-send-email-wxt@rock-chips.com>
References: <1467792357-9749-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467792357-9749-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add to enable the ARM Performance Monitor Units for rk3399.
ARM cores often have a PMU for counting cpu and cache events like cache
misses and hits.

Also, as the Marc posted the patches [0] to support Partitioning per-cpu
interrupts. Let's add this patch to match it on rk3399 SoCs.

[0]:
https://lkml.org/lkml/2016/4/11/182
https://patchwork.kernel.org/patch/9209369/

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
CC: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

---

Changes in v2:
- AS Mark comments on https://patchwork.kernel.org/patch/9209369/
  remove the interrupt-affinity property, we need depend on Marc' perf
  code on https://patchwork.kernel.org/patch/9209369/.

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 8f0a069..4bcd02b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -165,6 +165,16 @@
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 
+	pmu_a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part0>;
+	};
+
+	pmu_a72 {
+		compatible = "arm,cortex-a72-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &part1>;
+	};
+
 	xin24m: xin24m {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -296,6 +306,16 @@
 			msi-controller;
 			reg = <0x0 0xfee20000 0x0 0x20000>;
 		};
+
+		ppi-partitions {
+			part0: interrupt-partition-0 {
+				affinity = <&cpu_l0 &cpu_l1 &cpu_l2 &cpu_l3>;
+			};
+
+			part1: interrupt-partition-1 {
+				affinity = <&cpu_b0 &cpu_b1>;
+			};
+		};
 	};
 
 	i2c1: i2c@ff110000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
