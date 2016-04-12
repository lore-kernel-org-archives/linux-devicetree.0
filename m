From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH 0/2 v5] Add AXS10X I2S PLL clock driver
Date: Tue, 12 Apr 2016 10:14:21 +0100
Message-ID: <cover.1460451903.git.joabreu@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, CARLOS.PALMINHA@synopsys.com, Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com, Jose Abreu <Jose.Abreu@synopsys.com>
List-Id: devicetree@vger.kernel.org

The ARC SDP I2S clock can be programmed using a
specific PLL.

This patch series has the goal of adding a clock driver
that programs this PLL.

----

Changes v4 -> v5:
* Documentation update (as suggested by Alexey Brodkin)
* Changed compatible string to "snps,axs10x-i2s-pll-clock" (as suggested by Alexey Brodkin)
* Added DT bindings

Changes v3 -> v4:
* Added binding document (as suggested by Stephen Boyd)
* Minor code style fixes (as suggested by Stephen Boyd)
* Use ioremap (as suggested by Stephen Boyd)
* Implement round_rate (as suggested by Stephen Boyd)
* Change to platform driver (as suggested by Stephen Boyd)
* Use {readl/writel}_relaxed (as suggested by Vineet Gupta)

Changes v2 -> v3:
* Implemented recalc_rate

Changes v1 -> v2:
* Renamed folder to axs10x (as suggested by Alexey Brodkin)
* Added more supported rates

Jose Abreu (2):
  clk/axs10x: Add I2S PLL clock driver
  arc: axs10x: Add DT bindings for I2S PLL Clock

 .../bindings/clock/axs10x-i2s-pll-clock.txt        |  17 ++
 arch/arc/boot/dts/axs10x_mb.dtsi                   |   6 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/axs10x/Makefile                        |   1 +
 drivers/clk/axs10x/i2s_pll_clock.c                 | 217 +++++++++++++++++++++
 5 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
 create mode 100644 drivers/clk/axs10x/Makefile
 create mode 100644 drivers/clk/axs10x/i2s_pll_clock.c

-- 
1.9.1
