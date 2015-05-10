From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/6] Introduce Allwinner A33 support
Date: Sun, 10 May 2015 12:16:17 +0530
Message-ID: <1431240383-12763-1-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBXP5XOVAKGQEMQE3Q7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello everyone,

This patch series introduces basic kernel support for Allwinner's A33 SoC,

A33 is very similar to A23. 
mainly adds common sun8i dtsi, a33 pinctrl. It also adds interrupts, timers,
watchdog, RTC, and UARTs, which are mostly compatible to
those in earlier SoCs like A23 and A31, and can simply be reused.

These patches are based on
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Patch 1 adds machine support for the A33.

Patch 2 adds the pin sets for the A33 main PIO.

Patch 3 adds support to reuse A23 clocks. A33 specific clocks not yet implemented.

Patch 4 adds common sun8i.dtsi, modified sun8i-a23.dtsi and a23 based dts, I've referred the h3 dtsi 
by Jens Kuske.
removed the checkpatch warning related to Linux Foundation address in dtsi,dts.

Patch 5 adds the DTSI for the A33, based on common sun8i.dtsi.

Patch 6 adds a DT for the ET_Q8_A33 tablet, which these patches
were developed and tested with.

Vishnu Patekar (6):
  ARM: sunxi: Add Machine support for A33
  pinctrl: sunxi: add allwinner A33 PIO controller support
  clk: sunxi: Add A33 clock for compilation
  ARM: dts: sunxi: add common sun8i dtsi
  ARM: dts: sunxi: Add Allwinner A33 DTSI
  ARM: dts: sun8i: Add ET-Q8 A33 support

 Documentation/devicetree/bindings/arm/sunxi.txt    |   1 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   2 +
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v1.2.dts      |   6 +-
 arch/arm/boot/dts/sun8i-a23-ippo-q8h-v5.dts        |   6 +-
 arch/arm/boot/dts/sun8i-a23.dtsi                   | 432 +----------------
 arch/arm/boot/dts/sun8i-a33-et-q8.dts              | 108 +++++
 arch/arm/boot/dts/sun8i-a33.dtsi                   | 217 +++++++++
 arch/arm/boot/dts/sun8i.dtsi                       | 481 +++++++++++++++++++
 arch/arm/mach-sunxi/Kconfig                        |   2 +-
 arch/arm/mach-sunxi/platsmp.c                      |   2 +-
 arch/arm/mach-sunxi/sunxi.c                        |   4 +-
 drivers/clk/sunxi/clk-sunxi.c                      |   1 +
 drivers/pinctrl/sunxi/Kconfig                      |   5 +
 drivers/pinctrl/sunxi/Makefile                     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          | 513 +++++++++++++++++++++
 16 files changed, 1340 insertions(+), 444 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-a33-et-q8.dts
 create mode 100644 arch/arm/boot/dts/sun8i-a33.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i.dtsi
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c

-- 
1.9.1
