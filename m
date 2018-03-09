From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v3 0/3] pinctrl: bcm2835: Add brcm,level property
Date: Fri,  9 Mar 2018 00:16:11 -0400
Message-ID: <1520568974-15547-1-git-send-email-matheus@castello.eng.br>
References: <5b3419be-12ca-75d7-6f5e-d3338ddd7f14@castello.eng.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b3419be-12ca-75d7-6f5e-d3338ddd7f14@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: stefan.wahren@i2se.com, eric@anholt.net
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

This series adds support for generic binding for pinctrl bcm2835 driver,
and add the code for set output buffer of a pin using the output-low and
output-high generic properties.

Tested on Raspberry Pi Zero W, based on bcm2835 SoC.

Changes since v2:
(Suggested by Eric Anholt)
- Remove PACK and UNPACK macros
- Use pinconf_to_config_* functions
(Suggested by Stefan Wahren)
- Fold Kconfig changes with the driver changes in a single patch
- Add devicetree bindings documentations about generic properties support
- Add devicetree bindings maintainers

Matheus Castello (3):
  pinctrl: bcm2835: Add support for generic pinctrl binding
  pinctrl: bcm2835: Add support for output-low output-high properties
  pinctrl: bcm2835: Update docs about generic pinctrl bindings support

 .../bindings/pinctrl/brcm,bcm2835-gpio.txt         | 19 +++++
 drivers/pinctrl/bcm/Kconfig                        |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              | 92 ++++++++++++++--------
 3 files changed, 79 insertions(+), 33 deletions(-)

-- 
2.7.4
