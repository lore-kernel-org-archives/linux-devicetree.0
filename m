From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v4 0/6] Lochnagar Driver
Date: Thu, 8 Nov 2018 10:13:59 +0000
Message-ID: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Version 4 of this series the big change here is splitting up
the device tree into having a node for each of the MFD child
drivers. More detailed change logs are given on each patch.

Lee doesn't like the idea of having both mfd_add_devices and
of_platform_populate in the MFD driver. Stephen had asked on a
previous spin to move the fixed clocks out of the clock driver
into device tree and there is a fixed regulator as well that
is specified through device tree. Those require having the
of_platform_populate there which left the only solution being
to move the MFD children into device tree as well.

I have moved the relevant DT settings to be attached to their
respective nodes in DT although I guess another option would
be to leave all the config on the parent node and just use
the child nodes for binding in the drivers, but I decided that
was less consistent with other DT usage. But could switch over
to it if people prefer.

Thanks,
Charles

Charles Keepax (6):
  regulator: lochnagar: Explicitly include register headers
  regulator: lochnagar: Move driver to binding from DT
  mfd: lochnagar: Add initial binding documentation
  mfd: lochnagar: Add support for the Cirrus Logic Lochnagar
  clk: lochnagar: Add support for the Cirrus Logic Lochnagar
  pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar

 .../devicetree/bindings/clock/cirrus,lochnagar.txt |   89 ++
 .../devicetree/bindings/mfd/cirrus,lochnagar.txt   |   70 ++
 .../bindings/pinctrl/cirrus,lochnagar.txt          |  141 +++
 .../bindings/regulator/cirrus,lochnagar.txt        |   80 ++
 MAINTAINERS                                        |   17 +
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-lochnagar.c                        |  360 ++++++
 drivers/mfd/Kconfig                                |    8 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/lochnagar-i2c.c                        |  394 +++++++
 drivers/pinctrl/cirrus/Kconfig                     |   10 +
 drivers/pinctrl/cirrus/Makefile                    |    2 +
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c         | 1145 ++++++++++++++++++++
 drivers/pinctrl/cirrus/pinctrl-lochnagar.h         |  112 ++
 drivers/regulator/lochnagar-regulator.c            |   10 +-
 include/dt-bindings/clk/lochnagar.h                |   26 +
 include/dt-bindings/pinctrl/lochnagar.h            |  132 +++
 include/linux/mfd/lochnagar.h                      |   55 +
 include/linux/mfd/lochnagar1_regs.h                |  157 +++
 include/linux/mfd/lochnagar2_regs.h                |  253 +++++
 21 files changed, 3070 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
 create mode 100644 drivers/clk/clk-lochnagar.c
 create mode 100644 drivers/mfd/lochnagar-i2c.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-lochnagar.c
 create mode 100644 drivers/pinctrl/cirrus/pinctrl-lochnagar.h
 create mode 100644 include/dt-bindings/clk/lochnagar.h
 create mode 100644 include/dt-bindings/pinctrl/lochnagar.h
 create mode 100644 include/linux/mfd/lochnagar.h
 create mode 100644 include/linux/mfd/lochnagar1_regs.h
 create mode 100644 include/linux/mfd/lochnagar2_regs.h

-- 
2.11.0
