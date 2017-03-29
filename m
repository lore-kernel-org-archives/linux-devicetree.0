From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v3 0/2] add dts files for hi3798cv200-Poplar board
Date: Wed, 29 Mar 2017 14:30:07 +0800
Message-ID: <1490769009-12552-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set mainly adds dts files for hi3798cv200-Poplar board.

Jiancheng Xue (2):
  dt-bindings: arm: hisilicon: add bindings for hi3798cv200 SoC and
    Poplar board
  arm64: dts: hisilicon: add dts files for hi3798cv200-poplar board

 .../bindings/arm/hisilicon/hisilicon.txt           |   4 +
 arch/arm64/boot/dts/hisilicon/Makefile             |   1 +
 .../boot/dts/hisilicon/hi3798cv200-poplar.dts      | 163 +++++++++
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     | 405 +++++++++++++++++++++
 4 files changed, 573 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
