From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 0/5] pinctrl: aspeed: Implement remaining pins
Date: Tue, 20 Dec 2016 18:05:46 +1030
Message-ID: <20161220073551.28522-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

This is v4 of the series implementing the remainder of the pinmux tables for
the AST2400 and AST2500 SoCs. v3 of the series can be found here:

    https://lkml.org/lkml/2016/12/5/847

Cheers,

Andrew

Changes since v3:

* Add a patch fixing the AST2400 SCU compatible strings in the Aspeed pinctrl
  bindings. They are mentioned to define the expectations on the pinctrl node's
  parent and also in the examples to illustrate the relationship.

* Rework the g5 example bindings in patch 2/5 to reflect the LPC/LHC
  bindings[1][2], and fix the SCU compatible string.

[1] https://lkml.org/lkml/2016/12/20/63
[2] https://lkml.org/lkml/2016/12/20/62

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

Andrew Jeffery (5):
  pinctrl: aspeed: dt: Fix compatibles for the System Control Unit
  pinctrl: aspeed: Read and write bits in LPC and GFX controllers
  pinctrl: aspeed-g4: Add mux configuration for all pins
  pinctrl: aspeed-g5: Add mux configuration for all pins
  pinctrl: aspeed: Fix kerneldoc return descriptions

 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  127 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1115 +++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 1524 +++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  165 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |   33 +-
 5 files changed, 2835 insertions(+), 129 deletions(-)

-- 
2.9.3
