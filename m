From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v4 04/20] arm64: dts: hi3660: add resources for clock and reset
Date: Thu, 15 Jun 2017 11:04:01 +0800
Message-ID: <20170615030417.14059-5-guodong.xu@linaro.org>
References: <20170615030417.14059-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615030417.14059-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hw.wangxiaoyin@hisilicon.com, Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Zhangfei Gao <zhangfei.gao@linaro.org>

Add some resource nodes for clock and reset

Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 53 +++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 3983086..f55710a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/hi3660-clock.h>
 
 / {
 	compatible = "hisilicon,hi3660";
@@ -141,18 +142,56 @@
 		#size-cells = <2>;
 		ranges;
 
-		fixed_uart5: fixed_19_2M {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <19200000>;
-			clock-output-names = "fixed:uart5";
+		crg_ctrl: crg_ctrl@fff35000 {
+			compatible = "hisilicon,hi3660-crgctrl", "syscon";
+			reg = <0x0 0xfff35000 0x0 0x1000>;
+			#clock-cells = <1>;
 		};
 
-		uart5: uart@fdf05000 {
+		crg_rst: crg_rst_controller {
+			compatible = "hisilicon,hi3660-reset";
+			#reset-cells = <2>;
+			hisi,rst-syscon = <&crg_ctrl>;
+		};
+
+
+		pctrl: pctrl@e8a09000 {
+			compatible = "hisilicon,hi3660-pctrl", "syscon";
+			reg = <0x0 0xe8a09000 0x0 0x2000>;
+			#clock-cells = <1>;
+		};
+
+		pmuctrl: crg_ctrl@fff34000 {
+			compatible = "hisilicon,hi3660-pmuctrl", "syscon";
+			reg = <0x0 0xfff34000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		sctrl: sctrl@fff0a000 {
+			compatible = "hisilicon,hi3660-sctrl", "syscon";
+			reg = <0x0 0xfff0a000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		iomcu: iomcu@ffd7e000 {
+			compatible = "hisilicon,hi3660-iomcu", "syscon";
+			reg = <0x0 0xffd7e000 0x0 0x1000>;
+			#clock-cells = <1>;
+
+		};
+
+		iomcu_rst: reset {
+			compatible = "hisilicon,hi3660-reset";
+			hisi,rst-syscon = <&iomcu>;
+			#reset-cells = <2>;
+		};
+
+		uart5: serial@fdf05000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xfdf05000 0x0 0x1000>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&fixed_uart5 &fixed_uart5>;
+			clocks = <&crg_ctrl HI3660_CLK_GATE_UART5>,
+				 <&crg_ctrl HI3660_CLK_GATE_UART5>;
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
-- 
2.10.2
