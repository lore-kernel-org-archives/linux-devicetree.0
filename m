From: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] add support for Firefly-RK3288 and Rayeager PX2 boards
Date: Sat, 17 Jan 2015 12:08:57 +0900
Message-ID: <1421464140-29903-1-git-send-email-naobsd@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for following Rockchip SoC based boards.

 - Firefly, Firefly-RK3288 (both beta and mass production version)
 - ChipSPARK, Rayeager PX2

Changes in v3:
- fix ordering more
- fix clock-* properties
- enable tsadc with clock-* properties

Changes in v2:
- use own compatible property for Firefly-RK3288 beta version
- remove disabled tsadc node
- add missing vin-supply
- use two chars for i2c address
- fix ordering for the nodes without address element
- add commit messages

FUKAUMI Naoki (3):
  dt-bindings: add vendor prefix and root compatible property for
    Rockchip boards
  ARM: dts: rockchip: add dts for Firefly Firefly-RK3288 boards
  ARM: dts: rockchip: add dts for ChipSPARK Rayeager PX2 board

 Documentation/devicetree/bindings/arm/rockchip.txt |  10 +
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 arch/arm/boot/dts/Makefile                         |   5 +-
 arch/arm/boot/dts/rk3066a-rayeager.dts             | 468 +++++++++++++++++++
 arch/arm/boot/dts/rk3288-firefly-beta.dts          |  71 +++
 arch/arm/boot/dts/rk3288-firefly.dts               |  71 +++
 arch/arm/boot/dts/rk3288-firefly.dtsi              | 500 +++++++++++++++++++++
 7 files changed, 1126 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rk3066a-rayeager.dts
 create mode 100644 arch/arm/boot/dts/rk3288-firefly-beta.dts
 create mode 100644 arch/arm/boot/dts/rk3288-firefly.dts
 create mode 100644 arch/arm/boot/dts/rk3288-firefly.dtsi

-- 
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
