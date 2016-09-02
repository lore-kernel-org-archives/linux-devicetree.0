From: Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v5 0/4] nvmem: rockchip-efuse: support more rockchip SoCs
Date: Thu,  1 Sep 2016 20:16:53 -0700
Message-ID: <1472786217-52214-1-git-send-email-finley.xiao@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tony.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Finley Xiao <finley.xiao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the timing and organization of efuse may be different                  
between rockchip SoCs, so their read function may be different.           
We add different device tree compatible string for rockchip SoCs          
to match their own read function.                                         
                                                                          
V4->V5:                                                                   
- 3/4 alter the efuse node name
- 4/4 align the macro definition
  disable clk if fail to allocate memory

Finley Xiao (4):
  nvmem: rockchip-efuse: update compatible strings for Rockchip efuse
  ARM: dts: rockchip: update compatible strings for Rockchip efuse
  arm64: dts: rockchip: add efuse0 device node for rk3399
  nvmem: rockchip-efuse: add rk3399-efuse support

 .../devicetree/bindings/nvmem/rockchip-efuse.txt   |  13 +-
 arch/arm/boot/dts/rk3066a.dtsi                     |   2 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   2 +-
 arch/arm/boot/dts/rk3288.dtsi                      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  29 +++++
 drivers/nvmem/rockchip-efuse.c                     | 133 ++++++++++++++++++---
 6 files changed, 157 insertions(+), 24 deletions(-)

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
