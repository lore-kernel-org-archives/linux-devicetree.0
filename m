From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/7] ARM: dts: rockchip: add Utgard Mali nodes for some socs
Date: Tue,  5 Sep 2017 12:57:32 +0200
Message-ID: <20170905105739.8330-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a mali-supply similar to the Midgard binding, the
compatibles for 3 Rockchip socs and the nodes for these.

The rk3036 and rk3188 gpus were tested, on the boards that
get their gpus enabled, using the current Lima resurrection
project and were able to probe the gpus sucessfully.

The only special thing Rockchip Malis do, is that all MMUs have
a shared interrupt and all PPs also have a shared interrupt, but
that works out well with the current binding.


Heiko Stuebner (7):
  dt-bindings: gpu: mali-utgard: Add Rockchip Utgard Malis
  dt-bindings: gpu: mali-utgard: add optional supply regulator
  ARM: dts: rockchip: add rk3036 gpu node
  ARM: dts: rockchip: enable the gpu on rk3036-kylin boards
  ARM: dts: rockchip: add rk322x gpu node
  ARM: dts: rockchip: add gpu nodes on rk3066/rk3188
  ARM: dts: rockchip: enable gpu on rk3188-radxarock

 .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 10 +++++++++
 arch/arm/boot/dts/rk3036-kylin.dts                 |  5 +++++
 arch/arm/boot/dts/rk3036.dtsi                      | 19 +++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi                     | 24 ++++++++++++++++++++++
 arch/arm/boot/dts/rk3188-radxarock.dts             |  4 ++++
 arch/arm/boot/dts/rk3188.dtsi                      | 24 ++++++++++++++++++++++
 arch/arm/boot/dts/rk322x.dtsi                      | 21 +++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                      | 11 ++++++++++
 8 files changed, 118 insertions(+)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
