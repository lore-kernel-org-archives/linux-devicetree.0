Return-Path: <SRS0=5pMM=PL=bootlin.com=thomas.petazzoni@kernel.org>
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/4] Proposal to support pull-up/pull-down GPIO configuration
Date: Thu,  3 Jan 2019 17:40:58 +0100
Message-Id: <20190103164102.31437-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Hello,

As we started discussing in [1], it would be useful to have a way to
configure pull-up/pull-down resistors for simple GPIO controllers that
don't have any pinmuxing capability, and therefore no interaction with
the pinctrl subsystem.

This set of patches implements what I understood of Linus option (2),
i.e extend the ->set_config() callback, and provide additional flags
that can be used in the Device Tree: GPIO_PULL_UP and GPIO_PULL_DOWN.

Let me know what you think about this proposal.

Thanks for your feedback.

Thomas

[1] https://marc.info/?l=linux-gpio&m=154491873506701&w=2

Thomas Petazzoni (4):
  dt-bindings: gpio: document the new pull-up/pull-down flags
  gpio: rename gpio_set_drive_single_ended() to gpio_set_config()
  gpio: add core support for pull-up/pull-down configuration
  gpio: pca953x: add ->set_config implementation

 .../devicetree/bindings/gpio/gpio.txt         |  4 ++
 drivers/gpio/gpio-pca953x.c                   | 59 ++++++++++++++++++-
 drivers/gpio/gpiolib-of.c                     |  5 ++
 drivers/gpio/gpiolib.c                        | 40 ++++++++-----
 drivers/gpio/gpiolib.h                        |  2 +
 include/dt-bindings/gpio/gpio.h               |  6 ++
 include/linux/gpio/machine.h                  |  2 +
 include/linux/of_gpio.h                       |  2 +
 8 files changed, 104 insertions(+), 16 deletions(-)

-- 
2.20.1
