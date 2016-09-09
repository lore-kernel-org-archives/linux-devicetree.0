From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH 0/8] ARM: dts: rockchip: Remove skeleton.dtsi usage and fix memory node DTC warnings
Date: Fri,  9 Sep 2016 10:01:01 -0400
Message-ID: <1473429669-6185-1-git-send-email-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Heiko,

This series removes the inclusion of the skeleton.dtsi in all the Rockchip
dts, which allows to get rid of the DTC warnings about a mismatch between
the memory nodes' unit names and reg properties.

Patches are pretty trivial and shouldn't cause functional changes AFAIK,
but were only built tested and dtbs compared with scripts/dtc/dtx_diff.

Best regards,
Javier


Javier Martinez Canillas (8):
  ARM: dts: rockchip: Remove skeleton.dtsi inclusion in rk3036.dtsi
  ARM: dts: rockchip: Remove skeleton.dtsi inclusion in rk322x.dtsi
  ARM: dts: rockchip: Remove skeleton.dtsi inclusion in rk3288.dtsi
  ARM: dts: rockchip: Remove skeleton.dtsi inclusion in rk3xxx.dtsi
  ARM: dts: rockchip: Add missing unit name to memory nodes in rk3036
    boards
  ARM: dts: rockchip: Add missing unit name to memory nodes in rk322x
    boards
  ARM: dts: rockchip: Add missing unit name to memory nodes in rk3288
    boards
  ARM: dts: rockchip: Add missing unit name to memory nodes in rk3xxx
    boards

 arch/arm/boot/dts/rk3036-evb.dts                  | 2 +-
 arch/arm/boot/dts/rk3036-kylin.dts                | 2 +-
 arch/arm/boot/dts/rk3036.dtsi                     | 4 +++-
 arch/arm/boot/dts/rk3066a-bqcurie2.dts            | 2 +-
 arch/arm/boot/dts/rk3066a-marsboard.dts           | 2 +-
 arch/arm/boot/dts/rk3066a-rayeager.dts            | 2 +-
 arch/arm/boot/dts/rk3188-radxarock.dts            | 2 +-
 arch/arm/boot/dts/rk3228-evb.dts                  | 2 +-
 arch/arm/boot/dts/rk3229-evb.dts                  | 2 +-
 arch/arm/boot/dts/rk322x.dtsi                     | 4 +++-
 arch/arm/boot/dts/rk3288-evb.dtsi                 | 2 +-
 arch/arm/boot/dts/rk3288-fennec.dts               | 2 +-
 arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 2 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi             | 2 +-
 arch/arm/boot/dts/rk3288-miqi.dts                 | 2 +-
 arch/arm/boot/dts/rk3288-popmetal.dts             | 2 +-
 arch/arm/boot/dts/rk3288-r89.dts                  | 2 +-
 arch/arm/boot/dts/rk3288-rock2-som.dtsi           | 2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi              | 2 +-
 arch/arm/boot/dts/rk3288.dtsi                     | 4 +++-
 arch/arm/boot/dts/rk3xxx.dtsi                     | 4 +++-
 21 files changed, 29 insertions(+), 21 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
