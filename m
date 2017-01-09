From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH v2] arm64: dts: rockchip: add "rockchip,grf" property for RK3399 PMUCRU/CRU
Date: Mon,  9 Jan 2017 15:02:24 +0800
Message-ID: <1483945344-3125-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: dianders@google.com, linux-rockchip@lists.infradead.org, Xing Zheng <zhengxing@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Caesar Wang <wxt@rock-chips.com>, Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, David Wu <david.wu@rock-chips.com>, William wu <wulf@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The structure rockchip_clk_provider needs to refer the GRF regmap
in somewhere, if the CRU node has not "rockchip,grf" property,
calling syscon_regmap_lookup_by_phandle will return an invalid GRF
regmap, and the MUXGRF type clock will be not supported.

Therefore, we need to add them.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
---

Changes in v2:
- referring pmugrf for PMUGRU
- fix the typo "invaild" in COMMIT message

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 92b731f..a40e6d0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1090,6 +1090,7 @@
 	pmucru: pmu-clock-controller@ff750000 {
 		compatible = "rockchip,rk3399-pmucru";
 		reg = <0x0 0xff750000 0x0 0x1000>;
+		rockchip,grf = <&pmugrf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		assigned-clocks = <&pmucru PLL_PPLL>;
@@ -1099,6 +1100,7 @@
 	cru: clock-controller@ff760000 {
 		compatible = "rockchip,rk3399-cru";
 		reg = <0x0 0xff760000 0x0 0x1000>;
+		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		assigned-clocks =
-- 
2.7.4
