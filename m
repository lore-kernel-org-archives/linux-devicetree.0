From: Sriram Dash <sriram.dash@nxp.com>
Subject: [PATCH 0/2] drivers: usb: phy: Add qoriq usb 3.0 phy driver support
Date: Mon, 14 Nov 2016 10:56:53 +0530
Message-ID: <1479101215-26954-1-git-send-email-sriram.dash@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, stern@rowland.harvard.edu, pku.leo@gmail.com, mathias.nyman@intel.com, gregkh@linuxfoundation.org, suresh.gupta@nxp.com, felipe.balbi@linux.intel.com, Sriram Dash <sriram.dash@nxp.com>
List-Id: devicetree@vger.kernel.org

Adds qoriq usb 3.0 phy driver support for LS1043A platform.
Describes the qoriq usb 2.0 phy driver binding, currently used
for LS1043A platform.
Adds entries in dts to enable USB 3.0 phy driver.

Sriram Dash (2):
  drivers: usb: phy: Add qoriq usb 3.0 phy driver support
  arm64: dts: ls1043a: Enable USB 3.0 phy driver

 .../devicetree/bindings/phy/phy-qoriq-usb3.txt     |  38 ++++
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  33 ++++
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-qoriq-usb3.c                       | 202 +++++++++++++++++++++
 5 files changed, 282 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
 create mode 100644 drivers/phy/phy-qoriq-usb3.c

-- 
2.1.0
