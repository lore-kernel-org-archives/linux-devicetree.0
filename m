From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 0/2] Pistachio USB2.0 PHY
Date: Wed,  1 Apr 2015 13:16:32 -0700
Message-ID: <1427919394-3580-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the USB2.0 PHY present on the IMG Pistachio SoC.

Based on mips-for-linux-next and tested on the IMG Pistachio BuB.  If possible,
I'd like this to go through the MIPS tree with Kishon's ACK.

Cc: James Hartley <james.hartley@imgtec.com>
Cc: Damien Horsley <Damien.Horsley@imgtec.com>

Andrew Bresticker (2):
  phy: Add binding document for Pistachio USB2.0 PHY
  phy: Add driver for Pistachio USB2.0 PHY

 .../devicetree/bindings/phy/pistachio-usb-phy.txt  |  29 +++
 drivers/phy/Kconfig                                |   7 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-pistachio-usb.c                    | 206 +++++++++++++++++++++
 include/dt-bindings/phy/phy-pistachio-usb.h        |  16 ++
 5 files changed, 259 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
 create mode 100644 drivers/phy/phy-pistachio-usb.c
 create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h

-- 
2.2.0.rc0.207.ga3a616c
