From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/11] Mediatek pinctrl driver optimize and add Mediatek SoC Pinctrl/GPIO/EINT driver for mt6397/mt8127.
Date: Mon, 18 May 2015 23:11:11 -0700
Message-ID: <1432015882-8646-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maoguang Meng <maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Due to these patches haven't sent to ML, just resend them.

Changes in v2:
  - Break mfd relate change out into a sparate patch.
  - Rearrange order of patches.

Hongzhou Yang (7):
  dt-bindings: mediatek: Modify pinctrl bindings for mt6397.
  pinctrl: dt bindings: mt6397: Add pinfunc header file for mt6397.
  pinctrl: mediatek: add ies/smt control to common code.
  pinctrl: mediatek: Add Pinctrl/GPIO driver for mt6397.
  mfd: mediatek: Add GPIO sub module support into mfd.
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
 17 files changed, 3595 insertions(+), 258 deletions(-)  create mode 100644 arch/arm/boot/dts/mt8127-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6397.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8127.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6397.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8127.h
 create mode 100644 include/dt-bindings/pinctrl/mt6397-pinfunc.h

--
1.7.9.5




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
