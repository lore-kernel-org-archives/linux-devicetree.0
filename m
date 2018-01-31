From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [RFC v4 00/26] Fix watchdog on Renesas R-Car Gen2 and RZ/G1
Date: Wed, 31 Jan 2018 18:24:04 +0000
Message-ID: <1517423070-24236-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear All,

the forth version of this series aims at consolidating the watchdog fix.
There is a discussion still in progress about the changes to the
watchdog driver, please see the following for more information:
https://patchwork.kernel.org/patch/10192435/

It doesn't look like leaving the restart handler in for Gen3 is going
to do any harm (but it may be unwelcome), perhaps esplicitly setting
its priority to a medium level (128) will help its adoption on Gen3
as well? This is what this particular version is proposing.

Also, although the latest implmentation of the reset vector hasn't
raised any problem so far, it hasn't received any feedback either.
Please do look into it to espose problems and weaknesses (if any).

Finally, it would be great if someone could test this patch set on his
Gen2/Gen3/RZ/G1 board, and it would be awesome if that board was a
Lager with all of the cores enabled and working at the same time ;-)

Best Regards,

Fabrizio Castro (26):
  ARM: shmobile: Add watchdog support
  ARM: dts: r8a7743: Adjust SMP routine size
  ARM: dts: r8a7745: Adjust SMP routine size
  ARM: dts: r8a7790: Adjust SMP routine size
  ARM: dts: r8a7791: Adjust SMP routine size
  ARM: dts: r8a7792: Adjust SMP routine size
  ARM: dts: r8a7793: Adjust SMP routine size
  ARM: dts: r8a7794: Adjust SMP routine size
  soc: renesas: rcar-rst: Enable watchdog as reset trigger for Gen2
  ARM: shmobile: rcar-gen2: Add watchdog support
  dt-bindings: watchdog: renesas-wdt: Add R-Car Gen2 support
  watchdog: renesas_wdt: Add R-Car Gen2 support
  watchdog: renesas_wdt: Add restart handler
  ARM: shmobile: defconfig: Enable RENESAS_WDT_GEN
  clk: renesas: r8a7743: Add rwdt clock
  clk: renesas: r8a7745: Add rwdt clock
  clk: renesas: r8a7790: Add rwdt clock
  clk: renesas: r8a7791/r8a7793: Add rwdt clock
  clk: renesas: r8a7794: Add rwdt clock
  ARM: dts: r8a7743: Add watchdog support to SoC dtsi
  ARM: dts: r8a7745: Add watchdog support to SoC dtsi
  ARM: dts: r8a7790: Add watchdog support to SoC dtsi
  ARM: dts: r8a7791: Add watchdog support to SoC dtsi
  ARM: dts: r8a7794: Add watchdog support to SoC dtsi
  ARM: dts: iwg20m: Add watchdog support to SoM dtsi
  ARM: dts: iwg22m: Add watchdog support to SoM dtsi

 .../devicetree/bindings/watchdog/renesas-wdt.txt   | 19 +++++--
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi              |  5 ++
 arch/arm/boot/dts/r8a7743.dtsi                     | 12 ++++-
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi              |  5 ++
 arch/arm/boot/dts/r8a7745.dtsi                     | 12 ++++-
 arch/arm/boot/dts/r8a7790.dtsi                     | 12 ++++-
 arch/arm/boot/dts/r8a7791.dtsi                     | 12 ++++-
 arch/arm/boot/dts/r8a7792.dtsi                     |  2 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |  2 +-
 arch/arm/boot/dts/r8a7794.dtsi                     | 12 ++++-
 arch/arm/configs/shmobile_defconfig                |  1 +
 arch/arm/mach-shmobile/common.h                    |  6 +++
 arch/arm/mach-shmobile/headsmp.S                   | 55 +++++++++++++++++++
 arch/arm/mach-shmobile/platsmp-apmu.c              |  1 +
 arch/arm/mach-shmobile/pm-rcar-gen2.c              | 13 +++--
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7790-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7791-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7794-cpg-mssr.c             |  2 +
 drivers/soc/renesas/rcar-rst.c                     | 35 +++++++++---
 drivers/watchdog/renesas_wdt.c                     | 62 ++++++++++++++++++++--
 22 files changed, 250 insertions(+), 26 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
