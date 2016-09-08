From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 0/4] Add MT6797 SoC basic support
Date: Thu, 8 Sep 2016 18:49:49 +0800
Message-ID: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Erin Lo <erin.lo@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
Cc: linux-clk@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>, Loda Choui <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu <scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch set adds basic chip support for mediatek's first 10-core
chip, X20, also known as MT6797.

- Based on 4.8-rc1
- Based on the MT2701 patch by Erin Lo[1]
- Modify irq-mtk-sysirq to support 2 base address

[1] https://lkml.org/lkml/2016/8/22/128

Mars Cheng (4):
  Document: DT: Add bindings for mediatek MT6797 SoC Platform
  irqchip: mtk-sysirq: support second intpol base
  arm64: dts: mediatek: add mt6797 support
  clk: mediatek: Add MT6797 clock support

 Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |    3 +-
 .../interrupt-controller/mediatek,sysirq.txt       |    4 +-
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6797-evb.dts        |   36 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi           |  237 +++++++
 drivers/clk/mediatek/Kconfig                       |   36 +
 drivers/clk/mediatek/Makefile                      |    5 +
 drivers/clk/mediatek/clk-mt6797-img.c              |   87 +++
 drivers/clk/mediatek/clk-mt6797-mm.c               |  146 ++++
 drivers/clk/mediatek/clk-mt6797-vdec.c             |  102 +++
 drivers/clk/mediatek/clk-mt6797-venc.c             |   86 +++
 drivers/clk/mediatek/clk-mt6797.c                  |  716 ++++++++++++++++++++
 drivers/irqchip/irq-mtk-sysirq.c                   |   42 +-
 include/dt-bindings/clock/mt6797-clk.h             |  281 ++++++++
 22 files changed, 1784 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6797.dtsi
 create mode 100644 drivers/clk/mediatek/clk-mt6797-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797.c
 create mode 100644 include/dt-bindings/clock/mt6797-clk.h

--
1.7.9.5
