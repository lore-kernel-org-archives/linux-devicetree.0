From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: add rktimer device node for rk3399
Date: Tue,  7 Jun 2016 12:54:33 +0800
Message-ID: <1465275273-22076-5-git-send-email-wxt@rock-chips.com>
References: <1465275273-22076-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465275273-22076-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, Heiko Stuebner <heiko@sntech.de>
Cc: dianders@chromium.org, briannorris@google.com, smbarber@google.com, linux-rockchip@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, cf@rock-chips.com, huangtao@rock-chips.com, Caesar Wang <wxt@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jianqun Xu <jay.xu@rock-chips.com>, Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Huang Tao <huangtao@rock-chips.com>

Select rktimer0 as broadcast timer.

Signed-off-by: Huang Tao <huangtao@rock-chips.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>
Tested-by: Jianqun Xu <jay.xu@rock-chips.com>

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v2:
- %s/ARM64/arm64.

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index d331e80..f0d1935 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -542,6 +542,14 @@
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	rktimer: rktimer@ff850000 {
+		compatible = "rockchip,rk3399-timer";
+		reg = <0x0 0xff850000 0x0 0x1000>;
+		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER0>, <&cru SCLK_TIMER00>;
+		clock-names = "pclk", "timer";
+	};
+
 	spdif: spdif@ff870000 {
 		compatible = "rockchip,rk3399-spdif";
 		reg = <0x0 0xff870000 0x0 0x1000>;
-- 
1.9.1
