From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/3] Add basic support for Allwinner A83T SOC
Date: Wed,  6 Jan 2016 21:11:51 +0800
Message-ID: <1452085914-29340-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBJ5FWS2AKGQE2QWDWAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Re-sending after corrections, I've some more patches on top of this will send
them separately to avoid delaying this one with new comments.

This patch series adds very basic support for Allwinner A83T SOC.
Clock, peripherals, smp support will be added later.

Allwinner A83T is octa-core cortex-a7 based SoC.
It's clock control unit and prcm, pinmux are different from previous sun8i
series.
Its processor cores are arragned in two clusters 4 cores each,
similar to A80.

Note: A83T pincontroller patch is already applied by Linus, so not added in this
patch.

changes from v3->v4
1. arranged sub nodes in soc as per address.
2. removed memory node.
3. corrected style problem in dtsi.

changes from v2->v3
1. removed "Not Supported" for A83T in sunxi/README
2. removed un-unsed nodes from dtsi.
3. corrected GIC_SPI number for PH_EINT in dtsi.
4. removed address at soc node which was un-necessary.
5. corrected reg<> addresses for cpu nodes.
6. changed cpu mask to 8 in gic and archtimer node.


changes from v1->v2:
1. used UART0 header with PB9, PB10 pins.
2. removed unnecessary includes and comments from dtsi.
3. arranged nodes in alphabatical order.
4. arrnaged compatible in alphabatical order.
5. changed cpu nodes to use cpu@100 -cpu@-103.
6. changed dts filename.

Vishnu Patekar (3):
  ARM: sunxi: Introduce Allwinner for A83T support
  ARM: dts: sun8i: Add Allwinner A83T dtsi
  ARM: dts: sun8i: Add A83T HomletV2 Board by Allwinner

 Documentation/arm/sunxi/README                     |   1 -
 Documentation/devicetree/bindings/arm/sunxi.txt    |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts  |  64 +++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi                  | 204 +++++++++++++++++++++
 arch/arm/mach-sunxi/sunxi.c                        |   1 +
 drivers/clk/sunxi/clk-sunxi.c                      |   6 +
 7 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
 create mode 100644 arch/arm/boot/dts/sun8i-a83t.dtsi

-- 
1.9.1
