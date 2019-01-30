From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH 0/6] Add Support for MediaTek PMIC MT6358 MFD Core and Regulator
Date: Wed, 30 Jan 2019 17:18:05 +0800
Message-ID: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patchset including refactoring interrupt add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

Hsin-Hsiung Wang (6):
  mfd: mt6397: extract irq related code from core driver
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  regulator: Add document for MT6358 regulator
  mfd: Add support for the MediaTek MT6358 PMIC
  regulator: mt6358: Add support for MT6358 regulator
  arm64: dts: mt6358: add PMIC MT6358 related nodes

 Documentation/devicetree/bindings/mfd/mt6397.txt   |    9 +-
 .../bindings/regulator/mt6358-regulator.txt        |  318 ++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi           |  318 ++++
 drivers/mfd/Makefile                               |    2 +-
 drivers/mfd/mt6358-irq.c                           |  236 +++
 drivers/mfd/mt6397-core.c                          |  291 +--
 drivers/mfd/mt6397-irq.c                           |  214 +++
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/mt6358-regulator.c               |  607 ++++++
 include/linux/mfd/mt6358/core.h                    |  158 ++
 include/linux/mfd/mt6358/registers.h               | 1926 ++++++++++++++++++++
 include/linux/mfd/mt6397/core.h                    |   15 +
 include/linux/regulator/mt6358-regulator.h         |   56 +
 14 files changed, 3962 insertions(+), 198 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
 create mode 100644 drivers/mfd/mt6358-irq.c
 create mode 100644 drivers/mfd/mt6397-irq.c
 create mode 100644 drivers/regulator/mt6358-regulator.c
 create mode 100644 include/linux/mfd/mt6358/core.h
 create mode 100644 include/linux/mfd/mt6358/registers.h
 create mode 100644 include/linux/regulator/mt6358-regulator.h

-- 
1.9.1
