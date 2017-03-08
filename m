From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: sunxi: Remove no longer used
 pinctrl/sun4i-a10.h header
Date: Wed,  8 Mar 2017 11:28:19 +0800
Message-ID: <20170308032821.26854-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWHU7XCQKGQE4GO7O4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

This series gets rid of the last usage of the Allwinner specific pinconf
bindings, and drops inclusion of dt-bindings/pinctrl/sun4i-a10.h across
the tree.

Patch 1 gets rid of the last occurrence of Allwinner specific pinconf
properties, which is actually a GPIO pinmux.

Patch 2 drops the #include for dt-bindings/pinctrl/sun4i-a10.h with a
scripted approach.

A patch to remove the actual header file should be sent after this
series is in Linus' tree, to avoid any unwanted cross-tree dependencies.
If we want that to happen faster, maybe we could merge these as fixes.

Regards
ChenYu

Chen-Yu Tsai (2):
  ARM: dts: sun8i-a23-q8-tablet: Drop pinmux setting for codec PA gpio
  ARM: dts: sunxi: Remove no longer used pinctrl/sun4i-a10.h header

 arch/arm/boot/dts/sun4i-a10-a1000.dts                    |  1 -
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts               |  1 -
 arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts         |  1 -
 arch/arm/boot/dts/sun4i-a10-hackberry.dts                |  1 -
 arch/arm/boot/dts/sun4i-a10-inet1.dts                    |  1 -
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts             |  1 -
 arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts               |  1 -
 arch/arm/boot/dts/sun4i-a10-marsboard.dts                |  1 -
 arch/arm/boot/dts/sun4i-a10-mini-xplus.dts               |  1 -
 arch/arm/boot/dts/sun4i-a10-mk802.dts                    |  1 -
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts           |  1 -
 arch/arm/boot/dts/sun4i-a10-pcduino.dts                  |  1 -
 arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts         |  1 -
 arch/arm/boot/dts/sun4i-a10.dtsi                         |  1 -
 arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts             |  1 -
 arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts             |  1 -
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts         |  1 -
 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts            |  1 -
 arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts                 |  1 -
 arch/arm/boot/dts/sun5i-a10s.dtsi                        |  1 -
 arch/arm/boot/dts/sun5i-a13-empire-electronix-d709.dts   |  1 -
 arch/arm/boot/dts/sun5i-a13-hsg-h702.dts                 |  1 -
 arch/arm/boot/dts/sun5i-a13-licheepi-one.dts             |  1 -
 arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts          |  1 -
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts                |  1 -
 arch/arm/boot/dts/sun5i-a13.dtsi                         |  1 -
 arch/arm/boot/dts/sun5i-gr8.dtsi                         |  1 -
 arch/arm/boot/dts/sun5i.dtsi                             |  1 -
 arch/arm/boot/dts/sun6i-a31-app4-evb1.dts                |  1 -
 arch/arm/boot/dts/sun6i-a31-colombus.dts                 |  1 -
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts              |  1 -
 arch/arm/boot/dts/sun6i-a31-i7.dts                       |  1 -
 arch/arm/boot/dts/sun6i-a31-m9.dts                       |  1 -
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts         |  1 -
 arch/arm/boot/dts/sun6i-a31.dtsi                         |  1 -
 arch/arm/boot/dts/sun6i-a31s-cs908.dts                   |  2 --
 arch/arm/boot/dts/sun6i-a31s-primo81.dts                 |  1 -
 arch/arm/boot/dts/sun6i-a31s-sina31s-core.dtsi           |  1 -
 arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts |  1 -
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi     |  1 -
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                 |  1 -
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts              |  1 -
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts               |  1 -
 arch/arm/boot/dts/sun7i-a20-hummingbird.dts              |  1 -
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts                |  1 -
 arch/arm/boot/dts/sun7i-a20-icnova-swac.dts              |  1 -
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts                |  1 -
 arch/arm/boot/dts/sun7i-a20-m3.dts                       |  1 -
 arch/arm/boot/dts/sun7i-a20-mk808c.dts                   |  1 -
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts           |  1 -
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts           |  1 -
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts          |  1 -
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts          |  1 -
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts            |  1 -
 arch/arm/boot/dts/sun7i-a20-orangepi.dts                 |  1 -
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts                 |  1 -
 arch/arm/boot/dts/sun7i-a20.dtsi                         |  1 -
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                     |  1 -
 arch/arm/boot/dts/sun8i-a23-evb.dts                      |  1 -
 arch/arm/boot/dts/sun8i-a23-q8-tablet.dts                | 10 ----------
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts           |  1 -
 arch/arm/boot/dts/sun8i-a83t.dtsi                        |  2 --
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts        |  1 -
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts          |  1 -
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts                |  1 -
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts            |  1 -
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi                   |  1 -
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts                |  1 -
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts             |  1 -
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts              |  1 -
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts               |  1 -
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts              |  1 -
 arch/arm/boot/dts/sun9i-a80-optimus.dts                  |  1 -
 arch/arm/boot/dts/sun9i-a80.dtsi                         |  2 --
 arch/arm/boot/dts/sunxi-common-regulators.dtsi           |  1 -
 arch/arm/boot/dts/sunxi-reference-design-tablet.dtsi     |  1 -
 76 files changed, 88 deletions(-)

-- 
2.11.0
