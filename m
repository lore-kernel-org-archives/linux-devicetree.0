From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 0/4] pinctrl: aspeed: Implement remaining pins
Date: Tue,  6 Dec 2016 14:11:48 +1100
Message-ID: <20161206031152.3004-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

This is v3 of the series implementing the remainder of the pinmux tables for
the AST2400 and AST2500 SoCs. v2 of the series can be found here:

    https://lkml.org/lkml/2016/11/2/263

Cheers,

Andrew

Significant changes since v2:

* The fix for touching bit SCU90[6] has been applied, so the patch has been
  dropped.
* The MFD devicetree bindings patches have been split out into their own
  series: https://lkml.org/lkml/2016/12/5/835
* Rework the "Read and write bits in LPC and GFX controllers" patch so that the
  changes are backwards compatible with existing devicetrees. This will lead to
  limited functionality, but no more limited than what systems with those
  devicetrees already experience.
* A fix for the kerneldoc return value descriptions

Significant changes since v1:

* Fixes from v1 have been applied, so have been dropped for v2
* A new fix has appeared, "pinctrl-aspeed-g5: Never set SCU90[6]", as noted
  above
* New bindings documents for the SoC Display and LPC Host Controllers, driven
  by the patch "pinctrl: aspeed: Read and write bits in LPCHC and GFX
  controllers"
* The v1 patch "pinctrl: aspeed: Enable capture of off-SCU pinmux state" has
  been significantly reworked and is now titled "pinctrl: aspeed: Read and
  write bits in LPCHC and GFX controllers"

Andrew Jeffery (4):
  pinctrl: aspeed: Read and write bits in LPC and GFX controllers
  pinctrl: aspeed-g4: Add mux configuration for all pins
  pinctrl: aspeed-g5: Add mux configuration for all pins
  pinctrl: aspeed: Fix kerneldoc return descriptions

 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   86 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1115 +++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 1524 +++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  165 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |   33 +-
 5 files changed, 2799 insertions(+), 124 deletions(-)

-- 
2.9.3

