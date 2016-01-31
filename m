From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/14] Add A83T clk, r_pio, mmc rsb support
Date: Sun, 31 Jan 2016 09:20:52 +0800
Message-ID: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBD6DWW2QKGQE4NP3MZA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org
Cc: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,
This series adds further support for A83T, mainly adds clock support.
Also adds R_PIO, PRCM related clocks, mmc, rsb support.

A83T difference in short:
R_PIO is slightly different from A23 r_pio. AHB1 has different parents as
compared to a31-ahb1, APB1 has different dividers.Bus gates are similar to H3,
apb0 gates are different.mmc and rsb are compatible with earlier sunxi socs.

Patch 1: adds support for r_pio pin controller.

patch 2: adds PRCM apb0 clock gates, it controls prcm related clocks.

patch 3: adds bus gates which are similar to h3, it's not clearly known which
clocks belongs to which parent.

patch 4: adds ahb1 clock support, 0b1x is pll6 parent otherwise it's same as a31
ahb1.

patch 5: adds apb1 clock support, apb1 has different dividers compared to a10 
apb0 clock.

patch 6: this patch is form wens, a83t has 16M internal oscillator, to get 
aproximately 32k clock, it's divided by 512.

patch 7: adds basics clocks nodes to dtsi, pll6, ahb1, ahb2, apb1, apb2,
bus gates, and resets.

patch 8-9: adds mmc and it's clock nodes.

patch 10: adds A83T PRCM related clocks, clock resets.

patch 11: adds r_pio pin controller nodes to dtsi

patch 12: adds RSB nodes to dtsi

patch 13: enables mmc0 support for h8homlet board, tested by LABBE Corentin.

patch 14: This patch adds support for Sinovoip BPI-M3 A83T based board, it has 
2GB LPDDR3, u-boot support is added recently for this board.


Regards,
Vishnu

Chen-Yu Tsai (1):
  ARM: dts: sun8i-a83t: Correct low speed oscillator clocks

Vishnu Patekar (13):
  pinctrl: sunxi: Add A83T R_PIO controller support
  clk: sunxi: Add apb0 gates for A83T
  clk: sunxi: add bus gates for A83T
  clk: sunxi: add ahb1 clock for A83T
  clk: sunxi: Add APB1 clock for A83T
  ARM: dts: sun8i-a83t: Add basic clocks and resets
  ARM: dts: sun8i-a83t: add mmc clock nodes
  ARM: dts: sun8i-a83t: Add mmc controller nodes
  ARM: dts: sun8i-a83t: Add PRCM related clocks and resets
  ARM: dts: sun8i-a83t: Add R_PIO controller node to the dtsi
  ARM: dts: sun8i-a83t: Add RSB nodes to dtsi
  ARM: dts: sun8i: enable mmc for H8Homlet Board.
  ARM: dts: sun8i: Add A83T based Sinovoip Bpi-M3 Board

 Documentation/devicetree/bindings/clock/sunxi.txt  |   4 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts  |  20 ++
 ...omlet-v2.dts => sun8i-a83t-sinovoip-bpi-m3.dts} |  28 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                  | 314 ++++++++++++++++++++-
 drivers/clk/sunxi/clk-simple-gates.c               |   2 +
 drivers/clk/sunxi/clk-sun8i-bus-gates.c            |   2 +
 drivers/clk/sunxi/clk-sunxi.c                      |  92 ++++++
 drivers/pinctrl/sunxi/Kconfig                      |   5 +
 drivers/pinctrl/sunxi/Makefile                     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c       | 119 ++++++++
 12 files changed, 582 insertions(+), 7 deletions(-)
 copy arch/arm/boot/dts/{sun8i-a83t-allwinner-h8homlet-v2.dts => sun8i-a83t-sinovoip-bpi-m3.dts} (79%)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t-r.c

-- 
1.9.1
