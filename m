From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 0/2] Add mt6795 basic chip support
Date: Wed, 8 Jul 2015 18:14:38 +0800
Message-ID: <1436350480-17276-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds basic chip support for Mediatek 8-core chip, mt6795.
It is also named as Helio X10. It is based on:
1. 4.2-rc1
2. [PATCH v3 0/2] Add mt6580 basic chip support

The second one has added some device tree binding documentation for
mt6580. mt6795 has some device tree binding modifications too.
To cleanly apply this patch, please apply mt6580 patch set first.

Mars Cheng (2):
  Document: DT: Add bindings for mediatek MT6795 SoC Platform
  arm64: dts: mediatek: add mt6795 support

 Documentation/devicetree/bindings/arm/mediatek.txt |   9 +-
 .../bindings/arm/mediatek/mediatek,sysirq.txt      |   3 +-
 .../devicetree/bindings/serial/mtk-uart.txt        |   5 +-
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 arch/arm64/boot/dts/mediatek/mt6795-evb.dts        |  34 +++++
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 164 +++++++++++++++++++++
 6 files changed, 211 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6795.dtsi

--
1.8.1.1.dirty
