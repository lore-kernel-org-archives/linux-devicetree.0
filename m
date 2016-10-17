From: Pan Wen <wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH 0/3] add basic SoC support for HiSilicon Hi3516CV300
Date: Mon, 17 Oct 2016 20:07:02 +0800
Message-ID: <20161017120705.3726-1-wenpan@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wenpan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi3516CV300 is a SoC designed for HD IP camera. It has an integrated ISP and
H.265 video compression encoder. This patch set is mainly used to add basic SoC
support for Hi3516CV300. It includes crg driver and basic dts files.

Pan Wen (3):
  arm: hisi: add ARCH_MULTI_V5 support
  clk: hisilicon: add CRG driver for Hi3516CV300 SoC
  dts: hisi: add dts files for Hi3516CV300 demo board

 .../devicetree/bindings/clock/hisi-crg.txt         |  50 +++
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/hi3516cv300-demb.dts             | 148 ++++++++
 arch/arm/boot/dts/hi3516cv300.dtsi                 | 397 +++++++++++++++++++++
 arch/arm/mach-hisi/Kconfig                         |  10 +-
 drivers/clk/hisilicon/Kconfig                      |   8 +
 drivers/clk/hisilicon/Makefile                     |   1 +
 drivers/clk/hisilicon/crg-hi3516cv300.c            | 330 +++++++++++++++++
 drivers/clk/hisilicon/crg.h                        |  34 ++
 include/dt-bindings/clock/hi3516cv300-clock.h      |  48 +++
 10 files changed, 1021 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hisi-crg.txt
 create mode 100644 arch/arm/boot/dts/hi3516cv300-demb.dts
 create mode 100644 arch/arm/boot/dts/hi3516cv300.dtsi
 create mode 100644 drivers/clk/hisilicon/crg-hi3516cv300.c
 create mode 100644 drivers/clk/hisilicon/crg.h
 create mode 100644 include/dt-bindings/clock/hi3516cv300-clock.h

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
