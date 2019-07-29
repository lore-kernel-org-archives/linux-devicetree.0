From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/6] pinctrl: aspeed: Add AST2600 pinmux support
Date: Mon, 29 Jul 2019 15:25:58 +0930
Message-ID: <20190729055604.13239-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds pinmux support for the AST2600. v2 addresses some binding
comments from Rob and has some minor cleanups in the g6 driver implementation.

v1 can be found here:

https://lists.ozlabs.org/pipermail/linux-aspeed/2019-July/001999.html

Please review!

Andrew

Andrew Jeffery (6):
  dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
  pinctrl: aspeed: Rename pin declaration macros
  pinctrl: aspeed: Add PIN_DECL_3() helper
  pinctrl: aspeed: Add multiple pin group support for functions
  pinctrl: aspeed: Add SIG_DESC_CLEAR() helper
  pinctrl: aspeed: Add AST2600 pinmux support

 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |  115 +
 drivers/pinctrl/aspeed/Kconfig                |    8 +
 drivers/pinctrl/aspeed/Makefile               |    1 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c    | 1821 +++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    | 1865 +++++++------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    | 2355 +++++++++++++++++
 drivers/pinctrl/aspeed/pinmux-aspeed.h        |  227 +-
 7 files changed, 4590 insertions(+), 1802 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c

-- 
2.20.1
