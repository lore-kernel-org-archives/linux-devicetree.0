From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/4] support the efuse for rk3188/rk3066a SoCs and cleanup driver on nvmem.
Date: Wed, 11 Nov 2015 15:34:27 +0800
Message-ID: <1447227272-1728-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset to support reading the efuse info for more SoCs.
(Note: support 32 bits SoCs).

Meanwhile, cleanup sunxi/rockchip drivers for more readability.

You can easy to test for following:

cd /sys/bus/nvmem/devices/rockchip-efuse0
localhost rockchip-efuse0 # busybox hexdump -C nvmem



Caesar Wang (4):
  nvmem: sunxi: trivial: fix code style
  nvmem: rockchip: trivial: Make the driver more readability
  ARM: dts: rockchip: add eFuse node for rk3066a SoCs
  ARM: dts: rockchip: add eFuse node for rk3188 SoCs

 arch/arm/boot/dts/rk3066a.dtsi | 13 ++++++
 arch/arm/boot/dts/rk3188.dtsi  | 13 ++++++
 drivers/nvmem/rockchip-efuse.c | 90 ++++++++++++++++++++----------------------
 drivers/nvmem/sunxi_sid.c      |  9 ++---
 4 files changed, 71 insertions(+), 54 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
