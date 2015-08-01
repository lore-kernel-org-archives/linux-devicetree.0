From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/4] GPIO support for BRCMSTB
Date: Fri, 31 Jul 2015 18:17:41 -0700
Message-ID: <1438391865-7862-1-git-send-email-gregory.0xf0@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds interrupt support for the GPIO controller (UPG GIO) used on Broadcom's
various BRCMSTB SoCs (BCM7XXX and others).  For all existing hardware, this
block hooks up to the BCM7120 L2 IRQ controller and so will require
CONFIG_BCM7120_L2_IRQ=y.

New in v4:
- add nodes for the BRCMSTB GPIO controller to the BCM7445 dts file
- a few improvements suggested by Linus Walleij on v3
- remove unused 'irq' argument to brcmstb_gpio_irq_bank_handler()

The following are not included in this patchset:
- Initial device tree bindings (merged from v1 to GPIO tree)
- Initial GPIO support w/o interrupts (merged from v2 to GPIO tree)
- ARM Kconfig changes (merged from v2 to arm-soc tree)
- fix for null ptr deref in driver remove (merged from v3)

Previous versions:
v1: https://lkml.org/lkml/2015/5/6/199
v2: https://lkml.org/lkml/2015/5/28/853
v3: https://lkml.org/lkml/2015/6/17/960

Gregory Fong (4):
  dt-bindings: brcmstb-gpio: document properties for wakeup
  gpio: brcmstb: Add interrupt and wakeup source support
  gpio: brcmstb: support wakeup from S5 cold boot
  ARM: dts: brcmstb: add BCM7445 GPIO nodes

 .../devicetree/bindings/gpio/brcm,brcmstb-gpio.txt |  35 ++-
 arch/arm/boot/dts/bcm7445.dtsi                     |  50 ++++
 drivers/gpio/Kconfig                               |   1 +
 drivers/gpio/gpio-brcmstb.c                        | 306 ++++++++++++++++++++-
 4 files changed, 379 insertions(+), 13 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
