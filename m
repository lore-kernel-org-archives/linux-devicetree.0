From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 1/2] arm64: dts: rockchip: add "rockchip, grf" property for RK3399 PMUCRU/CRU
Date: Tue, 10 Jan 2017 14:15:29 +0800
Message-ID: <1484028930-20305-2-git-send-email-zhengxing@rock-chips.com>
References: <1484028930-20305-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484028930-20305-1-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The structure rockchip_clk_provider needs to refer the GRF regmap
in somewhere, if the CRU node has not "rockchip,grf" property,
calling syscon_regmap_lookup_by_phandle will return an invalid GRF
regmap, and the MUXGRF type clock will be not supported.

Therefore, we need to add them.

Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v4:
- separte the binding patch

Changes in v3:
- add optional roperty rockchip,grf in rockchip,rk3399-cru.txt

Changes in v2:
- referring pmugrf for PMUGRU
- fix the typo "invaild" in COMMIT message

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index c928015..081621b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1077,6 +1077,7 @@
 	pmucru: pmu-clock-controller@ff750000 {
 		compatible = "rockchip,rk3399-pmucru";
 		reg = <0x0 0xff750000 0x0 0x1000>;
+		rockchip,grf = <&pmugrf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		assigned-clocks = <&pmucru PLL_PPLL>;
@@ -1086,6 +1087,7 @@
 	cru: clock-controller@ff760000 {
 		compatible = "rockchip,rk3399-cru";
 		reg = <0x0 0xff760000 0x0 0x1000>;
+		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		assigned-clocks =
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
