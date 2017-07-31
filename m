From: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] PINCTRL: Mediatek pinctrl driver for mt2712
Date: Mon, 31 Jul 2017 16:22:10 +0800
Message-ID: <1501489333-23145-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series includes three patches:
1.Add mt2712 compatible node in binding document.
2.Add mt2712 pinctrl device node.
3.Add mt2712 pinctrl driver.

Zhiyong Tao (3):
  dt-bindings: pinctrl: mt2712: add binding document
  arm64: dts: mt2712: add pintcrl device node.
  pinctrl: add mt2712 pinctrl driver

 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h      | 1014 +++++++++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi          |   18 +
 drivers/pinctrl/mediatek/Kconfig                   |    8 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt2701.c          |   21 +-
 drivers/pinctrl/mediatek/pinctrl-mt2712.c          |  670 +++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   16 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h      |   44 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h      | 1858 ++++++++++++++++++++
 10 files changed, 3619 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt2712.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt2712.h

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
