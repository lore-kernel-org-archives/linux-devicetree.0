From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 0/7] pinctrl: mcp32s08: add support for mcp23018
Date: Fri,  6 Oct 2017 13:08:04 +0800
Message-ID: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, poeschel@lemonage.de, preid@electromag.com.au, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes from v1:
- rebase as driver moved from gpio to pinctrl
  applied on top of Lars Poeschel <poeschel@lemonage.de> patch to move 
  mcp documentation from gpio to pinctrl.
- Allow manual selection of PINCTRL in KConfig
- Add open-drain config for irq
- remove hardcode irq polarity when register irq
- remove used variables

Phil Reid (7):
  pinctrl: change Kconfig PINCTRL variable to a menuconfig
  dt-bindings: pinctrl: add mcp23018 to mcp23s08 documentation
  gpio: mcp23s08: add support for mcp23018
  dt-bindings: pinctrl: mcp23s08: add documentation for irq-open-drain
  pinctrl: mcp23s08: add open drain configuration for irq pinctrl
  pinctrl: mcp23s08: remove hardcoded irq polarity in irq_setup
  pinctrl: mcp23s08: remove unused variables from pinconf_set

 .../bindings/pinctrl/pinctrl-mcp23s08.txt          |  3 +++
 drivers/pinctrl/Kconfig                            |  9 +++----
 drivers/pinctrl/pinctrl-mcp23s08.c                 | 31 +++++++++++++++-------
 3 files changed, 28 insertions(+), 15 deletions(-)

-- 
1.8.3.1

