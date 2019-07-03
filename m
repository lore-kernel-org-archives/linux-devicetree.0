From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 00/25] arm64/ARM: dts: allwinner: Switch to use
 SPDX identifier
Date: Wed,  3 Jul 2019 18:15:44 +0530
Message-ID: <20190703124609.21435-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBNWH6LUAKGQEKN457EQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series to switch all Allwinner dts(i) and associate
files to use SPDX Licence identifier.

Jagan Teki (25):
  arm64: dts: allwinner: Switch A64 dts(i) to use SPDX identifier
  arm64: dts: allwinner: axp803: Switch to use SPDX identifier
  arm64: dts: allwinner: Switch H5 dts(i) to use SPDX identifier
  ARM: dts: sun4i: Switch A10 dts(i) to use SPDX identifier
  ARM: dts: sun5i: Switch A10s dts(i) to use SPDX identifier
  ARM: dts: sun5i: Switch A13 dts(i) to use SPDX identifier
  ARM: dts: sun5i: Switch GR8 dts(i) to use SPDX identifier
  ARM: dts: sun6i: Switch A31 dts(i) to use SPDX identifier
  ARM: dts: sun6i: Switch A31s dts(i) to use SPDX identifier
  ARM: dts: sun7i: Switch A20 dts(i) to use SPDX identifier
  ARM: dts: sun8i: t3-cqa3t-bv3: Remove legacy license text
  ARM: dts: sun8i: Switch A23 dts(i) to use SPDX identifier
  ARM: dts: sun8i: Switch A33 dts(i) to use SPDX identifier
  ARM: dts: sun8i: Switch A83T dts(i) to use SPDX identifier
  ARM: dts: sun8i: Switch H2+ dts to use SPDX identifier
  ARM: dts: sun8i: Switch H3 dts(i) to use SPDX identifier
  ARM: dts: sun8i: Switch R40 dts(i) to use SPDX identifier
  ARM: dts: sun8i: Switch V3s dts(i) to use SPDX identifier
  ARM: dts: sun9i: Switch A80 dts(i) to use SPDX identifier
  ARM: dts: axp152: Switch to use SPDX identifier
  ARM: dts: axp209: Switch to use SPDX identifier
  ARM: dts: axp223: Switch to use SPDX identifier
  ARM: dts: axp22x: Switch to use SPDX identifier
  ARM: dts: axp809: Switch to use SPDX identifier
  ARM: dts: axp81x: Switch to use SPDX identifier

 arch/arm/boot/dts/axp152.dtsi                 | 39 +---------------
 arch/arm/boot/dts/axp209.dtsi                 | 39 +---------------
 arch/arm/boot/dts/axp223.dtsi                 | 39 +---------------
 arch/arm/boot/dts/axp22x.dtsi                 | 39 +---------------
 arch/arm/boot/dts/axp809.dtsi                 | 39 +---------------
 arch/arm/boot/dts/axp81x.dtsi                 | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-a1000.dts         | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-ba10-tvbox.dts    | 39 +---------------
 .../boot/dts/sun4i-a10-chuwi-v7-cw0825.dts    | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts    | 39 +---------------
 .../boot/dts/sun4i-a10-dserve-dsrv9703c.dts   | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-gemei-g9.dts      | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-hackberry.dts     | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-hyundai-a7hd.dts  | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-inet1.dts         | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts     | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts  | 39 +---------------
 .../dts/sun4i-a10-itead-iteaduino-plus.dts    | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts    | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-marsboard.dts     | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-mini-xplus.dts    | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-mk802.dts         | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-mk802ii.dts       | 39 +---------------
 .../arm/boot/dts/sun4i-a10-olinuxino-lime.dts | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-pcduino.dts       | 39 +---------------
 arch/arm/boot/dts/sun4i-a10-pcduino2.dts      | 39 +---------------
 .../boot/dts/sun4i-a10-pov-protab2-ips9.dts   | 39 +---------------
 arch/arm/boot/dts/sun4i-a10.dtsi              | 39 +---------------
 arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts  | 39 +---------------
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts  | 39 +---------------
 arch/arm/boot/dts/sun5i-a10s-mk802.dts        | 39 +---------------
 .../boot/dts/sun5i-a10s-olinuxino-micro.dts   | 39 +---------------
 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts | 39 +---------------
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts      | 39 +---------------
 arch/arm/boot/dts/sun5i-a10s.dtsi             | 39 +---------------
 .../boot/dts/sun5i-a13-difrnce-dit4350.dts    | 39 +---------------
 .../dts/sun5i-a13-empire-electronix-d709.dts  | 39 +---------------
 .../dts/sun5i-a13-empire-electronix-m712.dts  | 39 +---------------
 arch/arm/boot/dts/sun5i-a13-hsg-h702.dts      | 39 +---------------
 arch/arm/boot/dts/sun5i-a13-inet-98v-rev2.dts | 39 +---------------
 arch/arm/boot/dts/sun5i-a13-licheepi-one.dts  | 39 +---------------
 .../boot/dts/sun5i-a13-olinuxino-micro.dts    | 39 +---------------
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts     | 39 +---------------
 arch/arm/boot/dts/sun5i-a13-q8-tablet.dts     | 39 +---------------
 arch/arm/boot/dts/sun5i-a13-utoo-p66.dts      | 39 +---------------
 arch/arm/boot/dts/sun5i-a13.dtsi              | 39 +---------------
 arch/arm/boot/dts/sun5i-gr8-chip-pro.dts      | 39 +---------------
 arch/arm/boot/dts/sun5i-gr8-evb.dts           | 39 +---------------
 arch/arm/boot/dts/sun5i-gr8.dtsi              | 39 +---------------
 arch/arm/boot/dts/sun5i-r8-chip.dts           | 39 +---------------
 arch/arm/boot/dts/sun5i-r8.dtsi               | 39 +---------------
 .../dts/sun5i-reference-design-tablet.dtsi    | 39 +---------------
 arch/arm/boot/dts/sun5i.dtsi                  | 39 +---------------
 arch/arm/boot/dts/sun6i-a31-app4-evb1.dts     | 39 +---------------
 arch/arm/boot/dts/sun6i-a31-colombus.dts      | 39 +---------------
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts   | 39 +---------------
 arch/arm/boot/dts/sun6i-a31-i7.dts            | 39 +---------------
 arch/arm/boot/dts/sun6i-a31-m9.dts            | 39 +---------------
 .../boot/dts/sun6i-a31-mele-a1000g-quad.dts   | 39 +---------------
 arch/arm/boot/dts/sun6i-a31.dtsi              | 39 +---------------
 .../boot/dts/sun6i-a31s-colorfly-e708-q1.dts  | 39 +---------------
 arch/arm/boot/dts/sun6i-a31s-cs908.dts        | 39 +---------------
 arch/arm/boot/dts/sun6i-a31s-inet-q972.dts    | 39 +---------------
 arch/arm/boot/dts/sun6i-a31s-primo81.dts      | 39 +---------------
 .../arm/boot/dts/sun6i-a31s-sina31s-core.dtsi | 39 +---------------
 arch/arm/boot/dts/sun6i-a31s-sina31s.dts      | 39 +---------------
 .../boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts   | 39 +---------------
 .../sun6i-a31s-yones-toptech-bs1078-v2.dts    | 39 +---------------
 arch/arm/boot/dts/sun6i-a31s.dtsi             | 39 +---------------
 .../dts/sun6i-reference-design-tablet.dtsi    | 39 +---------------
 .../boot/dts/sun7i-a20-bananapi-m1-plus.dts   | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-bananapi.dts      | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-bananapro.dts     | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts   | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts    | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-hummingbird.dts   | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts     | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-icnova-swac.dts   | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts    | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts     | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-m3.dts            | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-mk808c.dts        | 44 +------------------
 .../arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 39 +---------------
 .../arm/boot/dts/sun7i-a20-olinuxino-lime.dts | 39 +---------------
 .../dts/sun7i-a20-olinuxino-lime2-emmc.dts    | 41 +----------------
 .../boot/dts/sun7i-a20-olinuxino-lime2.dts    | 39 +---------------
 .../dts/sun7i-a20-olinuxino-micro-emmc.dts    | 41 +----------------
 .../boot/dts/sun7i-a20-olinuxino-micro.dts    | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-orangepi.dts      | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts | 39 +---------------
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts      | 39 +---------------
 .../arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 39 +---------------
 .../boot/dts/sun7i-a20-wits-pro-a20-dkt.dts   | 39 +---------------
 arch/arm/boot/dts/sun7i-a20.dtsi              | 39 +---------------
 arch/arm/boot/dts/sun8i-a23-a33.dtsi          | 39 +---------------
 arch/arm/boot/dts/sun8i-a23-evb.dts           | 39 +---------------
 arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts      | 39 +---------------
 arch/arm/boot/dts/sun8i-a23-inet86dz.dts      | 39 +---------------
 .../dts/sun8i-a23-polaroid-mid2407pxe03.dts   | 39 +---------------
 .../dts/sun8i-a23-polaroid-mid2809pxe04.dts   | 39 +---------------
 arch/arm/boot/dts/sun8i-a23-q8-tablet.dts     | 39 +---------------
 arch/arm/boot/dts/sun8i-a23.dtsi              | 39 +---------------
 arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts    | 39 +---------------
 .../arm/boot/dts/sun8i-a33-inet-d978-rev2.dts | 39 +---------------
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts     | 39 +---------------
 arch/arm/boot/dts/sun8i-a33-q8-tablet.dts     | 39 +---------------
 .../arm/boot/dts/sun8i-a33-sinlinx-sina33.dts | 39 +---------------
 arch/arm/boot/dts/sun8i-a33.dtsi              | 39 +---------------
 .../dts/sun8i-a83t-allwinner-h8homlet-v2.dts  | 39 +---------------
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  | 39 +---------------
 .../boot/dts/sun8i-a83t-cubietruck-plus.dts   | 39 +---------------
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts     | 39 +---------------
 arch/arm/boot/dts/sun8i-a83t.dtsi             | 39 +---------------
 .../boot/dts/sun8i-h2-plus-orangepi-r1.dts    | 39 +---------------
 .../boot/dts/sun8i-h2-plus-orangepi-zero.dts  | 39 +---------------
 .../boot/dts/sun8i-h3-bananapi-m2-plus.dts    | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts     | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts      | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts     | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi        | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts     | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts  | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts   | 39 +---------------
 .../boot/dts/sun8i-h3-orangepi-pc-plus.dts    | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts    | 39 +---------------
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts  | 39 +---------------
 .../arm/boot/dts/sun8i-h3-orangepi-plus2e.dts | 39 +---------------
 .../boot/dts/sun8i-h3-orangepi-zero-plus2.dts | 39 +---------------
 arch/arm/boot/dts/sun8i-h3.dtsi               | 39 +---------------
 arch/arm/boot/dts/sun8i-q8-common.dtsi        | 39 +---------------
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts  | 39 +---------------
 arch/arm/boot/dts/sun8i-r16-parrot.dts        | 39 +---------------
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 39 +---------------
 arch/arm/boot/dts/sun8i-r40.dtsi              | 39 +---------------
 .../dts/sun8i-reference-design-tablet.dtsi    | 39 +---------------
 arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts      | 38 ----------------
 .../boot/dts/sun8i-v3s-licheepi-zero-dock.dts | 39 +---------------
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 39 +---------------
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 39 +---------------
 .../boot/dts/sun8i-v40-bananapi-m2-berry.dts  | 39 +---------------
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts   | 39 +---------------
 arch/arm/boot/dts/sun9i-a80-optimus.dts       | 39 +---------------
 arch/arm/boot/dts/sun9i-a80.dtsi              | 39 +---------------
 arch/arm64/boot/dts/allwinner/axp803.dtsi     | 39 +---------------
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 39 +---------------
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 39 +---------------
 .../dts/allwinner/sun50i-a64-olinuxino.dts    | 39 +---------------
 .../dts/allwinner/sun50i-a64-orangepi-win.dts | 39 +---------------
 .../dts/allwinner/sun50i-a64-pine64-plus.dts  | 39 +---------------
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 39 +---------------
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 39 +---------------
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi | 39 +---------------
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 39 +---------------
 .../allwinner/sun50i-h5-nanopi-neo-plus2.dts  | 39 +---------------
 .../dts/allwinner/sun50i-h5-nanopi-neo2.dts   | 39 +---------------
 .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 39 +---------------
 .../allwinner/sun50i-h5-orangepi-prime.dts    | 39 +---------------
 .../sun50i-h5-orangepi-zero-plus2.dts         | 39 +---------------
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi  | 39 +---------------
 162 files changed, 163 insertions(+), 6163 deletions(-)

-- 
2.18.0.321.gffc6fa0e3
