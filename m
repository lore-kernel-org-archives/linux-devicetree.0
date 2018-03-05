From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v2 0/3] pinctrl: bcm2835: Add brcm,level property
Date: Sun,  4 Mar 2018 22:29:17 -0400
Message-ID: <1520216960-19880-1-git-send-email-matheus@castello.eng.br>
References: <431699005.307231.1520086916739@email.1und1.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <431699005.307231.1520086916739@email.1und1.de>
Sender: linux-kernel-owner@vger.kernel.org
To: stefan.wahren@i2se.com, linus.walleij@linaro.org
Cc: eric@anholt.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

Hi Linus and Stefan,

thanks for the tips.

This series adds support for generic binding for pinctrl bcm2835 driver,
and add the code for set output buffer of a pin using the output-low and
output-high generic properties.

Tested on Raspberry Pi Zero W, based on bcm2835 SoC.

Matheus Castello (3):
  pinctrl: bcm2835: switch to GENERIC_PINCONF
  pinctrl: bcm2835: Add support for generic pinctrl binding
  pinctrl: bcm2835: Add support for output-low output-high properties

 drivers/pinctrl/bcm/Kconfig           |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 88 +++++++++++++++++++++++------------
 2 files changed, 60 insertions(+), 29 deletions(-)

--
2.7.4
