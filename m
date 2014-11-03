From: Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/3] Add Reset Controller for MediaTek SoC
Date: Mon, 3 Nov 2014 17:02:48 +0800
Message-ID: <1415005371-4323-1-git-send-email-flora.fu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
The patch modification is base on https://lkml.org/lkml/2014/5/27/422

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

This driver is based on 3.18-rc1.

Flora Fu (3):
  ARM: mediatek: Add Reset Controller for MediaTek SoC
  dt-bindings: Add Reset Controller for MediaTek SoC
  ARM: dts: mt8135: Add Reset Controller for MediaTek SoC

 .../devicetree/bindings/reset/mediatek,reset.txt   |  45 +++++++
 arch/arm/boot/dts/mt8135.dtsi                      |  26 ++++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-mtk.c                          | 131 +++++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,reset.txt
 create mode 100644 drivers/reset/reset-mtk.c

--
1.8.1.1.dirty


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
