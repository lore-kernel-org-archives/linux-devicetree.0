From: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2 0/4] rockchip: Add efuse support for RK3368 SoCs
Date: Mon,  4 Sep 2017 10:51:15 +0200
Message-ID: <20170904085119.25981-1-romain.perier@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: philipp.tomsich-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This set of patches exports the right clocks, add required functions
and data, and definition for enabling and supporting eFuse on RK3368
SoCs.

Note: On my geekbox rk3368, I was unable to flash a working upstream ATF
or upstream uboot (missing support for LPDDR3 init and timping). I cannot
test the driver without the secure mode for this efuse on my hardware.So
I am asking for testing. I think that it should work like on rk3288

Changes in v2:
- Removed ARM SMC calls for efuse, we need to do as upstream ATF and
  uboot mainline do, so no secure-regs for efuse

Romain Perier (4):
  clk: rockchip: add clock id for PCLK_EFUSE256 of RK3368 SoCs
  clk: rockchip: export clock pclk_efuse_256 for RK3368 SoCs
  nvmem: rockchip: add support for RK3368
  arm64: dts: rockchip: add efuse for RK3368 SoCs

 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt |  1 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi                   | 14 ++++++++++++++
 drivers/clk/rockchip/clk-rk3368.c                          |  2 +-
 drivers/nvmem/rockchip-efuse.c                             |  4 ++++
 include/dt-bindings/clock/rk3368-cru.h                     |  1 +
 5 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
