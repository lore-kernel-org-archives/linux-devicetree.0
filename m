From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/7] clk: at91: add sam9x60 pmc clock support
Date: Wed, 20 Feb 2019 12:25:58 +0100
Message-ID: <20190220112605.23095-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

This series add support for the sam9x60 clocks handled by the PMC.

The first four patches are preparatory patches to handle register layout
and offset differences. Then, a driver for the new interface for PLLs is
added and the final patch is the driver for the sam9x60 PMC.

Alexandre Belloni (7):
  clk: at91: allow configuring peripheral PCR layout
  clk: at91: allow configuring generated PCR layout
  clk: at91: usb: Add sam9x60 support
  clk: at91: master: Add sam9x60 support
  clk: at91: add sam9x60 PLL driver
  dt-bindings: clk: at91: add bindings for SAM9X60 pmc
  clk: at91: add sam9x60 pmc driver

 .../devicetree/bindings/clock/at91-clock.txt  |   3 +-
 drivers/clk/at91/Makefile                     |   2 +
 drivers/clk/at91/at91sam9x5.c                 |   9 +
 drivers/clk/at91/clk-generated.c              |  48 +--
 drivers/clk/at91/clk-master.c                 |   8 +-
 drivers/clk/at91/clk-peripheral.c             |  46 +--
 drivers/clk/at91/clk-sam9x60-pll.c            | 329 ++++++++++++++++++
 drivers/clk/at91/clk-usb.c                    |  33 +-
 drivers/clk/at91/dt-compat.c                  |  12 +-
 drivers/clk/at91/pmc.h                        |  23 ++
 drivers/clk/at91/sam9x60.c                    | 307 ++++++++++++++++
 drivers/clk/at91/sama5d2.c                    |  10 +
 drivers/clk/at91/sama5d4.c                    |   8 +
 include/linux/clk/at91_pmc.h                  |  12 +-
 14 files changed, 785 insertions(+), 65 deletions(-)
 create mode 100644 drivers/clk/at91/clk-sam9x60-pll.c
 create mode 100644 drivers/clk/at91/sam9x60.c

-- 
2.20.1
