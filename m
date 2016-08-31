From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/5] Atmel sama5d2 security module support
Date: Wed, 31 Aug 2016 18:11:03 +0200
Message-ID: <20160831161108.8780-1-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

There has already been multiple tentatives trying to add support for the
Sama5d2 security module and in particular, access to its SRAM.
After multiple discussions, I believe adding support in the sram
driver/framework is probably the best because it allows exporting the
SRAM to the kernel, to userspace and also to run code from it.

As the support for the sama5d2 securam is fairly small, I've included it
directly in the mmio-sram driver.

Regards,

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Alexandre Belloni (5):
  Documentation: dt: atmel-at91: Document secumod bindings
  ARM: dts: at91: sama5d2: Add secumod node
  ARM: at91: add secumod register definitions
  misc: sram: document new compatible
  misc: sram: add Atmel securam support

 .../devicetree/bindings/arm/atmel-at91.txt         | 17 +++++++
 Documentation/devicetree/bindings/sram/sram.txt    |  2 +-
 arch/arm/boot/dts/sama5d2.dtsi                     | 19 ++++++++
 drivers/misc/sram.c                                | 52 +++++++++++++++++++---
 include/soc/at91/atmel-secumod.h                   | 46 +++++++++++++++++++
 5 files changed, 128 insertions(+), 8 deletions(-)
 create mode 100644 include/soc/at91/atmel-secumod.h

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
