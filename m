From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/5 v3] Clocks and resets for Gemini
Date: Mon, 15 May 2017 19:18:13 +0200
Message-ID: <20170515171813.815-1-linus.walleij@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+df@kernel.org>, devicetree@vger.kernel.org
Cc: Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-arm-kernel@lists.infradead.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This attempts to collect the earlier attempts to separately
create and merge clock and reset bindings for the Gemini into
an all-or-nothing patch set with both clocks and resets,
connected directly to the syscon node.

Linus Walleij (5):
  dt-bindings: Augment Gemini for clocks, resets
  reset: Add a Gemini reset controller
  clk: Add Gemini SoC clock controller
  ARM: dts: Add the Gemini reset controller
  ARM: dts: Add clocks to the Gemini SoC

 Documentation/devicetree/bindings/arm/gemini.txt |  24 +-
 arch/arm/boot/dts/gemini.dtsi                    |  31 +-
 drivers/clk/Kconfig                              |   7 +
 drivers/clk/Makefile                             |   1 +
 drivers/clk/clk-gemini.c                         | 357 +++++++++++++++++++++++
 drivers/reset/Kconfig                            |   7 +
 drivers/reset/Makefile                           |   1 +
 drivers/reset/reset-gemini.c                     | 110 +++++++
 include/dt-bindings/clock/cortina,gemini-clock.h |  29 ++
 include/dt-bindings/reset/cortina,gemini-reset.h |  36 +++
 10 files changed, 599 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/clk-gemini.c
 create mode 100644 drivers/reset/reset-gemini.c
 create mode 100644 include/dt-bindings/clock/cortina,gemini-clock.h
 create mode 100644 include/dt-bindings/reset/cortina,gemini-reset.h

-- 
2.9.3

