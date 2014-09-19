From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 0/2] Driver for 74xx-ICs with MMIO access
Date: Fri, 19 Sep 2014 11:40:02 +0400
Message-ID: <1411112404-16040-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: devicetree@vger.kernel.org

This driver is an attempt to resolve a dispute about adding "generic"
memory-mapped GPIO support for DT:
http://comments.gmane.org/gmane.linux.kernel.gpio/2

Alexander Shiyan (2):
  GPIO: Add driver for 74xx-ICs with MMIO access
  GPIO: 74xx-mmio: Add DT bindings documentation

 .../devicetree/bindings/gpio/gpio-74xx-mmio.txt    |  30 ++++
 drivers/gpio/Kconfig                               |  14 ++
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-74xx-mmio.c                      | 170 +++++++++++++++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
 create mode 100644 drivers/gpio/gpio-74xx-mmio.c

-- 
1.8.5.5

