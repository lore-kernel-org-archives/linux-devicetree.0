Return-Path: <mtk10466@mediatek.inc>
From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Mediatek pinctrl driver optimize and add Mediatek SoC Pinctrl/GPIO/EINT driver for mt6397/mt8127. 
Date: Wed, 13 May 2015 18:35:36 -0700
Message-ID: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com
List-ID: <devicetree@vger.kernel.org>

This series patches include below changes:
  - Data struct optimize and remove unused member.
  - Since several mediatek soc use similiar input enable/smt/pull setting, add those settings into common code.
  - The first version of adding Mediatek SoC Pinctrl/GPIO driver for mt6397, mt6397 has 41 pins.
  - The first version of adding Mediatek SoC Pinctrl/GPIO/EINT driver for mt8127, mt8127 has 143 pins.


Hongzhou Yang (6):
  pinctrl: mediatek: add ies/smt control to common code.
  dt-bindings: mediatek: Modify pinctrl bindings for mt6397.
  pinctrl: mediatek: Add Pinctrl/GPIO driver for mt6397.
  pinctrl: dt bindings: mt6397: Add pinfunc header file for mt6397.
  arm64: dts: mt8173-evb: Add pinctrl/GPIO node for mt6397.
  ARM: dts: mt8135-evbp1: Add pinctrl/GPIO node for mt6397.

Yingjoe Chen (4):
  pinctrl: mediatek: data struct optimize and remove unused member
  pinctrl: mediatek: add mtk_pctrl_spec_pull_set_samereg common code
  pinctrl: mediatek: add pinctrl/GPIO/EINT driver for mt8127
  ARM: dts: mt8127: add pinctrl/GPIO/EINT node for mt8127

 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    9 +-
 arch/arm/boot/dts/mt8127-pinfunc.h                 |  742 +++++++++++
 arch/arm/boot/dts/mt8127.dtsi                      |   22 +
 arch/arm/boot/dts/mt8135-evbp1.dts                 |    9 +
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |    8 +
 drivers/mfd/mt6397-core.c                          |    3 +
 drivers/pinctrl/mediatek/Kconfig                   |   12 +
 drivers/pinctrl/mediatek/Makefile                  |    2 +
 drivers/pinctrl/mediatek/pinctrl-mt6397.c          |   78 ++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c          |  359 ++++++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c          |   12 +-
 drivers/pinctrl/mediatek/pinctrl-mt8173.c          |  369 +++---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |  155 ++-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |   75 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6397.h      |  424 +++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8127.h      | 1318 ++++++++++++++++++++
 include/dt-bindings/pinctrl/mt6397-pinfunc.h       |  256 ++++
 17 files changed, 3595 insertions(+), 258 deletions(-)
 create mode 100644 arch/arm/boot/dts/mt8127-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6397.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8127.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6397.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8127.h
 create mode 100644 include/dt-bindings/pinctrl/mt6397-pinfunc.h

--
1.7.9.5
