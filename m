From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 6/9] arm64: dts: rockchip: introduce pclk_vio_grf in eDP device node
Date: Wed,  9 Nov 2016 21:21:58 +0800
Message-ID: <1478697721-2323-7-git-send-email-wxt@rock-chips.com>
References: <1478697721-2323-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478697721-2323-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: eddie.cai@rock-chips.com, tfiga@chromium.org, Yakir Yang <ykk@rock-chips.com>, Caesar Wang <wxt@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, David Wu <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org, zhangqing <zhangqing@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, linux-rockchip@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Yakir Yang <ykk@rock-chips.com>

The pclk_vio_grf supply power for VIO GRF IOs, if it is disabled, driver
would failed to operate the VIO GRF registers.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 6544910..74deb44 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1356,8 +1356,8 @@
 		compatible = "rockchip,rk3399-edp";
 		reg = <0x0 0xff970000 0x0 0x8000>;
 		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru PCLK_EDP>, <&cru PCLK_EDP_CTRL>;
-		clock-names = "dp", "pclk";
+		clocks = <&cru PCLK_EDP>, <&cru PCLK_EDP_CTRL>, <&cru PCLK_VIO_GRF>;
+		clock-names = "dp", "pclk", "grf";
 		resets = <&cru SRST_P_EDP_CTRL>;
 		reset-names = "dp";
 		rockchip,grf = <&grf>;
-- 
2.7.4
