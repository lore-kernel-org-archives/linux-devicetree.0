From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v2 0/9] Add Support for MediaTek PMIC MT6358
Date: Mon, 11 Mar 2019 11:46:22 +0800
Message-ID: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patchset including refactoring interrupt add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v1:
- refine for better code quality.
- remove of_match_table in the MT6358 regulator driver.
- some minor bug fix of mfd driver, like getting pmic id flow.
- add support for the MediaTek MT6358 RTC.

Hsin-Hsiung Wang (7):
  mfd: mt6397: clean up code
  mfd: mt6397: extract irq related code from core driver
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  regulator: Add document for MT6358 regulator
  mfd: Add support for the MediaTek MT6358 PMIC
  regulator: mt6358: Add support for MT6358 regulator
  arm64: dts: mt6358: add PMIC MT6358 related nodes

Ran Bi (2):
  rtc: mt6397: fix alarm register overwrite
  rtc: Add support for the MediaTek MT6358 RTC

 Documentation/devicetree/bindings/mfd/mt6397.txt   |   11 +-
 .../bindings/regulator/mt6358-regulator.txt        |  318 ++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi           |  318 ++++
 drivers/mfd/Makefile                               |    2 +-
 drivers/mfd/mt6358-irq.c                           |  236 +++
 drivers/mfd/mt6397-core.c                          |  289 +--
 drivers/mfd/mt6397-irq.c                           |  214 +++
 drivers/regulator/Kconfig                          |    9 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/mt6358-regulator.c               |  600 ++++++
 drivers/rtc/rtc-mt6397.c                           |   63 +-
 include/linux/mfd/mt6358/core.h                    |  158 ++
 include/linux/mfd/mt6358/registers.h               | 1926 ++++++++++++++++++++
 include/linux/mfd/mt6397/core.h                    |   15 +
 include/linux/regulator/mt6358-regulator.h         |   56 +
 15 files changed, 4000 insertions(+), 216 deletions(-)
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
