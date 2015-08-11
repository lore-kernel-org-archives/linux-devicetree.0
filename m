From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 0/5] New Atmel PIO4 pinctrl/gpio driver
Date: Tue, 11 Aug 2015 10:28:00 +0200
Message-ID: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: s.hauer@pengutronix.de, linus.walleij@linaro.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Hi,

The Atmel PIO4 controller has been introduced with SAMA5D2 chip family. This
drivers manages both pinmux/pinconf and gpio stuff. It is inspired by Mediatek
pinctrl driver.

Ludovic Desroches (5):
  pinctrl: introduce driver for Atmel PIO4 controller
  pinctrl: dt-binding: Add DT binding documentation for Atmel PIO4
  MAINTAINERS: Add an entry for pinctrl-at91-pio4
  ARM: at91/dt: sama5d2: add pio controller node
  ARM: at91/defconfig: sama5: add PIO4 controller support

 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |   90 ++
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/sama5d2.dtsi                     |   14 +
 arch/arm/mach-at91/Kconfig                         |    1 +
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-at91-pio4.c                | 1063 ++++++++++++++++++++
 7 files changed, 1189 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-at91-pio4.c

-- 
2.5.0

