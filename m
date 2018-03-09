From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v5 0/2] Add HiSilicon INNO USB2 PHY driver support
Date: Fri,  9 Mar 2018 22:46:59 +0800
Message-ID: <1520606821-22582-1-git-send-email-shawn.guo@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-Id: devicetree@vger.kernel.org

It adds device tree bindings and driver support for HiSilicon INNO USB2
PHY device, which can be found on HiSilicon STB SoC Hi3798CV200.

Changes for v5:
 - Drop "syscon" from perictrl compatible in bindings example, as it's
   not really required by inno-usb2-phy devices.
 - Collect Rob's Reviewed-by tag on bindings.

Changes for v4:
 - Change device tree bindings to define each PHY port as a child node,
   and therefore instead of adding a custom .of_xlate, we can use
   of_phy_simple_xlate.  Also #phy-cells is 0 now, and consumers can
   refer to the phy without any number cell in phandle.

Changes for v3:
 - Make combphy device be child of peripheral controller and use 'reg'
   property for mapping combphy configuration register.

Changes for v2:
 - Move DT bindings into a separate patch.
 - Rename hisi_inno_phy_start() to hisi_inno_phy_init() for aligning
   name with .init hook.

Pengcheng Li (2):
  dt-bindings: add bindings doc for HiSilicon INNO USB2 PHY
  phy: add inno-usb2-phy driver for hi3798cv200 SoC

 .../devicetree/bindings/phy/phy-hisi-inno-usb2.txt |  71 ++++++++
 drivers/phy/hisilicon/Kconfig                      |  10 ++
 drivers/phy/hisilicon/Makefile                     |   1 +
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c         | 197 +++++++++++++++++++++
 4 files changed, 279 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
 create mode 100644 drivers/phy/hisilicon/phy-hisi-inno-usb2.c

-- 
1.9.1
