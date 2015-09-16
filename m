From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH v2 0/7] New Atmel PIO4 pinctrl/gpio driver
Date: Wed, 16 Sep 2015 17:36:56 +0200
Message-ID: <1442417823-15850-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: s.hauer@pengutronix.de, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Hi,

The Atmel PIO4 controller has been introduced with SAMA5D2 chip family. This
drivers manages both pinmux/pinconf and gpio stuff. It is inspired by Mediatek
pinctrl driver.

Changes from v1:
- remove some unneeded gpio specific ops (gpio_request, gpio_free,
  gpio_request_enable, gpio_disable_free and gpio_set_direction).
- code styling fixes.
- add sama5d2 pin description and device pin muxing.

Ludovic Desroches (7):
  pinctrl: introduce driver for Atmel PIO4 controller
  pinctrl: dt-binding: Add DT binding documentation for Atmel PIO4
  MAINTAINERS: Add an entry for pinctrl-at91-pio4
  ARM: at91/dt: sama5d2: add pio controller node
  ARM: at91/defconfig: sama5: add PIO4 controller support
  ARM: at91/dt: add sama5d2 pinmux
  ARM: at91/dt: sama5d2 Xplained: add device pin muxing

 .../bindings/pinctrl/atmel,at91-pio4-pinctrl.txt   |   90 ++
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |   61 ++
 arch/arm/boot/dts/sama5d2-pinfunc.h                |  880 +++++++++++++++++
 arch/arm/boot/dts/sama5d2.dtsi                     |   14 +
 arch/arm/mach-at91/Kconfig                         |    1 +
 drivers/pinctrl/Kconfig                            |   13 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-at91-pio4.c                | 1017 ++++++++++++++++++++
 9 files changed, 2084 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/sama5d2-pinfunc.h
 create mode 100644 drivers/pinctrl/pinctrl-at91-pio4.c

-- 
2.5.0

