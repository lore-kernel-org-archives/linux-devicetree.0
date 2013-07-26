From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/2] pinctrl: palmas: add pincontrol driver
Date: Fri, 26 Jul 2013 15:45:52 +0530
Message-ID: <1374833754-19659-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@linaro.org, linus.walleij@linaro.org
Cc: rob.herring@calxeda.com, rob@landley.net, sameo@linux.intel.com, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, gg@slimlogic.co.uk, kishon@ti.com, swarren@nvidia.com, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

This series add the pin control driver for palam device. It add some
common utility APIs in generic pinconf driver.

Laxman Dewangan (2):
  pinctrl: pinconf_generic: add utility functions for add map/configs
  pinctrl: palmas: add pincontrol driver

 .../devicetree/bindings/pinctrl/pinctrl-palmas.txt |   91 ++
 drivers/pinctrl/Kconfig                            |    9 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinconf-generic.c                  |  105 ++
 drivers/pinctrl/pinctrl-palmas.c                   | 1211 ++++++++++++++++++++
 include/linux/mfd/palmas.h                         |   35 +-
 include/linux/pinctrl/pinconf-generic.h            |   52 +
 7 files changed, 1493 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-palmas.txt
 create mode 100644 drivers/pinctrl/pinctrl-palmas.c

