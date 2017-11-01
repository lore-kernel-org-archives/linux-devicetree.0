From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 0/2] gpio: Generalise state persistence
Date: Wed,  1 Nov 2017 15:04:55 +1100
Message-ID: <20171101040457.1200-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com, joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com, ryan_chen@aspeedtech.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hello,

This series provides an API to configure general GPIO state persistence in
gpiolib. Previously, only sleep persistence was considered, but controllers
like one found in Aspeed BMCs also support persistence of state across
controller resets. There is some prior discussion on v1[1] and the initial
RFC[2], and minor comments on v2[3]. v3 addresses minor issues with comments
and debug statements[4], removing remaining references to reset tolerance.

Please review!

Andrew

[1] https://www.spinics.net/lists/devicetree/msg200027.html
[2] https://www.spinics.net/lists/devicetree/msg199559.html
[3] https://www.spinics.net/lists/kernel/msg2635769.html
[4] https://www.spinics.net/lists/devicetree/msg200040.html

Andrew Jeffery (2):
  gpio: gpiolib: Generalise state persistence beyond sleep
  gpio: aspeed: Add support for reset tolerance

 drivers/gpio/gpio-aspeed.c              | 39 +++++++++++++++++++--
 drivers/gpio/gpiolib-of.c               |  6 ++--
 drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
 drivers/gpio/gpiolib.c                  | 61 ++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h                  |  2 +-
 include/dt-bindings/gpio/gpio.h         |  6 ++--
 include/linux/gpio/consumer.h           |  8 +++++
 include/linux/gpio/machine.h            |  4 +--
 include/linux/of_gpio.h                 |  2 +-
 include/linux/pinctrl/pinconf-generic.h |  2 ++
 10 files changed, 124 insertions(+), 20 deletions(-)

-- 
2.11.0

