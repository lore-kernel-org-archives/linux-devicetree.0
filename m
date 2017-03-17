From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 2/3] arm64: dts: rockchip: add i2s nodes support for RK3368
 SoCs
Date: Fri, 17 Mar 2017 11:32:43 +0800
Message-ID: <1489721564-32203-3-git-send-email-jay.xu@rock-chips.com>
References: <1489721564-32203-1-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1489721564-32203-1-git-send-email-jay.xu@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, heiko@sntech.de, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

I2S of RK3368 SoCs keep same as RK3066 SoCs found on Rockchip,
add nodes to support them.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
changes since v1:
- fix compile error caused by dumplicate label 'i2s1'


 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index c9be1b2..74fbcc2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -715,6 +715,30 @@
 		interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	i2s_2ch: i2s-2ch@ff890000 {
+		compatible = "rockchip,rk3368-i2s", "rockchip,rk3066-i2s";
+		reg = <0x0 0xff890000 0x0 0x1000>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		dmas = <&dmac_bus 6>, <&dmac_bus 7>;
+		dma-names = "tx", "rx";
+		clock-names = "i2s_clk", "i2s_hclk";
+		clocks = <&cru SCLK_I2S_2CH>, <&cru HCLK_I2S_2CH>;
+		status = "disabled";
+	};
+
+	i2s_8ch: i2s-8ch@ff898000 {
+		compatible = "rockchip,rk3368-i2s", "rockchip,rk3066-i2s";
+		reg = <0x0 0xff898000 0x0 0x1000>;
+		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+		dmas = <&dmac_bus 0>, <&dmac_bus 1>;
+		dma-names = "tx", "rx";
+		clock-names = "i2s_clk", "i2s_hclk";
+		clocks = <&cru SCLK_I2S_8CH>, <&cru HCLK_I2S_8CH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s_8ch_bus>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@ffb71000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
@@ -917,6 +941,20 @@
 			};
 		};
 
+		i2s {
+			i2s_8ch_bus: i2s-8ch-bus {
+				rockchip,pins = <2 12 RK_FUNC_1 &pcfg_pull_none>,
+						<2 13 RK_FUNC_1 &pcfg_pull_none>,
+						<2 14 RK_FUNC_1 &pcfg_pull_none>,
+						<2 15 RK_FUNC_1 &pcfg_pull_none>,
+						<2 16 RK_FUNC_1 &pcfg_pull_none>,
+						<2 17 RK_FUNC_1 &pcfg_pull_none>,
+						<2 18 RK_FUNC_1 &pcfg_pull_none>,
+						<2 19 RK_FUNC_1 &pcfg_pull_none>,
+						<2 20 RK_FUNC_1 &pcfg_pull_none>;
+			};
+		};
+
 		pwm0 {
 			pwm0_pin: pwm0-pin {
 				rockchip,pins = <3 8 RK_FUNC_2 &pcfg_pull_none>;
-- 
1.9.1
