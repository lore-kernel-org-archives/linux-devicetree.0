From: Roger Lu <roger.lu@mediatek.com>
Subject: [PATCH v5 0/3] PM / AVS: SVS: Introduce SVS engine
Date: Fri, 6 Sep 2019 18:05:12 +0800
Message-ID: <20190906100514.30803-1-roger.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, yt.lee@mediatek.com, Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>, Roger Lu <roger.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

1. SVS driver use OPP adjust event in [1] to update OPP table voltage part.
2. SVS dts node refers to CPU opp table [2] and GPU opp table [3].
3. SVS dts node refers to thermal efuse [4] and PMIC regulator [5].

[1] https://patchwork.kernel.org/patch/11092245/
[2] https://patchwork.kernel.org/patch/10934123/
[3] https://patchwork.kernel.org/patch/11132381/
[4] https://patchwork.kernel.org/patch/11093655/
[5] https://patchwork.kernel.org/patch/11110493/

Roger Lu (3):
  dt-bindings: soc: add mtk svs dt-bindings
  arm64: dts: mt8183: add svs device information
  PM / AVS: SVS: Introduce SVS engine

 .../devicetree/bindings/power/mtk-svs.txt     |   88 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   16 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   38 +
 drivers/power/avs/Kconfig                     |   10 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/mtk_svs.c                   | 2075 +++++++++++++++++
 include/linux/power/mtk_svs.h                 |   23 +
 7 files changed, 2251 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
 create mode 100644 drivers/power/avs/mtk_svs.c
 create mode 100644 include/linux/power/mtk_svs.h
