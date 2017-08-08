From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 0/5] Add clk and scpsys support for MT6755
Date: Tue, 8 Aug 2017 16:13:29 +0800
Message-ID: <1502180014-7995-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org


Mars Cheng (3):
  clk: mediatek: add mt6755 clock ID
  clk: mediatek: add clk support for MT6755
  soc: mediatek: add MT6755 scpsys support

wendell.lin (2):
  dt-bindings: mediatek: add MT6755 power dt-bindings
  dt-bindings: arm: mediatek: document clk bindings for MT6755

 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |    1 +
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |    3 +
 drivers/clk/mediatek/Kconfig                       |   32 +
 drivers/clk/mediatek/Makefile                      |    5 +
 drivers/clk/mediatek/clk-mt6755-img.c              |   81 +++
 drivers/clk/mediatek/clk-mt6755-mm.c               |  148 +++++
 drivers/clk/mediatek/clk-mt6755-vdec.c             |   91 +++
 drivers/clk/mediatek/clk-mt6755-venc.c             |   78 +++
 drivers/clk/mediatek/clk-mt6755.c                  |  666 ++++++++++++++++++++
 drivers/soc/mediatek/mtk-scpsys.c                  |  116 ++++
 include/dt-bindings/clock/mt6755-clk.h             |  293 +++++++++
 include/dt-bindings/power/mt6755-power.h           |   26 +
 18 files changed, 1546 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6755-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt6755.c
 create mode 100644 include/dt-bindings/clock/mt6755-clk.h
 create mode 100644 include/dt-bindings/power/mt6755-power.h
