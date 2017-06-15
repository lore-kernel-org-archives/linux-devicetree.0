From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v4 13/20] arm64: dts: hi3660: add sp804 timer node
Date: Thu, 15 Jun 2017 11:04:10 +0800
Message-ID: <20170615030417.14059-14-guodong.xu@linaro.org>
References: <20170615030417.14059-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615030417.14059-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com, Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan@linaro.org>

The Hi3660 SoC comes with the sp804 timer in addition to the
architecture timers. These ones are shutdown when reaching a deep idle
states and a backup timer is needed. The sp804 belongs to another power
domain and can fulfill the purpose of replacing temporarily an
architecture timer when the CPU is idle.

Describe it in the device tree, so it can be enabled at boot time.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index a6b91f1..e138973 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -186,6 +186,17 @@
 			#reset-cells = <2>;
 		};
 
+		dual_timer0: timer@fff14000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x0 0xfff14000 0x0 0x1000>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&crg_ctrl HI3660_OSC32K>,
+				 <&crg_ctrl HI3660_OSC32K>,
+				 <&crg_ctrl HI3660_OSC32K>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+		};
+
 		i2c0: i2c@ffd71000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x0 0xffd71000 0x0 0x1000>;
-- 
2.10.2
