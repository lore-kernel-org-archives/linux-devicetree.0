From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] Add basic support for Allwinner A83T SOC
Date: Tue, 22 Sep 2015 23:38:53 +0800
Message-ID: <1442936337-3104-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBQXMQWYAKGQE5GEIWEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds very basic support for Allwinner A83T SOC.
Clock, peripherals, smp support will be added later.

Allwinner A83T is octa-core cortex-a7 based SoC.
It's clock control unit and prcm, pinmux are different from previous sun8i
series.
Its processor cores are arragned in two clusters 4 cores each,
similar to A80.

Patch1 This adds compatibe string for A83T
Patch2	adds PIO controller support R_PIO is yet to be added.
Patch3	adds basic dtsi
Patch4	Adds Alllwinner A83T Homletv2 board dts.

Vishnu Patekar (4):
  ARM: sunxi: Introduce Allwinner for A83T support
  pinctrl: sunxi: add allwinner A83T PIO controller support
  ARM: dts: sun8i: Add Allwinner A83T dtsi
  ARM: dts: sun8i: Add A83T HomletV2 Board by Allwinner

 Documentation/devicetree/bindings/arm/sunxi.txt    |   1 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
 arch/arm/boot/dts/Makefile                         |   5 +-
 .../boot/dts/sun8i-a83t-allwinner-homlet-v20.dts   |  69 +++
 arch/arm/boot/dts/sun8i-a83t.dtsi                  | 243 +++++++++
 arch/arm/mach-sunxi/sunxi.c                        |   1 +
 drivers/clk/sunxi/clk-sunxi.c                      |   6 +
 drivers/pinctrl/sunxi/Kconfig                      |   4 +
 drivers/pinctrl/sunxi/Makefile                     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c         | 603 +++++++++++++++++++++
 10 files changed, 932 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-a83t-allwinner-homlet-v20.dts
 create mode 100644 arch/arm/boot/dts/sun8i-a83t.dtsi
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a83t.c

-- 
1.9.1
