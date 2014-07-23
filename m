From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 0/6] ARM: sunxi: RTC support for A31/A23
Date: Wed, 23 Jul 2014 22:38:52 +0800
Message-ID: <1406126338-15062-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBBESX6PAKGQE4YXRQ4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is v2 of the sun6i RTC series. This series adds support for
the RTC in A31 and A23 SoCs. The series applies to sunxi-next.

The A31 has a new RTC block that is separate from the timer block.
It has separate interrupts for each of the alarms, and a different
format for the counter alarm. The driver has been tested on the
A31 Hummingbird, and the A23 tablet I'm using to work on sun8i
support.

Patch 1 adds the driver for the RTC.

Patch 2 is a minor cleanup. This makes rtc-sunxi depend on sun4i or
sun7i, the 2 platforms the driver is actually used on.

Patch 3 adds the RTC device node to the sun6i DTSI.

Patch 4 adds the RTC device node to the sun8i DTSI.

Patch 5 adds enables rtc-sun6i in the sunxi defconfig.

Patch 6 adds enables rtc-sun6i in the multi_v7 defconfig.
This patch applies to arm-soc/next/defconfig (e9a86d96)

Changes since v1:
  - Enable rtc-sun6i in multi_v7_defconfig
  - Cleanup the time/date GET/SET macros
  - Use GENMASK for control register mask
  - Change Kconfig option to show 'A31'
  - Remove leftover comment from rtc-sun4i
  - Remove extra newline


Cheers
ChenYu



Chen-Yu Tsai (6):
  rtc: sun6i: Add sun6i RTC driver
  rtc: sunxi: Depend on platforms sun4i/sun7i that actually have the rtc
  ARM: dts: sun6i: add rtc device node
  ARM: dts: sun8i: add rtc device node
  ARM: sunxi: Add A31 RTC driver to sunxi_defconfig
  ARM: sunxi: Add A31 RTC driver to multi_v7_defconfig

 .../devicetree/bindings/rtc/sun6i-rtc.txt          |  17 +
 arch/arm/boot/dts/sun6i-a31.dtsi                   |   6 +
 arch/arm/boot/dts/sun8i-a23.dtsi                   |   6 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 arch/arm/configs/sunxi_defconfig                   |   1 +
 drivers/rtc/Kconfig                                |   9 +-
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-sun6i.c                            | 448 +++++++++++++++++++++
 8 files changed, 488 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
 create mode 100644 drivers/rtc/rtc-sun6i.c

-- 
2.0.1
