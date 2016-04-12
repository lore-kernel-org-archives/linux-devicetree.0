From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH 2/2 v5] arc: axs10x: Add DT bindings for I2S PLL Clock
Date: Tue, 12 Apr 2016 10:14:23 +0100
Message-ID: <2e7f7ffb48ea246cd10f2a9b36f74254c699ba49.1460451903.git.joabreu@synopsys.com>
References: <cover.1460451903.git.joabreu@synopsys.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <cover.1460451903.git.joabreu@synopsys.com>
In-Reply-To: <cover.1460451903.git.joabreu@synopsys.com>
References: <cover.1460451903.git.joabreu@synopsys.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, CARLOS.PALMINHA@synopsys.com, Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com, Jose Abreu <Jose.Abreu@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for AXS10X I2S PLL Clock driver.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
---

This patch was only introduced in v5.

 arch/arc/boot/dts/axs10x_mb.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index ab5d570..227b215 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -16,6 +16,12 @@
 		ranges = <0x00000000 0xe0000000 0x10000000>;
 		interrupt-parent = <&mb_intc>;
 
+		i2sclk: i2sclk@100a0 {
+			compatible = "snps,axs10x-i2s-pll-clock";
+			reg = <0x100a0 0x10>;
+			#clock-cells = <0>;
+		};
+
 		clocks {
 			i2cclk: i2cclk {
 				compatible = "fixed-clock";
-- 
1.9.1


