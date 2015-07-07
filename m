From: <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/2] Add mt6580 basic chip support
Date: Tue, 7 Jul 2015 15:56:09 +0800
Message-ID: <1436255771-5367-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds basic support for Mediatek's new 4-core chip, mt6580.
Based on v4.2-rc1.

This patch add basic support for Mediatek's new 4-core chip, mt6580.
Changes in v3:
1. Remove useless Change-Id
2. Add complete device tree binding in Documentation

Changes in v2:
1. Use stdout-path in device tree to indicate console
2. Remove board-specific bootargs

Mars Cheng (2):
  Document: DT: Add bindings for mediatek MT6580 SoC Platform
  ARM: dts: mediatek: add mt6580 basic support

 Documentation/devicetree/bindings/arm/mediatek.txt |   4 +
 .../bindings/arm/mediatek/mediatek,sysirq.txt      |   1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |   3 +-
 .../bindings/timer/mediatek,mtk-timer.txt          |   6 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/mt6580-evbp1.dts                 |  35 ++++++
 arch/arm/boot/dts/mt6580.dtsi                      | 123 +++++++++++++++++++++
 7 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/mt6580-evbp1.dts
 create mode 100644 arch/arm/boot/dts/mt6580.dtsi

--
1.8.1.1.dirty
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
