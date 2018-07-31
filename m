From: djw@t-chip.com.cn
Subject: [PATCH v4 2/4] arm64: dts: rockchip: add GRF GPIO controller to rk3328
Date: Tue, 31 Jul 2018 13:59:20 +0800
Message-ID: <1533016762-5268-3-git-send-email-djw@t-chip.com.cn>
References: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533016762-5268-1-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Wayne Chou <zxf@t-chip.com.cn>, Levin Du <djw@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, Simon Xue <xxm@rock-chips.com>, David Wu <david.wu@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Rocky Hao <rocky.hao@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Levin Du <djw@t-chip.com.cn>

Adding a GRF GPIO controller labled "grf_gpio" to rk3328, currently
providing access to the GPIO_MUTE pin, which is manupulated by the
GRF_SOC_CON10 register.

The GPIO_MUTE pin is referred to as <&grf_gpio 0>.

Signed-off-by: Levin Du <djw@t-chip.com.cn>

---

Changes in v4:
- Use binding of "rockchip,rk3328-grf-gpio"

Changes in v3:
- Use dedicated "rockchip,rk3328-gpio-mute" driver

Changes in v2:
- Rename gpio_syscon10 to gpio_mute in rk3328.dtsi

Changes in v1:
- Split from V0 and add to rk3328.dtsi for general use.

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 3f5a294..bf5656d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -275,6 +275,12 @@
 			mode-loader = <BOOT_BL_DOWNLOAD>;
 		};
 
+		grf_gpio: grf-gpio {
+			compatible = "rockchip,rk3328-grf-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
 	};
 
 	uart0: serial@ff110000 {
-- 
2.7.4
