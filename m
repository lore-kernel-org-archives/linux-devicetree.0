From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: [PATCH 0/2] clk: stm32: STM32F769 clocks
Date: Fri, 5 Apr 2019 09:53:30 +0200
Message-ID: <20190405075332.28530-1-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: michael turquette <mturquette@baylibre.com>, stephen boyd <sboyd@kernel.org>, rob herring <robh+dt@kernel.org>, mark rutland <mark.rutland@arm.com>, maxime coquelin <mcoquelin.stm32@gmail.com>, alexandre torgue <alexandre.torgue@st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Gabriel Fernandez <gabriel.fernandez@st.com>
List-Id: devicetree@vger.kernel.org

STM32F769 board is a derived of STM32F746 board.
Concerning clocks, main differences are:
- new source clock for SAI1 and SAI2 (HSI or HSE)
- Add DFSDM & DSI clock



Gabriel Fernandez (2):
  clk: stm32: Introduce clocks of STM32F769 board
  ARM: dts: stm32: Enable STM32F769 clock driver

 .../bindings/clock/st,stm32-rcc.txt           |   6 +
 arch/arm/boot/dts/stm32f769-disco.dts         |   4 +
 drivers/clk/clk-stm32f4.c                     | 307 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   7 +-
 4 files changed, 314 insertions(+), 10 deletions(-)

-- 
2.17.1
