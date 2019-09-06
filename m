From: Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PATCH v3 0/5] Add ast2600 gpio support
Date: Fri,  6 Sep 2019 16:25:10 +1000
Message-ID: <20190906062510.13191-1-rashmica.g@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Rashmica Gupta <rashmica.g@gmail.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
        SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
        SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

v3: Different ordering of patches, using ngpio property to distinguish between
the two ast2600 gpio controllers, fixed typos of 3.6V.

v2: More verbose commit messages, using DIV_ROUND_UP().

Rashmica Gupta (5):
  dt-bindings: gpio: aspeed: Update documentation with ast2600
    controllers
  gpio/aspeed: Fix incorrect number of banks
  gpio/aspeed: Setup irqchip dynamically
  gpios: Use ngpio property from device tree if available
  gpio: Add in ast2600 details to Aspeed driver

 drivers/gpio/gpio-aspeed.c                    | 52 ++++++++++++-------
 .../devicetree/bindings/gpio/gpio-aspeed.txt  |  7 ++-
 2 files changed, 39 insertions(+), 20 deletions(-)

-- 
2.20.1
