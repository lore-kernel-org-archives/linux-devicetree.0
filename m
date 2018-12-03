From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v1 00/12] Add support for usb on Hikey960
Date: Mon, 3 Dec 2018 11:45:03 +0800
Message-ID: <20181203034515.91412-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Yu Chen <chenyu56@huawei.com>
List-Id: devicetree@vger.kernel.org

The patchset adds support for usb functionality of Hikey960, includes:
- dwc3 driver for Hisilicon Kirin Soc hi3660
- usb driver for HiKey960 board
- some adjustment in dwc3, usb gadget and typec driver
- dts for support usb of HiKey960

Yu Chen (12):
  dt-bindings: usb: add support for dwc3 controller on HiSilicon SoCs
  dt-bindings: phy: Add support for HiSilicon's hi3660 USB PHY
  dt-bindings: misc: Add bindings for HiSilicon usb hub and data role
    switch functionality on HiKey960
  usb: dwc3: dwc3-hisi: Add code for dwc3 of Hisilicon Soc Platform
  usb: dwc3: Add two quirks for Hisilicon Kirin Soc Platform
  phy: Add usb phy support for hi3660 Soc of Hisilicon
  usb: roles: Find the usb role switch by also matching against the
    device node
  usb: roles: Add usb role switch notifier.
  usb: dwc3: Registering a role switch in the DRD code.
  hikey960: Support usb functionality of Hikey960
  usb: gadget: Add configfs attribuite for controling
    match_existing_only
  dts: hi3660: Add support for usb on Hikey960

 .../bindings/misc/hisilicon-hikey-usb.txt          |  36 +++
 .../devicetree/bindings/phy/phy-hi3660-usb3.txt    |  21 ++
 .../devicetree/bindings/usb/dwc3-hisi.txt          |  67 +++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  56 ++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  72 +++++
 drivers/misc/Kconfig                               |   7 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/hisi_hikey_usb.c                      | 198 ++++++++++++
 drivers/phy/hisilicon/Kconfig                      |  10 +
 drivers/phy/hisilicon/Makefile                     |   1 +
 drivers/phy/hisilicon/phy-hi3660-usb3.c            | 237 +++++++++++++++
 drivers/usb/common/roles.c                         |  60 +++-
 drivers/usb/dwc3/Kconfig                           |   8 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  43 +++
 drivers/usb/dwc3/core.h                            |   9 +
 drivers/usb/dwc3/drd.c                             |  49 +++
 drivers/usb/dwc3/dwc3-hisi.c                       | 335 +++++++++++++++++++++
 drivers/usb/dwc3/gadget.c                          |   2 +-
 drivers/usb/gadget/configfs.c                      |  32 ++
 include/linux/usb/role.h                           |  46 +++
 22 files changed, 1299 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/dwc3-hisi.txt
 create mode 100644 drivers/misc/hisi_hikey_usb.c
 create mode 100644 drivers/phy/hisilicon/phy-hi3660-usb3.c
 create mode 100644 drivers/usb/dwc3/dwc3-hisi.c

-- 
2.15.0-rc2
