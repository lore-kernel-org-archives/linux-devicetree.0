From: <sean.wang@mediatek.com>
Subject: [PATCH v2 0/9] Add PMIC support to MediaTek MT7622 SoC
Date: Tue, 18 Jul 2017 17:49:20 +0800
Message-ID: <cover.1500368529.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Changes since v1:
- enhnace MT6380 regulator dt-binding document following suggestions in the v1.
- revise pwrap_init with slave programing options
- remove mt6380_get_status() and relevant accessed members
- remove debug code in mt6380_regulator_set_mode()
- make regulator driver should never modify constraints
- revise mode mapping between REGULATOR_MODE_NORMAL and
MT6380_REGULATOR_MODE

By default, the relevant board with MediaTek MT7622 SoC is equipped with
MediaTek MT6380 PMIC. So the series enables related driver allows the
MT6380 can be accessed and controlled through MediaTek PMIC wrapper by
those function drivers on MT7622 SoC.

Patch 1-2: Update dt-binding document for PMIC Wrapper and MT6380 regulator.
Patch 3:   Add a new driver for MT6380 regulator.
Patch 4-7: Update operations in PMIC Wrapper in order to adapt into MT6380.
Patch 8:   Add support of MT7622 platform for PMIC Wrapper
Patch 9:   Fix warning complained from checkpatch.pl.

Chenglin Xu (2):
  regulator: mt6380: Add support for MT6380
  soc: mediatek: pwrap: add support for MT7622 SoC

Sean Wang (7):
  dt-bindings: arm: mediatek: add MT7622 string to the PMIC wrapper doc
  dt-bindings: regulator: Add document for MediaTek MT6380 regulator
  soc: mediatek: pwrap: add pwrap_read32 for reading in 32-bit mode
  soc: mediatek: pwrap: add pwrap_write32 for writing in 32-bit mode
  soc: mediatek: pwrap: update pwrap_init without slave programming
  soc: mediatek: pwrap: add MediaTek MT6380 as one slave of pwrap
  soc: mediatek: pwrap: fixup warnings from coding style

 .../bindings/regulator/mt6380-regulator.txt        |  90 +++++
 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   4 +
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6380-regulator.c               | 359 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 416 ++++++++++++++++++---
 include/linux/regulator/mt6380-regulator.h         |  32 ++
 7 files changed, 856 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
 create mode 100644 drivers/regulator/mt6380-regulator.c
 create mode 100644 include/linux/regulator/mt6380-regulator.h

-- 
2.7.4
