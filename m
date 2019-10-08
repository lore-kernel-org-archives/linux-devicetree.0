From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/7] pinctrl: Fixes for AST2600 support
Date: Tue,  8 Oct 2019 15:11:46 +1030
Message-ID: <20191008044153.12734-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, johnny_huang@aspeedtech.com, ryanchen.aspeed@gmail.com
List-Id: devicetree@vger.kernel.org

Hello,

This series resolves several issues found in testing by Johnny Huang from
ASPEED, who also contributed the patches to fix them. We'll have more patches
from him in the near future (which I'm pretty happy about).

The major issue resolved is the way I grouped the eMMC pins. What I had was
ugly and I want to get rid of it before the binding is solidified with the 5.4
release.

The remaining fixes are minor issues that stem from lack of documentation or
understanding on my part, and at least one brain-fart.

Please review!

Andrew

Andrew Jeffery (4):
  dt-bindings: pinctrl: aspeed-g6: Rework SD3 function and groups
  pinctrl: aspeed-g6: Sort pins for sanity
  pinctrl: aspeed-g6: Fix I2C14 SDA description
  pinctrl: aspeed-g6: Make SIG_DESC_CLEAR() behave intuitively

Johnny Huang (3):
  pinctrl: aspeed-g6: Fix I3C3/I3C4 pinmux configuration
  pinctrl: aspeed-g6: Fix UART13 group pinmux
  pinctrl: aspeed-g6: Rename SD3 to EMMC and rework pin groups

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |  86 ++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 124 ++++++++----------
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |   3 +-
 3 files changed, 98 insertions(+), 115 deletions(-)

-- 
2.20.1
