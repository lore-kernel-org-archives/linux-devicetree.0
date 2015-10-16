From: <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] Mediatek EFUSE Support
Date: Fri, 16 Oct 2015 16:39:08 +0800
Message-ID: <1444984751-4572-1-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds EFUSE support driver which is used by other drivers
like thermal sensor and HDMI impedance.

There are some efuses these fuses store things like calibration data,
speed bins.. etc. Drivers like thermal sensor, HDMI impedance would
read out this data for configuring the driver.

Andrew-CT Chen (3):
  dt-bindings: add document of mediatek efuse driver
  nvmem: mediatek: Add Mediatek EFUSE driver
  dts: arm64: Add EFUSE device node

 .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 +++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  5 ++
 drivers/nvmem/Kconfig                              | 11 +++
 drivers/nvmem/Makefile                             |  1 +
 drivers/nvmem/mtk-efuse.c                          | 89 ++++++++++++++++++++++
 5 files changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
 create mode 100644 drivers/nvmem/mtk-efuse.c

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
