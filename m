From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v6 0/3] bcm2835: Add generic pinctrl support
Date: Sun, 29 Apr 2018 15:28:10 -0400
Message-ID: <1525030092-3643-1-git-send-email-matheus@castello.eng.br>
References: <CACRpkdaH6kgbM+3UHVJ_JfKZ367XXRhSjXhvsZ-8b0Ovbkpmew@mail.gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaH6kgbM+3UHVJ_JfKZ367XXRhSjXhvsZ-8b0Ovbkpmew@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, stefan.wahren@i2se.com, eric@anholt.net
Cc: swarren@wwwdotorg.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

This series adds support for generic binding for pinctrl bcm2835 driver,
and add the code for set output buffer of a pin using the output-low and
output-high generic properties.

Tested on Raspberry Pi Zero W, based on bcm2835 SoC.

Changes since v5:
(Suggested by Stefan Wahren)
- Fix checkpatch warnings
- Use PIN_CONFIG_END+1 for bcm2835_pinconf_param for our pull legacy
configuration
(Suggested by Linus Walleij)
- Only resend patch 2+3
- Add Stephen Warren for subsequent postings

Changes since v4:
(Suggested by Rob Herring)
- Change dt-bindings docs driver reference to hardware in case the BCM2835
pin configuration and multiplexing

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

Matheus Castello (2):
  pinctrl: bcm2835: Add support for generic pinctrl binding
  pinctrl: bcm2835: Add support for output-low output-high properties

 drivers/pinctrl/bcm/Kconfig           |   1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 100 +++++++++++++++++++++-------------
 2 files changed, 64 insertions(+), 37 deletions(-)

-- 
2.7.4
