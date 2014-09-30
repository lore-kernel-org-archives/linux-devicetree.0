From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/6] ARM: at91: remove at91sam9g45/9m10 legacy board support
Date: Tue, 30 Sep 2014 18:19:41 +0200
Message-ID: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patch removes legacy board support for at91sam9g45/9m10 SoCs whose
boards have already migrated to DT.
Along with this removal this series adds DT support for the TRNG (True
Random Generator Block) and adds missing trng and isi nodes to the dtsi.

There's still one missing piece to provide the exact same set of
functionalities: AC97 controller support which has not been moved to DT yet.

Best Regards,

Boris

Boris Brezillon (6):
  ARM: at91: remove at91sam9g45/9m10 legacy board support
  hwrng: atmel: use clk_prepapre_enable/_disable_unprepare
  hwrng: atmel: add DT support
  hwrng: atmel: Add TRNG DT binding doc
  ARM: at91/dt: add trng node
  ARM: at91/dt: add ISI node

 .../devicetree/bindings/hwrng/atmel-trng.txt       |   16 +
 arch/arm/boot/dts/at91sam9g45.dtsi                 |   39 +
 arch/arm/mach-at91/Kconfig.non_dt                  |   21 -
 arch/arm/mach-at91/Makefile                        |    4 -
 arch/arm/mach-at91/at91sam9g45.c                   |  403 ----
 arch/arm/mach-at91/at91sam9g45_devices.c           | 1915 --------------------
 arch/arm/mach-at91/board-sam9m10g45ek.c            |  526 ------
 drivers/char/hw_random/Kconfig                     |    2 +-
 drivers/char/hw_random/atmel-rng.c                 |   15 +-
 9 files changed, 67 insertions(+), 2874 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwrng/atmel-trng.txt
 delete mode 100644 arch/arm/mach-at91/at91sam9g45_devices.c
 delete mode 100644 arch/arm/mach-at91/board-sam9m10g45ek.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
