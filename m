From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Add mt6755 basic chip support
Date: Tue, 14 Jun 2016 10:20:03 +0800
Message-ID: <1465870805-10451-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds basic support for Mediatek's new 8-core chip, mt6755.
It is also named as Helio P10. It is based on 4.7-rc1

Mars Cheng (2):
  Document: DT: Add bindings for mediatek MT6755 SoC Platform
  arm64: dts: mediatek: add mt6755 support

 Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
 .../interrupt-controller/mediatek,sysirq.txt       |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6755-phone.dts      |   39 ++++++
 arch/arm64/boot/dts/mediatek/mt6755.dtsi           |  143 ++++++++++++++++++++
 6 files changed, 189 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6755-phone.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6755.dtsi
