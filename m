From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/8] ARM: ux500: Add initial support for PM domains
Date: Tue, 14 Oct 2014 11:12:53 +0200
Message-ID: <1413277981-27451-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jinkun Hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset enables initial support for PM domains for ux500.

The implementation is based upon the generic PM domain and its corresponding
DT support, which is used to decribe PM domains and tell what devices resides
in what PM domain.

In this initial step, the VAPE PM domain is added and the devices with
corresponding drivers that properly implements runtime PM support. Especially,
to gate the VAPE PM domain drivers must implement register context save/restore.
Typically that must be done from the driver's runtime PM callbacks.

Currently the generic PM domain, doesn't handle IRQ safe devices very well. For
example, having such device in a PM domain would keep it always powered. The
DMA controller in ux500, handled by the ste_dma40 driver is configured as IRQ
safe. That limitation in the generic PM domain needs to be fixed, prior we can
add the DMA device to the VAPE PM domain.


Ulf Hansson (8):
  dt: bindings: ux500: Add documentation for PM domains
  dt: bindings: ux500: Add header for PM domains specifiers
  ARM: ux500: Initial support for PM domains
  ARM: ux500: Enable Kconfig for the generic PM domain
  ARM: ux500: Add DT node for ux500 PM domains
  ARM: ux500: Add sdi devices to the VAPE PM domain
  ARM: ux500: Add spi and ssp devices to the VAPE PM domain
  ARM: ux500: Add i2c devices to the VAPE PM domain

 .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ++++++++++
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  | 22 ++++++
 arch/arm/mach-ux500/Kconfig                        |  1 +
 arch/arm/mach-ux500/Makefile                       |  1 +
 arch/arm/mach-ux500/pm.c                           |  4 ++
 arch/arm/mach-ux500/pm_domains.c                   | 79 ++++++++++++++++++++++
 arch/arm/mach-ux500/pm_domains.h                   | 17 +++++
 include/dt-bindings/arm/ux500_pm_domains.h         | 15 ++++
 8 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/ux500/power_domain.txt
 create mode 100644 arch/arm/mach-ux500/pm_domains.c
 create mode 100644 arch/arm/mach-ux500/pm_domains.h
 create mode 100644 include/dt-bindings/arm/ux500_pm_domains.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
