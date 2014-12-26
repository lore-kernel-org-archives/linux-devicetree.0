From: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/3] Add Reset Controller for MediaTek SoC
Date: Fri, 26 Dec 2014 17:05:48 +0800
Message-ID: <1419584751-18149-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Dongdong Cheng <dongdong.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, HenryC Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Menghui Lin <menghui.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chen Zhong <chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
This driver implements the reset controller for MediaTek SoC.
It adds support for MT8135 and MT8173 SoC in the patch set.
The reset controller uses syscon as its regmap and adopts syscon RFC in https://lkml.org/lkml/2014/11/3/134.

This driver is based on 3.19-rc1.

Changes since v3
================
1. Merge patch set by 3.19-rc1.
2. Add header file "mt8173-resets.h" for supported resets in MT8173.

Changes since v2
================
- Correct #size-cell to be 1.
- Add header file "mt8135-resets.h" for supported resets in MT8135.

Changes since v1
================
(1) Patch 1/3: Update reset controller driver's implementation. 
  - rename mt_ prefixes to the prefix mtk_
  - use module_platform_driver() macro for driver init.
  - clean up includes of header files.
  - reset controll is a child of syscon. Get regamp through its parent node.
  - rename data->size to data->num_regs. It is number of registers in syscon for reset usage. 
(2) Patch 2/3: update bindings document according to new dts layout of reset-controller. 
(3) Patch 3/3: change reset-controller device node as child of syscon. 

Flora Fu (3):
  reset: mediatek: Add Reset Controller for MediaTek SoC
  dt-bindings: Add Reset Controller for MediaTek SoC
  arm: dts: mt8135: Add Reset Controller for MediaTek SoC

 .../devicetree/bindings/reset/mediatek,reset.txt   |  52 +++++++++
 arch/arm/boot/dts/mt8135.dtsi                      |  29 +++++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-mtk.c                          | 130 +++++++++++++++++++++
 .../dt-bindings/reset-controller/mt8135-resets.h   |  64 ++++++++++
 .../dt-bindings/reset-controller/mt8173-resets.h   |  63 ++++++++++
 6 files changed, 339 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,reset.txt
 create mode 100644 drivers/reset/reset-mtk.c
 create mode 100644 include/dt-bindings/reset-controller/mt8135-resets.h
 create mode 100644 include/dt-bindings/reset-controller/mt8173-resets.h

--
1.8.1.1.dirty


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
