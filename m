From: Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
Date: Thu, 12 Sep 2019 15:59:09 +0800
Message-ID: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andriy.shevchenko@intel.com, qi-ming.wu@intel.com, yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com, Rahul Tanwar <rahul.tanwar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi,

This series is to add pinctrl & GPIO controller driver for a new SoC.
Patch 1 adds pinmux & GPIO controller driver.
Patch 2 adds the dt bindings document & include file.

Patches are against Linux 5.3-rc5 at below Git tree:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git


Rahul Tanwar (2):
  pinctrl: Add pinmux & GPIO controller driver for new SoC
  dt-bindings: pinctrl: intel: Add for new SoC

 .../bindings/pinctrl/intel,lgm-pinctrl.yaml        |  131 ++
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-equilibrium.c              | 1377 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-equilibrium.h              |  194 +++
 include/dt-bindings/pinctrl/intel,equilibrium.h    |   23 +
 6 files changed, 1739 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.h
 create mode 100644 include/dt-bindings/pinctrl/intel,equilibrium.h

-- 
2.11.0
