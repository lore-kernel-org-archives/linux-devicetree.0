From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: [PATCH 0/2] get pinctrl more flexible for per pin muxing controllers
Date: Mon, 4 May 2015 10:56:12 +0200
Message-ID: <1430729776-27797-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org, nicolas.ferre@atmel.com, Ludovic Desroches <ludovic.desroches@atmel.com>
List-Id: devicetree@vger.kernel.org

Hi,

The way pins, groups and functions are tied is too constraining for some
controllers. It concerns mainly the ones we don't care about groups and
functions, each pin can be muxed to any functions.
The goal of these two patches is too remove some of the constraints.

I have added the prototype of a pin controller and device tree to show the
way I want to use these changes. I couldn't test it on boards using generic
pinconf so I am not sure that I don't break something...


Ludovic Desroches (4):
  pinctrl: change function behavior for per pin muxing controllers
  pinctrl: introduce complex pin description
  pinctrl: rough draft for a future controller
  ARM: at91/dt: proto dt

 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/at91-sama5d4ek_proto.dts | 243 ++++++++++
 arch/arm/boot/dts/sama5d4_proto-pinfunc.h  | 463 +++++++++++++++++++
 arch/arm/boot/dts/sama5d4_proto.dtsi       | 716 +++++++++++++++++++++++++++++
 drivers/pinctrl/Kconfig                    |  10 +
 drivers/pinctrl/Makefile                   |   1 +
 drivers/pinctrl/pinconf-generic.c          |  44 +-
 drivers/pinctrl/pinctrl-at91-pio4.c        | 625 +++++++++++++++++++++++++
 drivers/pinctrl/pinmux.c                   |  58 +--
 include/linux/pinctrl/pinctrl.h            |   6 +
 include/linux/pinctrl/pinmux.h             |   3 +
 11 files changed, 2134 insertions(+), 36 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sama5d4ek_proto.dts
 create mode 100644 arch/arm/boot/dts/sama5d4_proto-pinfunc.h
 create mode 100644 arch/arm/boot/dts/sama5d4_proto.dtsi
 create mode 100644 drivers/pinctrl/pinctrl-at91-pio4.c

-- 
2.2.0

