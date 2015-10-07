From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [PATCH v4 0/4] ST PLL improvement
Date: Wed,  7 Oct 2015 11:08:55 +0200
Message-ID: <1444208939-10233-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Coquelin <maxime.coquelin@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes in v4:
 - Spinlock affectation was removed unintentionally in clkgen_pll_register()
   since v3

Changes in v3:
 - reorganize patch 1 and 2 to avoid a break git bisect

Changes in v2:
 - Add const for st_pll4600c28_418_a9 structure
 - Use readl_relaxed_poll_timeout macro instead Jiffies
 - Add patch to enable stih418 A9 pll via DT.

This patchset is based on '[PATCH 0/2] ST PLL fixes for 4.3'

Gabriel Fernandez (4):
  drivers: clk: st: Support for enable/disable in Clockgen PLLs
  drivers: clk: st: PLL rate change implementation for DVFS
  drivers: clk: st: Correct the pll-type for A9 for stih418
  ARM: STi: DT: Add support for stih418 A9 pll

 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |   1 +
 arch/arm/boot/dts/stih418-clock.dtsi               |   2 +-
 drivers/clk/st/clkgen-mux.c                        |   3 +
 drivers/clk/st/clkgen-pll.c                        | 469 ++++++++++++++++++++-
 drivers/clk/st/clkgen.h                            |   2 +
 5 files changed, 468 insertions(+), 9 deletions(-)

-- 
1.9.1

