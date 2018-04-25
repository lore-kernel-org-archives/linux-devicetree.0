From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Add MediaTek XS-PHY driver
Date: Wed, 25 Apr 2018 15:45:27 +0800
Message-ID: <1524642329-12255-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ryder Lee <ryder.lee@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>From dfce031e29c5fddbd1ea46bb2db0cde0ba62bcb0 Mon Sep 17 00:00:00 2001
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Wed, 25 Apr 2018 15:24:40 +0800
Subject: [PATCH 0/2] Add MediaTek XS-PHY driver

This patch series support the SuperSpeedPlus XS-PHY transceiver for
USB3.1 GEN2 controller on MediaTek chips. The driver supports multiple
USB2.0, USB3.1 GEN2 ports.

Chunfeng Yun (2):
  dt-bindings: add MediaTek XS-PHY binding
  phy: mediatek: add XS-PHY driver

 .../devicetree/bindings/phy/phy-mtk-xsphy.txt      | 127 +++++
 drivers/phy/mediatek/Kconfig                       |   9 +
 drivers/phy/mediatek/Makefile                      |   1 +
 drivers/phy/mediatek/phy-mtk-xsphy.c               | 600 +++++++++++++++++++++
 4 files changed, 737 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
 create mode 100644 drivers/phy/mediatek/phy-mtk-xsphy.c

-- 
1.9.1
