From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] Add mt6755 basic chip support
Date: Tue, 28 Jun 2016 13:15:54 +0800
Message-ID: <1467090956-31757-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds basic support for Mediatek's new 8-core chip, mt6755.
Based on 4.7-rc1

Changes in v2:
1. use evb as project suffix
2. add "disable" property for uart dts nodes
3. only alias uart0 as serial0, since we don't enable uart1

Mars Cheng (2):
  Document: DT: Add bindings for mediatek MT6755 SoC Platform
  arm64: dts: mediatek: add mt6755 support

 Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
 .../interrupt-controller/mediatek,sysirq.txt       |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6755-evb.dts        |   38 +++++
 arch/arm64/boot/dts/mediatek/mt6755.dtsi           |  145 ++++++++++++++++++++
 6 files changed, 190 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6755-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6755.dtsi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
