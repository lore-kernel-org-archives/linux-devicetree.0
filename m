From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V2 00/19] mmc: mmci: Improve DT support
Date: Mon, 31 Mar 2014 17:18:01 +0200
Message-ID: <1396279100-2920-1-git-send-email-ulf.hansson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Step by step, improve the DT support for the mmci host driver.

This enables us to move the final pieces of platform data for mmci for ux500
into DT. We are then able to remove yet another machine specific file for ux500.

This patchset needs to be merged together. I suggest we go through Russell's
ARM tree, since most of the patches are mmci specific which he maintains -
unless someone think there is a better alternative.

I will thus seek acks from the SOC maintainers for the SOC specific patches.

The goal is to queue this for 3.16, thus I might need to rebase the patches for
3.15 rc[n]. Still I would appreciate any comments at this point.

Changes in v2:
	- Adopting to review comments from Rob Herring and Linus Walleij. More
	or less causing each an every patch to be rebased.
	- Removed the patch for regulator for the db8500-prcmu from this
	patchset, since Mark Brown already queued it for 3.15.

Ulf Hansson (19):
  mmc: mmci: Convert to the mmc gpio API
  mmc: mmci: Convert to devm functions
  mmc: mmci: Update DT documentation
  mmc: mmci: Add DT bindings for signal direction
  mmc: mmci: Add DT bindings for feedback clock pin
  mmc: mmci: Use the common mmc DT parser
  ARM: ux500: Add mmci signal directions and feeback clock in DT for
    href
  ARM: ux500: Convert to the common mmc DT bindings for highspeed mode
  ARM: nomadik: Convert to the common mmc DT bindings for highspeed
    mode
  ARM: u300: Convert to the common mmc DT bindings for highspeed mode
  mmc: mmci: Mark the DT bindings for highspeed mode as deprecated
  mmc: mmci: Enable MMC_CAP_CMD23
  ARM: ux500: Add the mmc capabilities flags to DT
  ARM: ux500: Add a vmmc regulator through DT for the poped eMMC for
    href
  ARM: ux500: Remove redundant board file for mmci platform data
  mmc: mmci: Enforce DT for signal direction and feedback clock
  mmc: mmci: Enforce mmc capabilities through DT
  mmc: mmci: Enforce DMA configuration through DT
  mmc: mmci: Enforce max frequency configuration through DT

 Documentation/devicetree/bindings/mmc/mmci.txt |   54 ++++-
 arch/arm/boot/dts/ste-ccu9540.dts              |    6 +-
 arch/arm/boot/dts/ste-href.dtsi                |   19 +-
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi     |    4 +-
 arch/arm/boot/dts/ste-snowball.dts             |    4 +-
 arch/arm/boot/dts/ste-u300.dts                 |    4 +-
 arch/arm/mach-ux500/Makefile                   |    3 +-
 arch/arm/mach-ux500/board-mop500-sdi.c         |  166 ---------------
 arch/arm/mach-ux500/board-mop500.h             |    5 -
 arch/arm/mach-ux500/cpu-db8500.c               |    4 -
 drivers/mmc/host/mmci.c                        |  265 +++++++-----------------
 drivers/mmc/host/mmci.h                        |   14 +-
 include/linux/amba/mmci.h                      |   42 ----
 13 files changed, 157 insertions(+), 433 deletions(-)
 delete mode 100644 arch/arm/mach-ux500/board-mop500-sdi.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
