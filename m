From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 0/3] gpio: lpc32xx: enable interrupts for port 3
Date: Wed, 10 Apr 2019 12:39:23 +0200
Message-ID: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi,

This series enables interrupt support for GPIOs on port 3. Those are the
GPIOs that are connected directl to an interrupt controller (sic1 or
sic2). This was tested on a custom LPC3250 design.

The binding includes support for interrupts on port 0 and port 1 but
this requires the registration of a proper irqchip and I don't have any
way to test it.

Patch 1 and 2 should probably go through the gpio tree while patch 3
should go through arm-soc. They are quite independant and this shoud
cause no issue.

Alexandre Belloni (3):
  dt-bindings: gpio: lpc32xx: document interrupt bindings
  gpio: lpc32xx: enable interrupt lookup for port 3
  ARM: dts: lpc32xx: add GPIO interrupts

 .../devicetree/bindings/gpio/gpio_lpc32xx.txt |  4 +++
 arch/arm/boot/dts/lpc32xx.dtsi                | 25 +++++++++++++++++++
 drivers/gpio/gpio-lpc32xx.c                   | 14 ++++-------
 3 files changed, 34 insertions(+), 9 deletions(-)

-- 
2.20.1
