From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v3 0/3] add thermal driver for h6
Date: Sat, 25 May 2019 14:13:26 -0400
Message-ID: <20190525181329.18657-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, davem@davemloft.net, mchehab+samsung@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset add support for H6 thermal sensor.

BWY, do a cleanup in thermal makfile.

Yangtao Li (3):
  thermal: sun8i: add thermal driver for h6
  dt-bindings: thermal: add binding document for h6 thermal controller
  thermal: fix indentation in makefile

 .../bindings/thermal/sun8i-thermal.yaml       |  71 +++
 MAINTAINERS                                   |   7 +
 drivers/thermal/Kconfig                       |  14 +
 drivers/thermal/Makefile                      |   9 +-
 drivers/thermal/sun8i_thermal.c               | 437 ++++++++++++++++++
 5 files changed, 534 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-thermal.yaml
 create mode 100644 drivers/thermal/sun8i_thermal.c

---
v3:
-Add a sun8i prefix to some function
-Remove disable callback and rename enable to init
-Remove clock enable, calibration from init callback
-Convert driver to interrupt based
-Convert doc to yaml file
---
2.17.0
