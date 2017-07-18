From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/4] pinctrl: Add USB support for Aspeed SoCs
Date: Tue, 18 Jul 2017 14:54:49 +0930
Message-ID: <20170718052453.14316-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, benh@kernel.crashing.org, ryan_chen@aspeedtech.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hello,

Here's v2 of the Aspeed pinctrl USB patches. It addresses the minor feedback on
the original series[1], amounting to commit message changes for the bindings
patches.

[1] https://lkml.org/lkml/2017/6/26/854

Please review!

Cheers,

Andrew

Andrew Jeffery (4):
  dt-bindings: pinctrl: aspeed: Add g4 USB functions
  dt-bindings: pinctrl: aspeed: Add g5 USB functions
  pinctrl: aspeed: g4: Add USB device and host support
  pinctrl: aspeed: g5: Add USB device and host support

 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  8 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 66 +++++++++++++++++++---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         | 58 ++++++++++++++++++-
 3 files changed, 121 insertions(+), 11 deletions(-)

-- 
2.11.0

