Return-Path: <Jose.Abreu@synopsys.com>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [RESEND PATCH 0/2 v6] Add AXS10X I2S PLL clock driver
Date: Mon,  2 May 2016 10:39:04 +0100
Message-Id: <cover.1461258787.git.joabreu@synopsys.com>
To: linux-clk@vger.kernel.org
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The ARC SDP I2S clock can be programmed using a
specific PLL.

This patch series has the goal of adding a clock driver
that programs this PLL.

----

Changes v5 -> v6:
* Use parent clock to determine PLL input rate instead of using hardcoded values
* Documentation update (added 'clocks' field)
* Device tree update (added 'clocks' field)

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

Cc: Carlos Palminha <palminha@synopsys.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

Jose Abreu (2):
  clk/axs10x: Add I2S PLL clock driver
  arc: axs10x: Add DT bindings for I2S PLL Clock

 .../bindings/clock/axs10x-i2s-pll-clock.txt        |  25 +++
 arch/arc/boot/dts/axs10x_mb.dtsi                   |  13 ++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/axs10x/Makefile                        |   1 +
 drivers/clk/axs10x/i2s_pll_clock.c                 | 228 +++++++++++++++++++++
 5 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
 create mode 100644 drivers/clk/axs10x/Makefile
 create mode 100644 drivers/clk/axs10x/i2s_pll_clock.c

-- 
1.9.1
