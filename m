From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 0/3] Pistachio USB2.0 PHY
Date: Tue,  7 Apr 2015 15:04:15 -0700
Message-ID: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the USB2.0 PHY present on the IMG Pistachio SoC.

Based on mips-for-linux-next and tested on the IMG Pistachio BuB.  If possible,
I'd like this to go through the MIPS tree with Kishon's ACK.

Cc: James Hartley <james.hartley@imgtec.com>
Cc: Damien Horsley <Damien.Horsley@imgtec.com>

Changes from v1:
 - Added patch to enable PHY driver in pistachio_defconfig
 - Fixed a couple of spelling errors

Andrew Bresticker (3):
  phy: Add binding document for Pistachio USB2.0 PHY
  phy: Add driver for Pistachio USB2.0 PHY
  MIPS: pistachio: Enable USB PHY driver in defconfig

 .../devicetree/bindings/phy/pistachio-usb-phy.txt  |  29 +++
 arch/mips/configs/pistachio_defconfig              |   1 +
 drivers/phy/Kconfig                                |   7 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-pistachio-usb.c                    | 206 +++++++++++++++++++++
 include/dt-bindings/phy/phy-pistachio-usb.h        |  16 ++
 6 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
 create mode 100644 drivers/phy/phy-pistachio-usb.c
 create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h

-- 
2.2.0.rc0.207.ga3a616c
