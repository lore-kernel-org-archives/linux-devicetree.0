From: Andreas Larsson <andreas@gaisler.com>
Subject: [PATCH v6 0/2] gpio: Add device driver for GRGPIO cores
Date: Wed, 17 Apr 2013 14:36:49 +0200
Message-ID: <1366202211-6743-1-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

Changes since v5:
- register accesses via base + constant
- no base irq number from device tree
- no empty irq-handler in patch 1
- change multi line comment style
- no talk of "virtual" irq or virq
- better description of the situation with irqs and underlying irqs
- add missing lock in irq-handler
- add warning printout in irq-handler if no gpio line matches irq

Andreas Larsson (2):
  gpio: grgpio: Add device driver for GRGPIO cores
  gpio: grgpio: Add irq support

 .../devicetree/bindings/gpio/gpio-grgpio.txt       |   26 +
 drivers/gpio/Kconfig                               |    9 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-grgpio.c                         |  505 ++++++++++++++++++++
 4 files changed, 541 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-grgpio.txt
 create mode 100644 drivers/gpio/gpio-grgpio.c

-- 
1.7.10.4
