From: Markus Mayer <markus.mayer@linaro.org>
Subject: [PATCH v2 0/3] ARM: bcm21664: Add initial support.
Date: Thu,  6 Mar 2014 17:18:11 +0800
Message-ID: <1394097494-29899-1-git-send-email-markus.mayer@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <matt.porter@linaro.org>, Christian Daudt <bcm@fixthebug.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Broadcom Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

This series adds initial support for the Broadcom BCM21664 mobile SoC.

The series depends on the series "ARM: bcm281xx: Consolidate code":
    https://lkml.org/lkml/2014/2/25/548

Changes since v1:

- Fixed typo ("21644" -> "21664" in 2 locations) in board_bcm21664.c

Markus Mayer (3):
  ARM: DT: bcm21664: Device tree bindings
  ARM: bcm21664: Add board support.
  ARM: dts: bcm21664: Add device tree files.

 .../devicetree/bindings/arm/bcm/bcm21664.txt       |  15 ++
 .../devicetree/bindings/arm/bcm/kona-resetmgr.txt  |  14 +
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/bcm21664-garnet.dts              |  56 ++++
 arch/arm/boot/dts/bcm21664.dtsi                    | 292 +++++++++++++++++++++
 arch/arm/mach-bcm/Makefile                         |   6 +-
 arch/arm/mach-bcm/board_bcm21664.c                 |  78 ++++++
 7 files changed, 461 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm21664.txt
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/kona-resetmgr.txt
 create mode 100644 arch/arm/boot/dts/bcm21664-garnet.dts
 create mode 100644 arch/arm/boot/dts/bcm21664.dtsi
 create mode 100644 arch/arm/mach-bcm/board_bcm21664.c

-- 
1.9.0
