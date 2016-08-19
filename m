From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 0/8] aspeed: Add pinctrl and gpio drivers
Date: Fri, 19 Aug 2016 22:14:06 +0930
Message-ID: <20160819124414.24242-1-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

Hi all,

Here's v2 of the Aspeed pinctrl and gpio driver patches, which aims to address
the review comments on v1:

  https://lkml.org/lkml/2016/7/20/69 

There are some additional changes which are either to fix bugs with some signal
descriptor values or to support additional mux functions. Further, the series
has been split in two, into driver and SoC changes.

The combined series has been tested with both the AST2400 (g4) and AST2500 (g5)
SoCs on OpenPOWER Palmetto and Aspeed AST2500 EVB machines respectively, and
similarly in QEMU with the palmetto-bmc and ast2500-evb machines[1].

Cheers,

Andrew

[1] https://lists.gnu.org/archive/html/qemu-arm/2016-08/msg00019.html

Since v1:

* Split the series in two: driver and SoC patches.
* Update devicetree bindings documentation
* Add documentation for aspeed pinctrl core functions
* Fix bugs in existing signal descriptors
* Add a number of pin and mux function declarations
* Provide debug information on unexpected conditions

---

Andrew Jeffery (7):
  MAINTAINERS: Add glob for Aspeed devicetree bindings
  syscon: dt-bindings: Add documentation for Aspeed system control units
  pinctrl: dt-bindings: Add documentation for Aspeed pin controllers
  gpio: dt-bindings: Add documentation for Aspeed GPIO controllers
  pinctrl: Add core support for Aspeed SoCs
  pinctrl: Add pinctrl-aspeed-g4 driver
  pinctrl: Add pinctrl-aspeed-g5 driver

Joel Stanley (1):
  gpio: Add Aspeed driver

 .../devicetree/bindings/gpio/gpio-aspeed.txt       |   34 +
 .../devicetree/bindings/mfd/aspeed-scu.txt         |   18 +
 .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   65 ++
 MAINTAINERS                                        |    2 +
 drivers/gpio/Kconfig                               |    7 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-aspeed.c                         |  457 ++++++++
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/aspeed/Kconfig                     |   24 +
 drivers/pinctrl/aspeed/Makefile                    |    6 +
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         | 1231 ++++++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  808 +++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  501 ++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  569 +++++++++
 15 files changed, 3725 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-scu.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
 create mode 100644 drivers/gpio/gpio-aspeed.c
 create mode 100644 drivers/pinctrl/aspeed/Kconfig
 create mode 100644 drivers/pinctrl/aspeed/Makefile
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed.c
 create mode 100644 drivers/pinctrl/aspeed/pinctrl-aspeed.h

-- 
2.9.3

