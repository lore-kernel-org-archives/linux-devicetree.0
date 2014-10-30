From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] Broadcom Cygnus SoC Device Tree changes
Date: Thu, 30 Oct 2014 12:50:10 -0700
Message-ID: <1414698612-26216-2-git-send-email-f.fainelli@gmail.com>
References: <1414698612-26216-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414698612-26216-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

  Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

  http://github.com/brcm/linux.git tags/arm-soc/for-3.18/cygnus-dts-v9

for you to fetch changes up to 8872fc22c2670cde338ab92be4a8e9ebad8e53e6:

  ARM: dts: Enable Broadcom Cygnus SoC (2014-10-30 11:05:55 -0700)

----------------------------------------------------------------
This patchset contains initial support for Broadcom's Cygnus SoC based on our
iProc architecture. Initial support is minimal and includes just the mach
platform code, clock driver, and a basic device tree configuration. Peripheral
drivers will be submitted soon, as will device tree configurations for other
Cygnus board variants.

These are the Device Tree changes

----------------------------------------------------------------
Jonathan Richardson (1):
      dt-bindings: Document Broadcom Cygnus SoC and clocks

Scott Branden (1):
      ARM: dts: Enable Broadcom Cygnus SoC

 .../devicetree/bindings/arm/bcm/cygnus.txt         |  31 +++++++
 .../devicetree/bindings/clock/bcm-cygnus-clock.txt |  34 +++++++
 arch/arm/boot/dts/Makefile                         |   4 +
 arch/arm/boot/dts/bcm-cygnus-clock.dtsi            |  73 +++++++++++++++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  | 100 +++++++++++++++++++++
 arch/arm/boot/dts/bcm911360_entphn.dts             |  32 +++++++
 arch/arm/boot/dts/bcm911360k.dts                   |  32 +++++++
 arch/arm/boot/dts/bcm958300k.dts                   |  32 +++++++
 8 files changed, 338 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/cygnus.txt
 create mode 100644 Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt
 create mode 100644 arch/arm/boot/dts/bcm-cygnus-clock.dtsi
 create mode 100644 arch/arm/boot/dts/bcm-cygnus.dtsi
 create mode 100644 arch/arm/boot/dts/bcm911360_entphn.dts
 create mode 100644 arch/arm/boot/dts/bcm911360k.dts
 create mode 100644 arch/arm/boot/dts/bcm958300k.dts
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
