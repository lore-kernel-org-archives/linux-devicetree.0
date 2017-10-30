From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/2] gpio: Generalise state persistence (was: Expose reset tolerance capability)
Date: Mon, 30 Oct 2017 16:52:16 +1030
Message-ID: <20171030062218.27005-1-andrew@aj.id.au>
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
RFC[2]. The only change in v2 is to rename the new pinconf property to convey
the concept of state persistence rather focussing on reset tolerance, based on
feedback from Charles Keepax[3].

Please review!

Andrew

[1] https://www.spinics.net/lists/devicetree/msg200027.html
[2] https://www.spinics.net/lists/devicetree/msg199559.html
[3] https://www.spinics.net/lists/devicetree/msg200040.html

Andrew Jeffery (2):
  gpio: gpiolib: Generalise state persistence beyond sleep
  gpio: aspeed: Add support for reset tolerance

 drivers/gpio/gpio-aspeed.c              | 39 ++++++++++++++++++++--
 drivers/gpio/gpiolib-of.c               |  6 ++--
 drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
 drivers/gpio/gpiolib.c                  | 58 ++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h                  |  2 +-
 include/dt-bindings/gpio/gpio.h         |  6 ++--
 include/linux/gpio/consumer.h           |  8 +++++
 include/linux/gpio/machine.h            |  4 +--
 include/linux/of_gpio.h                 |  2 +-
 include/linux/pinctrl/pinconf-generic.h |  2 ++
 10 files changed, 121 insertions(+), 20 deletions(-)

-- 
2.11.0

