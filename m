From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Wed,  6 May 2015 11:31:27 +0200
Message-ID: <1430904693-1404-1-git-send-email-jenskuske@gmail.com>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBEN7U6VAKGQEBFYKDYA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This patch series introduces basic kernel support for Allwinner's H3 SoC,
mainly basic clocks and pinctrl. It also adds interrupts, timers,
watchdog, RTC, dmaengine, MMC and UARTs, which are mostly compatible to
those in earlier SoCs like A23 and A31, and can simply be reused.

These patches are based on Maxime's sunxi/for-next branch from
git://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git

Patch 1 adds machine support for the H3.

Patch 2 adds support for the basic clocks. The AHB1/AHB2 split could
need some discussion.

Patch 3 adds the pin sets for the H3 main PIO. 

Patch 4 adds the H3 specific parameters to the sun6i dmaengine driver.

Patch 5 adds the DTSI for the H3.

Patch 6 adds a DT for the Orange Pi Plus SBC, which these patches
were developed and tested with.

Regards,
Jens


Jens Kuske (6):
  ARM: sunxi: Introduce Allwinner H3 support
  clk: sunxi: Add H3 clocks support
  pinctrl: sunxi: Add H3 PIO controller support
  dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant
  ARM: dts: sunxi: Add Allwinner H3 DTSI
  ARM: dts: sun8i: Add Orange Pi Plus support

 Documentation/devicetree/bindings/arm/sunxi.txt    |   1 +
 Documentation/devicetree/bindings/clock/sunxi.txt  |   7 +
 .../devicetree/bindings/dma/sun6i-dma.txt          |   5 +-
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   1 +
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts       |  82 ++++
 arch/arm/boot/dts/sun8i-h3.dtsi                    | 468 ++++++++++++++++++
 arch/arm/mach-sunxi/Kconfig                        |   2 +-
 arch/arm/mach-sunxi/sunxi.c                        |   3 +-
 drivers/clk/sunxi/clk-sunxi.c                      |  46 +-
 drivers/dma/sun6i-dma.c                            |  12 +
 drivers/pinctrl/sunxi/Kconfig                      |   4 +
 drivers/pinctrl/sunxi/Makefile                     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c           | 521 +++++++++++++++++++++
 14 files changed, 1151 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
 create mode 100644 arch/arm/boot/dts/sun8i-h3.dtsi
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-h3.c

-- 
2.3.7
