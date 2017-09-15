From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/8] ARM: dts: rockchip: add Utgard Mali nodes for some socs
Date: Fri, 15 Sep 2017 11:18:04 +0200
Message-ID: <20170915091812.13368-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a mali-supply similar to the Midgard binding, the
compatibles for 3 Rockchip socs and the nodes for these.

The rk3036 and rk3188 gpus were tested, on the boards that
get their gpus enabled, using the current Lima resurrection
project and were able to probe the gpus sucessfully and draw
a nice red-triangle in an off-screen application.

The only special thing Rockchip Malis do, is that all MMUs have
a shared interrupt and all PPs also have a shared interrupt, but
that works out well with the current binding.


changes in v2:
- adapt to Rob's comment for the compatibles, not sure how I could miss
  the long compatible list at the top in the first place :-)
- add Rob's Ack for patch 2 and adapt styling to match the other properties
- add power-domains as optional property


The power-domains are missing from the actual devicetree patches for now,
as the rk3036 does not have any and I just submitted power-domain support
for rk3188 in a separate series. So while the rk3188 needs a power-domain
it's driver is still in-flight :-)


Heiko Stuebner (8):
  dt-bindings: gpu: mali-utgard: Add Rockchip Utgard Malis
  dt-bindings: gpu: mali-utgard: add optional supply regulator
  dt-bindings: gpu: mali-utgard: add optional power-domain reference
  ARM: dts: rockchip: add rk3036 gpu node
  ARM: dts: rockchip: enable the gpu on rk3036-kylin boards
  ARM: dts: rockchip: add rk322x gpu node
  ARM: dts: rockchip: add gpu nodes on rk3066/rk3188
  ARM: dts: rockchip: enable gpu on rk3188-radxarock

 .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 16 +++++++++++++++
 arch/arm/boot/dts/rk3036-kylin.dts                 |  5 +++++
 arch/arm/boot/dts/rk3036.dtsi                      | 19 +++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi                     | 24 ++++++++++++++++++++++
 arch/arm/boot/dts/rk3188-radxarock.dts             |  4 ++++
 arch/arm/boot/dts/rk3188.dtsi                      | 24 ++++++++++++++++++++++
 arch/arm/boot/dts/rk322x.dtsi                      | 21 +++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi                      | 11 ++++++++++
 8 files changed, 124 insertions(+)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
