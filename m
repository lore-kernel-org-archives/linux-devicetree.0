From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v5 0/3] pinctrl: bcm2835: Add generic pinctrl support
Date: Wed, 11 Apr 2018 00:58:43 -0400
Message-ID: <1523422726-7910-1-git-send-email-matheus@castello.eng.br>
References: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, stefan.wahren@i2se.com, eric@anholt.net
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

This series adds support for generic binding for pinctrl bcm2835 driver,
and add the code for set output buffer of a pin using the output-low and
output-high generic properties.

Tested on Raspberry Pi Zero W, based on bcm2835 SoC.

Changes since v4:
(Suggested by Rob Herring)
- Change dt-bindings docs driver reference to hardware in case the BCM2835 pin
configuration and multiplexing

Changes since v3:
(Suggested by Stefan Wahren)
- Change dt-bindings docs patch order and subject

Changes since v2:
(Suggested by Eric Anholt)
- Remove PACK and UNPACK macros
- Use pinconf_to_config_* functions
(Suggested by Stefan Wahren)
- Fold Kconfig changes with the driver changes in a single patch
- Add devicetree bindings documentations about generic properties support
- Add devicetree bindings maintainers

Matheus Castello (3):
  dt-bindings: pinctrl: bcm2835-gpio: Add generic pinctrl support
  pinctrl: bcm2835: Add support for generic pinctrl binding
  pinctrl: bcm2835: Add support for output-low output-high properties

 .../bindings/pinctrl/brcm,bcm2835-gpio.txt         | 18 +++++
 drivers/pinctrl/bcm/Kconfig                        |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              | 92 ++++++++++++++--------
 3 files changed, 78 insertions(+), 33 deletions(-)

--
2.7.4
