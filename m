From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v4 0/3] pinctrl: bcm2835: Add generic pinctrl support
Date: Fri,  9 Mar 2018 13:13:57 -0400
Message-ID: <1520615640-9153-1-git-send-email-matheus@castello.eng.br>
References: <483687035.384686.1520596004410@email.1und1.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <483687035.384686.1520596004410@email.1und1.de>
Sender: linux-kernel-owner@vger.kernel.org
To: stefan.wahren@i2se.com, eric@anholt.net
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

This series adds support for generic binding for pinctrl bcm2835 driver,
and add the code for set output buffer of a pin using the output-low and
output-high generic properties.

Tested on Raspberry Pi Zero W, based on bcm2835 SoC.

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

 drivers/pinctrl/bcm/Kconfig                        |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              | 92 ++++++++++++++--------
 .../bindings/pinctrl/brcm,bcm2835-gpio.txt         | 19 +++++
 3 files changed, 79 insertions(+), 33 deletions(-)

-- 
2.7.4
