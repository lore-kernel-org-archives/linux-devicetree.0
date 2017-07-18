From: <gabriel.fernandez@st.com>
Subject: [PATCH v6 0/3] clk: stm32h7: Add stm32h743 clock driver
Date: Tue, 18 Jul 2017 09:53:31 +0200
Message-ID: <1500364414-10021-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, Lee Jones <lee.jones@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, gabriel.fernandez@st.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com, gabriel.fernandez.st@gmail.com, Arvind Yadav <arvind.yadav.cs@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

v6:
  - rename clk_gate_is_enabled() in nxp lpc32xx driver.
  - add EXPORT_SYMBOL_GPL(clk_gate_is_enabled)

v5:
  - return bool instead int for enable_power_domain_write_protection()
  - add comment to explain use of CLK_OF_DECLARE_DRIVER()
  - add comment to explain why we can't use read_poll_timeout()
  - expose clk_gate_ops::is_enabled
  - use of __clk_mux_determine_rate & clk_gate_is_enabled to avoid wrapper
	function.

v4:
  - rename lock into stm32rcc_lock
  - don't use clk_readl() 
  - remove useless parentheses with GENMASK
  - fix parents of timer_x clocks
  - suppress pll configuration from DT
  - fix kbuild warning

v3:
  - fix compatible string "stm32h7-pll" into "st,stm32h7-pll"
  - fix bad parent name for mco2 clock
  - set CLK_SET_RATE_PARENT for ltdc clock
  - set CLK_IGNORE_UNUSED for pll1
  - disable power domain write protection on disable ops if needed


v2:
  - rename compatible string "stm32,pll" into "stm32h7-pll"
  - suppress "st,pllrge" property
  - suppress "st, frac-status" property
  - change management of "st,frac"  property
	0 : enable 0 pll integer mode 
	other values : enable pll in fractional mode (value is
	the fractional factor)

Gabriel Fernandez (3):
  clk: nxp: clk-lpc32xx: rename clk_gate_is_enabled()
  clk: gate: expose clk_gate_ops::is_enabled
  clk: stm32h7: Add stm32h743 clock driver

 .../devicetree/bindings/clock/st,stm32h7-rcc.txt   |   81 ++
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-gate.c                             |    3 +-
 drivers/clk/clk-stm32h7.c                          | 1522 ++++++++++++++++++++
 drivers/clk/nxp/clk-lpc32xx.c                      |    4 +-
 include/dt-bindings/clock/stm32h7-clks.h           |  165 +++
 include/dt-bindings/mfd/stm32h7-rcc.h              |  136 ++
 include/linux/clk-provider.h                       |    1 +
 8 files changed, 1910 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
 create mode 100644 drivers/clk/clk-stm32h7.c
 create mode 100644 include/dt-bindings/clock/stm32h7-clks.h
 create mode 100644 include/dt-bindings/mfd/stm32h7-rcc.h

-- 
1.9.1

