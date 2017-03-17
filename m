From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/6] Rename RK1108 to RV1108
Date: Fri, 17 Mar 2017 18:18:34 +0100
Message-ID: <20170317171840.4683-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The former rk1108 got a new name: rv1108. It is still early for its
development and there are no devices in the wild, except the internal
evaluation board. So we're somewhat safe in reanming things now,
before things spread to much.

My basic idea for merging is the individual changes (pinctrl, clk)
going through the respective maintainer trees and I've added necessary
dts glue, so that it doesn't break bisectability or fail to compile
even though the internal board wouldn't care.
After the pieces are in mainline (after 4.12-rc1?) we can then just
do the dts renames.


changes in v2:
- drop mmc binding patch, which got applied
- rebased pinctrl patches onto pinctrl tree
- adapted patches, so that they don't break when applied individually
- fixed recipients (mturquette)

Andy Yan (6):
  dt-bindings: rockchip,pinctrl: rename RK1108 to RV1108
  pinctrl: rockchip: rename RK1108 to RV1108
  dt-bindings: rk1108-cru: rename RK1108 to RV1108
  clk: rockchip: rename RK1108 to RV1108
  ARM: dts: rockchip: rename core dtsi from RK1108 to RV1108
  ARM: dts: rockchip: rename RK1108-evb to RV1108-evb

 Documentation/devicetree/bindings/arm/rockchip.txt |   4 +-
 ...chip,rk1108-cru.txt => rockchip,rv1108-cru.txt} |  12 +-
 .../bindings/pinctrl/rockchip,pinctrl.txt          |  17 +-
 arch/arm/boot/dts/Makefile                         |   2 +-
 .../boot/dts/{rk1108-evb.dts => rv1108-evb.dts}    |   6 +-
 arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi}     |  24 +-
 drivers/clk/rockchip/Makefile                      |   2 +-
 .../clk/rockchip/{clk-rk1108.c => clk-rv1108.c}    | 414 ++++++++++-----------
 drivers/clk/rockchip/clk.h                         |  28 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  76 ++--
 .../clock/{rk1108-cru.h => rv1108-cru.h}           |   6 +-
 11 files changed, 299 insertions(+), 292 deletions(-)
 rename Documentation/devicetree/bindings/clock/{rockchip,rk1108-cru.txt => rockchip,rv1108-cru.txt} (83%)
 rename arch/arm/boot/dts/{rk1108-evb.dts => rv1108-evb.dts} (94%)
 rename arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi} (94%)
 rename drivers/clk/rockchip/{clk-rk1108.c => clk-rv1108.c} (57%)
 rename include/dt-bindings/clock/{rk1108-cru.h => rv1108-cru.h} (97%)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
