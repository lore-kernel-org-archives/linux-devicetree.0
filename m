From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/7] clk: at91: rework sckc bindings
Date: Tue, 19 Feb 2019 18:01:53 +0100
Message-ID: <20190219170200.3608-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi,

This is a rework of the sckc DT bindings to avoid warnings with dtc.
DT backward compatibility is kept.

This series also fix a possible issue with the sama5d3 slow RC
oscillator.

The sckc driver changes and documetation can go through the clk tree and
we will handle th DT changes.

Alexandre Belloni (7):
  dt-bindings: clock: at91: new sckc bindings
  clk: at91: modernize sckc binding
  clk: at91: sckc: handle different RC startup time
  ARM: dts: at91: at91sam9x5: switch to new sckc bindings
  ARM: dts: at91: at91sam9g45: switch to new sckc bindings
  ARM: dts: at91: at91sam9rl: switch to new sckc bindings
  ARM: dts: at91: sama5d3: switch to new sckc bindings

 .../devicetree/bindings/clock/at91-clock.txt  |  30 ++--
 arch/arm/boot/dts/at91-wb50n.dtsi             |   2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi            |  25 +---
 arch/arm/boot/dts/at91sam9rl.dtsi             |  25 +---
 arch/arm/boot/dts/at91sam9x5.dtsi             |  23 +--
 arch/arm/boot/dts/sama5d3.dtsi                |  27 +---
 drivers/clk/at91/sckc.c                       | 134 ++++++------------
 7 files changed, 73 insertions(+), 193 deletions(-)

-- 
2.20.1
