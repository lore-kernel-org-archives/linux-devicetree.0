From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v2 0/2] add basic SoC support for HiSilicon Hi3516CV300
Date: Mon, 20 Feb 2017 17:14:49 +0800
Message-ID: <1487582091-24695-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi3516CV300 is a SoC designed for HD IP camera. It has an integrated ISP and
H.265 video compression encoder. This patch set is mainly used to add basic SoC
support for Hi3516CV300.

Pan Wen (2):
  arm: hisi: add ARCH_MULTI_V5 support
  arm: dts: hisi: add dts files for Hi3516CV300 demo board

 arch/arm/boot/dts/Makefile             |   1 +
 arch/arm/boot/dts/hi3516cv300-demb.dts |  95 +++++++++
 arch/arm/boot/dts/hi3516cv300.dtsi     | 362 +++++++++++++++++++++++++++++++++
 arch/arm/mach-hisi/Kconfig             |  10 +-
 4 files changed, 462 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/hi3516cv300-demb.dts
 create mode 100644 arch/arm/boot/dts/hi3516cv300.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
