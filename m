From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v3 0/2] irqchip: Support Aspeed IRQ controller
Date: Fri, 13 May 2016 00:13:11 +0930
Message-ID: <1463064193-2178-1-git-send-email-joel@jms.id.au>
References: <1462802317-27086-1-git-send-email-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462802317-27086-1-git-send-email-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello All,

This adds support for the IRQ controller found in the Aspeed ast2400 and
ast2500 BMC SoCs.

It's been tested on the ast2400 in an OpenPower Palmetto system, and on the
ast2500-edk developer kit.

V2 has a fix for the compatible string in the device tree bindings.

V3 drops the valid-sources bitmasks and adds a unit address to the example in
the bindings

Cheers,

Joel

Benjamin Herrenschmidt (1):
  irqchip: Add irq controller for Aspeed

Joel Stanley (1):
  doc/devicetree: Add Aspeed VIC bindings

 .../interrupt-controller/aspeed,ast2400-vic.txt    |  22 ++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-aspeed-vic.c                   | 230 +++++++++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
 create mode 100644 drivers/irqchip/irq-aspeed-vic.c

-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
