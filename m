From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: [PATCH v2 0/3] Add driver for Broadcom Cygnus USB phy controller
Date: Wed,  8 Nov 2017 13:16:40 +0530
Message-ID: <1510127203-5815-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Vikram Prakash <vikram.prakash@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Raviteja Garimella <raviteja.garimella@broadcom.com>, Rafal Milecki <rafal@milecki.pl>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add driver for Broadcom's USB phy controller's used in Cygnus family
of SoC and it's based on 4.14-rc3 tag.

The patch set can be fetched from iproc-cyg-usb-v2 branch of
https://github.com/Broadcom/arm64-linux.git

Changes since v1:
  - Added "dt-bindings: phy:" subject prefix in dt bindings patch
  - Renamed phy node name from "phy" to "usb-phy"
  - Added BIT() macro definitions for some of the register bit access
  - Added .owner in phy_ops structure.
  - Added cygnus_phy_shutdown_all() to keep probe() clean.
  - Used devm_extcon_register_notifier() instead of extcon_register_notifier()

Raveendra Padasalagi (3):
  dt-bindings: phy: Add Cygnus usb phy binding
  drivers: phy: broadcom: Add driver for Cygnus USB phy controller
  ARM: dts: Add dt node for Broadcom Cygnus USB phy

 .../bindings/phy/brcm,cygnus-usb-phy.txt           | 106 ++++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  35 ++
 drivers/phy/broadcom/Kconfig                       |  14 +
 drivers/phy/broadcom/Makefile                      |   1 +
 drivers/phy/broadcom/phy-bcm-cygnus-usb.c          | 690 +++++++++++++++++++++
 5 files changed, 846 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,cygnus-usb-phy.txt
 create mode 100644 drivers/phy/broadcom/phy-bcm-cygnus-usb.c

-- 
1.9.1
