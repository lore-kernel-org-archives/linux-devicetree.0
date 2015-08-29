From: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] arm64: Support Hisilicon Hip05-D02 board
Date: Sat, 29 Aug 2015 16:52:39 +0800
Message-ID: <1440838361-1468-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hip05-D02 Development Board is based on Cortex-A57, this patchset
contains initial support for Hip05-D02 Soc and Board. Initial support
is minimal and includes just the arch configuration, device tree
configuration.

PSCI is enabled in device tree and there is no problem to boot all the
16 cores, and the CPU hotplug is also working now, you can download and
compile the latest firmware based on the following link to run this
patch set.

https://github.com/hisilicon/estuary/blob/master/README

Ding Tianhong (2):
  arm64: hip05-d02: Document devicetree bindings for Hisilicon Hip05-D02
    Board
  arm64: dts: add dts files for Hisilicon Hip05-D02 Development Board

 .../bindings/arm/hisilicon/hisilicon.txt           |   4 +
 arch/arm64/boot/dts/hisilicon/Makefile             |   2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts        |  36 +++
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           | 271 +++++++++++++++++++++
 4 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05-d02.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hip05.dtsi

-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
