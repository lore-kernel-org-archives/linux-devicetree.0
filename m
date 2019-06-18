From: Roger Lu <roger.lu@mediatek.com>
Subject: PM / AVS: SVS: Introduce SVS engine
Date: Tue, 18 Jun 2019 15:02:56 +0800
Message-ID: <20190618070258.11520-1-roger.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>, Roger Lu <roger.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SVS driver use OPP adjust event in [1] to update
OPP table voltage part.

[1] https://patchwork.kernel.org/patch/10946069/

changes since v1:
- Add svs subnodes description in binding documents
- Set svs_cpu_little & svs_cci vmin to 0x18 to meet cpufreq
and cci software architecture.

Roger Lu (2):
  dt-bindings: soc: add mtk svs dt-bindings
  PM / AVS: SVS: Introduce SVS engine

 .../devicetree/bindings/power/mtk-svs.txt     |   88 +
 drivers/power/avs/Kconfig                     |   10 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/mtk_svs.c                   | 2086 +++++++++++++++++
 include/linux/power/mtk_svs.h                 |   23 +
 5 files changed, 2208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
 create mode 100644 drivers/power/avs/mtk_svs.c
 create mode 100644 include/linux/power/mtk_svs.h
