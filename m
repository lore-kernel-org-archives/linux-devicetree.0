From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v4 0/2] Add Broadcom Stingray PCIe PHY support
Date: Fri,  6 Jul 2018 17:18:31 -0700
Message-ID: <1530922713-22964-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch series adds PCIe PHY support for both PAXB and PAXC root complex in
Broadcom Stingray SOC

This patch series is based off v4.18-rc3 and is available on GIHUB:
repo: https://github.com/Broadcom/arm64-linux.git
branch: sr-pcie-phy-v4

Changes since v3:
 - Add missing node unit address in binding document
 - Remove redundant dummy PHY callbacks in the driver
 - Other miscellaneous minor fixes based on feedback from Kishon

Changes since v2:
 - Add 'reg' property to the driver so it can access the PCIe SS PHY block
 - Rebase to v4.18-rc3

Changes since v1:
 - Rebase from v4.17-rc5 to v4.18-rc1

Ray Jui (2):
  dt-bindings: phy: Add binding doc for Stingray PCIe PHY
  phy: bcm-sr-pcie: Add Stingray PCIe PHY driver

 .../devicetree/bindings/phy/brcm,sr-pcie-phy.txt   |  41 +++
 drivers/phy/broadcom/Kconfig                       |  10 +
 drivers/phy/broadcom/Makefile                      |   2 +
 drivers/phy/broadcom/phy-bcm-sr-pcie.c             | 305 +++++++++++++++++++++
 4 files changed, 358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
 create mode 100644 drivers/phy/broadcom/phy-bcm-sr-pcie.c

-- 
2.1.4
