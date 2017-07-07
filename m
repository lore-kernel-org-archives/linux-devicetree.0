From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH 0/2] Add stingray usb phy driver
Date: Fri,  7 Jul 2017 18:37:03 +0530
Message-ID: <1499432825-15820-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset add generic phy driver for stingray usb phy.

Stingray has two usb phy modules drdu3 and usb3h-drdu2.
drdu3 has one super speed and one high speed phys.
usb3h-drdu2 has one super speed phy and two high speed phys.

All patches are based on linux-phy/next.

Srinath Mannam (2):
  dt-bindings: phy: Add stingray usb phy documentation
  phy: Add stingray usb phy driver

 .../bindings/phy/brcm,stingray-usb-phy.txt         |  72 ++
 drivers/phy/broadcom/Kconfig                       |  13 +
 drivers/phy/broadcom/Makefile                      |   1 +
 drivers/phy/broadcom/phy-bcm-stingray-usb.c        | 722 +++++++++++++++++++++
 4 files changed, 808 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
 create mode 100644 drivers/phy/broadcom/phy-bcm-stingray-usb.c

-- 
2.7.4
