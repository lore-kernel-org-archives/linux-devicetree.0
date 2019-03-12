From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v5 0/3] Stingray USB PHY driver support
Date: Tue, 12 Mar 2019 21:36:18 +0530
Message-ID: <1552406781-5180-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

These patches add Stingray USB PHY driver and its corresponding
DT nodes with documentation.

This patch set is based on Linux-5.0-rc2.

Changes from v4:
  - Addressed Rob Herring review comments
     - Removed child nodes and added #phy-cells 1
     - Added xlate function to get phy using phandle argument.

Changes from v3:
  - Addressed Rob Herring review comments
     - Changed compatible strings.
     - updated driver based on new compatible strings.

Changes from v2:
  - Addressed Kishon review comments
  - Updated patchset to Linux-5.0-rc2

Changes from v1:
  - Addressed Kishon review comments
  - phy init call return value handle
  
Srinath Mannam (3):
  dt-bindings: phy: Add Stingray USB PHY binding document
  phy: sr-usb: Add Stingray USB PHY driver
  arm64: dts: Add USB DT nodes for Stingray SoC

 .../bindings/phy/brcm,stingray-usb-phy.txt         |  40 +++
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  78 ++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   1 +
 drivers/phy/broadcom/Kconfig                       |  11 +
 drivers/phy/broadcom/Makefile                      |   1 +
 drivers/phy/broadcom/phy-bcm-sr-usb.c              | 393 +++++++++++++++++++++
 6 files changed, 524 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
 create mode 100644 drivers/phy/broadcom/phy-bcm-sr-usb.c

-- 
2.7.4
