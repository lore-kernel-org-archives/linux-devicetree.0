From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] Fix clock name in Aspeed GPIO bindings and driver
Date: Tue,  8 Aug 2017 15:37:34 +0930
Message-ID: <20170808060736.1917-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, chen@aspeedtech.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hello,

Joel discovered I brain-farted the referenced clock name in the patches
introducing the debounce capability for the Aspeed driver. The datasheet says
PCLK but I wrote HPLL for whatever reason, so clean up that mistake by simply
removing references to HPLL and put the onus on the devicetree author to
get it right.

Cheers,

Andrew

Andrew Jeffery (2):
  dt-bindings: gpio: aspeed: Remove reference to clock name
  gpio: aspeed: Remove reference to clock name in debounce warning
    message

 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 2 +-
 drivers/gpio/gpio-aspeed.c                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.11.0
