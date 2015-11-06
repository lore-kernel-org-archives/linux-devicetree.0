From: Kapil Hali <kapilh@broadcom.com>
Subject: [PATCH RESEND v2 0/4] SMP support for Broadcom NSP
Date: Fri, 6 Nov 2015 14:49:27 -0500
Message-ID: <1446839371-22601-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Kapil Hali <kapilh@broadcom.com>
List-Id: devicetree@vger.kernel.org

This is the second iteration in the series.

Changes in v2:
Removed the pen_holding method of SMP bringup for NSP SoC and
replaced it with simple wakeup of secondary core using ARM IPI.


This series adds SMP support for Broadcom's Northstar Plus SoC.

There are similar SMP enablement methods for many ARMv7 bsed SoCs.
BCM NSP SoC, has a typical such mechanism - after power-on, the
secondary core is held in a standby state, primary core provides a
startup address for the secondary core and wakes it up. Booting of
the secondary core is serialized using pen_release global variable.

The startup address is programmed at a special register location
which is defined in the device tree using a "secondary-boot-reg"
property in a node whose "enable-method" property matches.

The first patch adds cpu-enable-method in the device tree bindings
documentation. It also updates ARM CPU device tree documentation
with Broadcom Northstar Plus CPU details.

The second patch adds SMP support to the BCM NSP device tree file.

The third patch, enables SMP on BCM NSP. It also consolidates
common SMP handling between BCM NSP and BCM Kona.

The final patch, enables SMP on BCM 4708 and this patch is pulled
in from Jon Mason's patch from the mailing list.

This patch series is constructed based on Linux v4.3-rc2.

The source code is available at GITHUB:
https://github.com/Broadcom/cygnus-linux/tree/nsp-smp-v1

Jon Mason (1):
  ARM: BCM: Add SMP support for Broadcom 4708

Kapil Hali (3):
  dt-bindings: add SMP enable-method for Broadcom NSP
  ARM: dts: add SMP support for Broadcom NSP
  ARM: BCM: Add SMP support for Broadcom NSP

 .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 +++++++++
 Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
 arch/arm/boot/dts/bcm-nsp.dtsi                     | 33 ++++++---
 arch/arm/boot/dts/bcm4708.dtsi                     |  2 +
 arch/arm/mach-bcm/Kconfig                          |  3 +
 arch/arm/mach-bcm/Makefile                         | 11 ++-
 arch/arm/mach-bcm/bcm_nsp.h                        | 19 +++++
 arch/arm/mach-bcm/{kona_smp.c => platsmp.c}        | 85 +++++++++++++++++++---
 8 files changed, 167 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
 create mode 100644 arch/arm/mach-bcm/bcm_nsp.h
 rename arch/arm/mach-bcm/{kona_smp.c => platsmp.c} (75%)

-- 
2.1.0
