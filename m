From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH v2 0/6] GPIO support for BRCMSTB
Date: Thu, 28 May 2015 19:14:04 -0700
Message-ID: <1432865650-4062-1-git-send-email-gregory.0xf0@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the GPIO controller (UPG GIO) used on Broadcom's
various BRCMSTB SoCs (BCM7XXX and others). It uses the "basic-mmio-gpio"
interface to try to reduce duplication of the base logic.

For all existing hardware, this block hooked up to the BCM7120 L2 IRQ
controller and so will require CONFIG_BCM7120_L2_IRQ=y.

New in v2:
- fix license mismatch as pointed out by Paul Bolle
- move select ARCH_WANT_OPTIONAL_GPIOLIB to separate patch
- change to have 32 lines per bank per Linus Walleij's comments
- allow this controller to be used as a wakeup source
- add default GPIO number for BRCMSTB

The device tree bindings from v1 were merged to the GPIO tree, so this patchset
only contains an addition to allow GPIOs to be used as a wakeup source
(patch 3).  The initial bindings from v1 can be found at
https://lkml.org/lkml/2015/5/6/200 .

Gregory Fong (6):
  gpio: Add GPIO support for Broadcom STB SoCs
  gpio: brcmstb: Add interrupt support
  dt-bindings: brcmstb-gpio: document properties for wakeup
  gpio: brcmstb: Allow GPIOs to be wakeup sources
  ARM: brcmstb: Select ARCH_WANT_OPTIONAL_GPIOLIB
  ARM: brcmstb: Add default gpio number

 .../devicetree/bindings/gpio/brcm,brcmstb-gpio.txt |  26 +-
 MAINTAINERS                                        |   7 +
 arch/arm/Kconfig                                   |   3 +-
 arch/arm/mach-bcm/Kconfig                          |   1 +
 drivers/gpio/Kconfig                               |   9 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-brcmstb.c                        | 581 +++++++++++++++++++++
 7 files changed, 626 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpio/gpio-brcmstb.c

-- 
1.9.1

