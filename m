From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/3] pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB
Date: Thu,  9 May 2019 13:59:52 -0700
Message-ID: <20190509205955.27842-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Doug Berger <opendmb@gmail.com>, Matheus Castello <matheus@castello.eng.br>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lukas Wunner <lukas@wunner.de>, Nathan Chancellor <natechancellor@gmail.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

This patch series allows making use of the pinctrl-bcm2835 driver on
ARCH_BRCMSTB where it is also used. Binding document is updated, and
then the Kconfig language is updated to allow selecting this driver with
ARCH_BRCMSTB, finally, Al updates the logic to account for the
additional registers that were added on 7211.

Thanks!

Al Cooper (1):
  pinctrl: bcm2835: bcm7211: Add support for 7211 pull-up functionality

Doug Berger (1):
  pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB

Florian Fainelli (1):
  dt-bindings: pinctrl: bcm2835-gpio: Document BCM7211 compatible

 .../bindings/pinctrl/brcm,bcm2835-gpio.txt    |  3 +
 drivers/pinctrl/bcm/Kconfig                   |  6 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         | 85 +++++++++++++++++--
 3 files changed, 88 insertions(+), 6 deletions(-)

-- 
2.17.1
