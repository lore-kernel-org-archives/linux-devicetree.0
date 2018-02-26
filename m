From: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: [PATCH v2 0/4] PINCTRL: Mediatek pinctrl driver for mt2712
Date: Mon, 26 Feb 2018 16:33:58 +0800
Message-ID: <1519634042-12063-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, matthias.bgg@gmail.com
Cc: srv_heupstream@mediatek.com, liguo.zhang@mediatek.com, yingjoe.chen@mediatek.com, hongkun.cao@mediatek.com, biao.huang@mediatek.com, yt.shen@mediatek.com, hongzhou.yang@mediatek.com, erin.lo@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series includes four patches:
1.Add mt2712 pintcrl head file
2.Add mt2712 pinctrl device node.
3.Add mt2712 pinctrl driver.
4.Support bias-disable of generic and special pins simultaneously

Changes in patch v2:
1)Separate patch4 for supporting bias-disable of generic and special pins.
2)GPIO16~17 direction setting is changed as generic pins in mt2712 E2,
  So remove GPIO16~17 special direction setting and remove apmixedsys node in pinctrl device node.
3)Add pinmux define in "mt2712-pinfunc.h" and "pinctrl-mtk-mt2712.h" for mt2712 E2 design.

Zhiyong Tao (4):
  arm64: dts: mt2712: add pintcrl file
  arm64: dts: mt2712: add pintcrl device node.
  pinctrl: add mt2712 pinctrl driver
  pintcrl: support bias-disable of generic and special pins
    simultaneously

 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h | 1129 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   18 +
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  639 ++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |   13 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h | 1973 +++++++++++++++++++++++++
 7 files changed, 3778 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt2712.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h

--
1.8.1.1.dirty
