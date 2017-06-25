From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/5] ARM: Socionext MB86S71 and Fujitsu F-Cue enablement
Date: Sun, 25 Jun 2017 19:00:15 +0200
Message-ID: <20170625170020.11791-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Satoru OKAMOTO <okamoto.satoru-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.yang-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This mini-series adds initial Device Trees for the Socionext MB86S71 SoC and
the Fujitsu F-Cue board. A clk driver and a gpio driver are already merged,
although the clk driver does not build for lack of an scb mailbox driver.
I am not familiar with the circumstances of those older efforts.

My proposal is to disable the build of the clk driver for now. This allows
to introduce the Kconfig symbol without breaking the build.

With the Device Tree added here it is possible to boot into an initrd,
with one CPU core up.

Cf. https://en.opensuse.org/HCL:F-Cue

More experimental patches at:
https://github.com/afaerber/linux/commits/f-cue-next

Have a lot of fun!

Cheers,
Andreas

Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Satoru OKAMOTO <okamoto.satoru-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vincent Yang <vincent.yang-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Tetsuya Nuriya <nuriya.tetsuya-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Andreas Färber (5):
  clk: mb86s7x: Suppress build
  ARM: Prepare Socionext MB86S71
  dt-bindings: arm: Document Socionext MB86S71 and Fujitsu F-Cue
  ARM: dts: Add Socionext MB86S71 and Fujitsu F-Cue
  ARM: dts: mb86s71-f-cue: Add fake UART0 clock

 .../devicetree/bindings/arm/socionext.txt          |  17 ++
 arch/arm/Kconfig                                   |   2 +
 arch/arm/Makefile                                  |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/mb86s71-f-cue.dts                |  46 ++++++
 arch/arm/boot/dts/mb86s71.dtsi                     | 178 +++++++++++++++++++++
 arch/arm/mach-mb86s7x/Kconfig                      |  10 ++
 arch/arm/mach-mb86s7x/Makefile                     |   1 +
 drivers/clk/Makefile                               |   2 +-
 9 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/socionext.txt
 create mode 100644 arch/arm/boot/dts/mb86s71-f-cue.dts
 create mode 100644 arch/arm/boot/dts/mb86s71.dtsi
 create mode 100644 arch/arm/mach-mb86s7x/Kconfig
 create mode 100644 arch/arm/mach-mb86s7x/Makefile

-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
