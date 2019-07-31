From: Hongwei Zhang <hongweiz@ami.com>
Subject: [v7 0/2] gpio: aspeed: Add SGPIO driver
Date: Wed, 31 Jul 2019 16:01:35 -0400
Message-ID: <1564603297-1391-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

This short series introduce dt-binding document and a driver for the 
Aspeed AST2500 SGPIO controller. Please review.

[v7]:   Changes between v6 and v7:
        - fix missing variable 'reg' assign issue in aspeed_sgpio_set()
        - v6 feedback updates

[v6]:   Changes between v5 and v6:
        - fix a bug in aspeed_sgpio_dir_out()
        - v5 feedback updates, some comments cleanup

The related SGPM pinmux dt-binding document, dts, and pinctrl driver
updates have been accepted and merged:
_http://patchwork.ozlabs.org/patch/1110210/

Hongwei Zhang (2):
  dt-bindings: gpio: aspeed: Add SGPIO support
  gpio: aspeed: Add SGPIO driver

 .../devicetree/bindings/gpio/sgpio-aspeed.txt      |  55 +++
 drivers/gpio/sgpio-aspeed.c                        | 530 +++++++++++++++++++++
 2 files changed, 585 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
 create mode 100644 drivers/gpio/sgpio-aspeed.c

-- 
2.7.4
