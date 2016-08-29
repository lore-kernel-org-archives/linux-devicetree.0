From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: rockchip: Explicitly set pclk_pmu_src on rk3399
Date: Mon, 29 Aug 2016 11:11:24 -0700
Message-ID: <1472494284-11315-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: briannorris@chromium.org, linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com, Douglas Anderson <dianders@chromium.org>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, wxt@rock-chips.com, jay.xu@rock-chips.com, zhangqing@rock-chips.com, david.wu@rock-chips.com, yamada.masahiro@socionext.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On rk3399 we explicitly set ppll in the device tree to 676000000.  The
ppll has one major child, pclk_pmu_src, that is the parent of lots of
other clocks.  Right now nobody is setting that clock rate and we're
relying on the divider to just happen to be something sane.  Let's be
explicit in our request so we're not relying on the firmware.

With the current firmware I tested with this patch has no expected
impact but it's probably good to do anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 62d450935a57..ffb3faa8c176 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -908,8 +908,8 @@
 		reg = <0x0 0xff750000 0x0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-		assigned-clocks = <&pmucru PLL_PPLL>;
-		assigned-clock-rates = <676000000>;
+		assigned-clocks = <&pmucru PLL_PPLL>, <&pmucru PCLK_SRC_PMU>;
+		assigned-clock-rates = <676000000>, <112666667>;
 	};
 
 	cru: clock-controller@ff760000 {
-- 
2.8.0.rc3.226.g39d4020
