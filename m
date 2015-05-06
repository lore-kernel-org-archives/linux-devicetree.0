From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH 0/3] GPIO support for BRCMSTB
Date: Wed,  6 May 2015 01:37:54 -0700
Message-ID: <1430901477-10678-1-git-send-email-gregory.0xf0@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the GPIO controller (UPG GIO) used on Broadcom's
various BRCMSTB SoCs (BCM7XXX and others).  It uses the "basic-mmio-gpio"
interface to try to reduce duplication of the base logic.

There is only one IRQ for each GIO IP block (i.e. several register banks share
an IRQ).  After briefly looking into the generic IRQ chip implementation, it
seemed like in this case that using it would result in the driver being more
complex than necessary because AFAICT it expects a 1:1 mapping of
irq_chip_generic to gpio_chip.  It seemed like less of a pain to have a single
irq_chip since we have a single IRQ for all register banks (multiple
gpio_chips).  I might be missing something, maybe using a shared IRQ across
multiple irq_chips is easier than I think?  Suggestions welcome.

For all existing hardware, this block hooked up to the BCM7120 L2 IRQ
controller and so will require CONFIG_BCM7120_L2_IRQ=y.

Gregory Fong (3):
  dt-bindings: add brcmstb-gpio GPIO binding
  gpio: Add GPIO support for Broadcom STB SoCs
  gpio: brcmstb: Add interrupt support

 .../devicetree/bindings/gpio/brcm,brcmstb-gpio.txt |   65 +++
 MAINTAINERS                                        |    7 +
 arch/arm/mach-bcm/Kconfig                          |    1 +
 drivers/gpio/Kconfig                               |    9 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-brcmstb.c                        |  492 ++++++++++++++++++++
 6 files changed, 575 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.txt
 create mode 100644 drivers/gpio/gpio-brcmstb.c

-- 
1.7.9.5
