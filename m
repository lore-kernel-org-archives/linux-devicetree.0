From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 0/6] Add initial support for Broadcom Cygnus SoC
Date: Tue, 14 Oct 2014 19:58:50 -0700
Message-ID: <1413341936-17606-1-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
Cc: JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset contains initial support for Broadcom's Cygnus SoC based on our
iProc architecture. Initial support is minimal and includes just the mach
platform code, clock driver, and a basic device tree configuration. Peripheral
drivers will be submitted soon, as will device tree configurations for other
Cygnus board variants.

Changes from v4:
 - simple clock tree used. reworked clock driver will be submitted later
 - fixed MAINTAINERS patchset error
 - removed DEBUG_UART_8250 Kconfig.debug legacy support
 - made ARCH_BCM_IPROC a silent Kconfig option
 - removed multi_v7_defconfig as it is not needed at this time, can
   support in future patchset but does not seem optimal configs for our
   current usage.
 
Changes from v3:
 - restart functionality removed.  Will be added in a different patchset
   in drivers/power
 - removed NEON init sequence.  Will be moved to bootloader
 - cleaned up Kconfigs for ARCH_BCM_CYGNUS by removing unnecessary selects
 - consolidated ARCH_BCM_IPROC with select from ARCH_BCM_CYGNUS and
   ARCH_BCM5301X
 - removed bcm911360_entphn binding
 - added documentation for SoCs currently supported in Cygnus family

Changes from v2:
 - rebased to 3.17 kernel

Changes from v1:
 - Address code review comments as per previous responses.
 - Copyright headers updated to remove Broadcom URL.
 - mach platform code still contains hard coded addresses. These address are
   the same for all Cygnus variants. Could you please provide guidance on where
   they should go if you would still like them changed.  There does not seem to
   be a reason to change them to device tree as they do not change.

Jonathan Richardson (3):
  ARM: cygnus: Initial support for Broadcom Cygnus SoC
  dt-bindings: Document Broadcom Cygnus SoC and clocks
  ARM: cygnus defconfig : Initial defconfig for Broadcom Cygnus SoC

Scott Branden (3):
  ARM: dts: Enable Broadcom Cygnus SoC
  MAINTAINERS: Entry for Cygnus/iproc arm architecture
  ARM: mach-bcm: Consolidate currently supported IPROC SoCs

 .../devicetree/bindings/arm/bcm/cygnus.txt         |   31 +++
 .../devicetree/bindings/clock/bcm-cygnus-clock.txt |   34 +++
 MAINTAINERS                                        |   15 ++
 arch/arm/boot/dts/Makefile                         |    4 +
 arch/arm/boot/dts/bcm-cygnus-clock.dtsi            |   73 ++++++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  109 +++++++++
 arch/arm/boot/dts/bcm911360_entphn.dts             |   22 ++
 arch/arm/boot/dts/bcm911360k.dts                   |   22 ++
 arch/arm/boot/dts/bcm958300k.dts                   |   22 ++
 arch/arm/configs/bcm_cygnus_defconfig              |  243 ++++++++++++++++++++
 arch/arm/mach-bcm/Kconfig                          |   67 ++++--
 arch/arm/mach-bcm/Makefile                         |    3 +
 arch/arm/mach-bcm/bcm_cygnus.c                     |   26 +++
 13 files changed, 650 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/cygnus.txt
 create mode 100644 Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt
 create mode 100644 arch/arm/boot/dts/bcm-cygnus-clock.dtsi
 create mode 100644 arch/arm/boot/dts/bcm-cygnus.dtsi
 create mode 100644 arch/arm/boot/dts/bcm911360_entphn.dts
 create mode 100644 arch/arm/boot/dts/bcm911360k.dts
 create mode 100644 arch/arm/boot/dts/bcm958300k.dts
 create mode 100644 arch/arm/configs/bcm_cygnus_defconfig
 create mode 100644 arch/arm/mach-bcm/bcm_cygnus.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
