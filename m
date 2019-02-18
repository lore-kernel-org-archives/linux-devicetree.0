From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v2 00/10] Add support for usb on Hikey960
Date: Mon, 18 Feb 2019 19:23:00 +0800
Message-ID: <20190218112310.17860-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Yu Chen <chenyu56@huawei.com>
List-Id: devicetree@vger.kernel.org

The patchset adds support for usb functionality of Hikey960, includes:
- dwc3 driver for Hisilicon Kirin Soc hi3660
- usb driver for HiKey960 board
- some adjustment in dwc3, usb gadget and typec driver
- dts for support usb of HiKey960

---
v2:
* This patchset based on patchset https://lkml.org/lkml/2019/1/25/344
of Heikki Krogerus
---

Yu Chen (10):
  dt-bindings: phy: Add support for HiSilicon's hi3660 USB PHY
  dt-bindings: misc: Add bindings for HiSilicon usb hub and data role
    switch functionality on HiKey960
  usb: dwc3: dwc3-of-simple: Add support for dwc3 of Hisilicon Soc
    Platform
  usb: dwc3: Add two quirks for Hisilicon Kirin Soc Platform
  phy: Add usb phy support for hi3660 Soc of Hisilicon
  usb: roles: Add usb role switch notifier.
  usb: dwc3: Registering a role switch in the DRD code.
  hikey960: Support usb functionality of Hikey960
  usb: gadget: Add configfs attribuite for controling
    match_existing_only
  dts: hi3660: Add support for usb on Hikey960

 .../bindings/misc/hisilicon-hikey-usb.txt          |  35 ++++
 .../devicetree/bindings/phy/phy-hi3660-usb3.txt    |  21 ++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  54 +++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  73 +++++++
 drivers/misc/Kconfig                               |   6 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/hisi_hikey_usb.c                      | 181 ++++++++++++++++
 drivers/phy/hisilicon/Kconfig                      |  10 +
 drivers/phy/hisilicon/Makefile                     |   1 +
 drivers/phy/hisilicon/phy-hi3660-usb3.c            | 232 +++++++++++++++++++++
 drivers/usb/dwc3/core.c                            |  43 ++++
 drivers/usb/dwc3/core.h                            |   9 +
 drivers/usb/dwc3/drd.c                             |  45 ++++
 drivers/usb/dwc3/dwc3-of-simple.c                  |   4 +-
 drivers/usb/dwc3/gadget.c                          |   2 +-
 drivers/usb/gadget/configfs.c                      |  32 +++
 drivers/usb/roles/class.c                          |  20 +-
 include/linux/usb/role.h                           |  46 ++++
 19 files changed, 820 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
 create mode 100644 drivers/misc/hisi_hikey_usb.c
 create mode 100644 drivers/phy/hisilicon/phy-hi3660-usb3.c

-- 
2.15.0-rc2
