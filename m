From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [PATCH v4 00/10] Add Support for MediaTek PMIC MT6358
Date: Mon, 5 Aug 2019 13:21:48 +0800
Message-ID: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patchset including refactoring interrupt add support to MT6358 PMIC.
MT6358 is the primary PMIC for MT8183 platform.

changes since v3:
- refine some coding style in the mt6358 interrupt setting for better
  code quality.
- refine some coding style in the mt6358 regulstor for better code
  quality.
- fix correct voltage register for vgpu.
- remove useless define in mt6397-core.c.
- add rtc node in 6358.dtsi.

Hsin-Hsiung Wang (8):
  mfd: mt6397: clean up code
  mfd: mt6397: extract irq related code from core driver
  mfd: mt6397: modify suspend/resume behavior
  dt-bindings: mfd: Add compatible for the MediaTek MT6358 PMIC
  regulator: Add document for MT6358 regulator
  mfd: Add support for the MediaTek MT6358 PMIC
  regulator: mt6358: Add support for MT6358 regulator
  arm64: dts: mt6358: add PMIC MT6358 related nodes

Ran Bi (2):
  rtc: mt6397: fix alarm register overwrite
  rtc: Add support for the MediaTek MT6358 RTC

 Documentation/devicetree/bindings/mfd/mt6397.txt   |  11 +-
 .../bindings/regulator/mt6358-regulator.txt        | 358 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi           | 362 +++++++++++++
 drivers/mfd/Makefile                               |   4 +-
 drivers/mfd/mt6358-irq.c                           | 229 ++++++++
 drivers/mfd/mt6397-core.c                          | 281 +++-------
 drivers/mfd/mt6397-irq.c                           | 214 ++++++++
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6358-regulator.c               | 580 +++++++++++++++++++++
 drivers/rtc/rtc-mt6397.c                           |  90 +++-
 include/linux/mfd/mt6358/core.h                    | 158 ++++++
 include/linux/mfd/mt6358/registers.h               | 282 ++++++++++
 include/linux/mfd/mt6397/core.h                    |  15 +
 include/linux/regulator/mt6358-regulator.h         |  56 ++
 15 files changed, 2428 insertions(+), 222 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6358.dtsi
 create mode 100644 drivers/mfd/mt6358-irq.c
 create mode 100644 drivers/mfd/mt6397-irq.c
 create mode 100644 drivers/regulator/mt6358-regulator.c
 create mode 100644 include/linux/mfd/mt6358/core.h
 create mode 100644 include/linux/mfd/mt6358/registers.h
 create mode 100644 include/linux/regulator/mt6358-regulator.h

-- 
2.6.4
