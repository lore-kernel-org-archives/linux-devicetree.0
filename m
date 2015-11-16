From: Alban Bedel <albeu@free.fr>
Subject: [PATCH v2 0/5] MIPS: ath79: Add USB support on the TL-WR1043ND
Date: Mon, 16 Nov 2015 22:21:59 +0100
Message-ID: <1447708924-15076-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Hi,

First re-roll of this patch series to add a driver for the USB phy
on ATH79 SoCs. As suggested in the previous series this new version
include a generic driver for simple phys which is re-used for the
ATH79 driver. This generic driver should be useful for all kind of
phys that don't need any configuration.

Alban

Alban Bedel (5):
  phy: Add a driver for simple phy
  devicetree: Add bindings for the ATH79 USB phy
  phy: Add a driver for the ATH79 USB phy
  MIPS: ath79: Add the EHCI controller and USB phy to the AR9132 dtsi
  MIPS: ath79: Enable the USB port on the TL-WR1043ND

 .../devicetree/bindings/phy/phy-ath79-usb.txt      |  18 ++
 MAINTAINERS                                        |   8 +
 arch/mips/boot/dts/qca/ar9132.dtsi                 |  26 +++
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts   |   8 +
 drivers/phy/Kconfig                                |  20 ++
 drivers/phy/Makefile                               |   2 +
 drivers/phy/phy-ath79-usb.c                        | 116 ++++++++++++
 drivers/phy/phy-simple.c                           | 204 +++++++++++++++++++++
 include/linux/phy/simple.h                         |  39 ++++
 9 files changed, 441 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
 create mode 100644 drivers/phy/phy-ath79-usb.c
 create mode 100644 drivers/phy/phy-simple.c
 create mode 100644 include/linux/phy/simple.h

-- 
2.0.0
