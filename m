From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v5 00/26] Fix watchdog on Renesas R-Car Gen2 and RZ/G1
Date: Mon, 12 Feb 2018 17:44:09 +0000
Message-ID: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear All,

this series has been around for some time as RFC, and it has collected
useful comments from the community along the way.
The solution proposed by this patch set works for most R-Car Gen2 and
RZ/G1 devices, but not all of them. We now know that for some R-Car
Gen2 early revisions there is no proper software fix. Anyway, no
product has been built around early revisions, but development boards
mounting early revisions (basically prototypes) are still out there.
As a result, this series isn't enabling the internal watchdog on R-Car
Gen2 boards, developers may enable it in board specific device trees
if needed.
This series has been tested by me on the iwg20d, iwg22d, Lager, Alt,
and Koelsch boards.

The problem
===========
To deal with SMP on R-Car Gen2 and RZ/G1, we install a reset vector
to ICRAM1 and we program the [S]BAR registers so that when we turn ON
the non-boot CPUs they are redirected to the reset vector installed by
Linux in ICRAM1, and eventually they continue the execution to RAM,
where the SMP bring-up code will take care of the rest.
The content of the [S]BAR registers survives a watchdog triggered reset,
and as such after the watchdog fires the boot core will try and execute
the SMP bring-up code instead of jumping to the bootrom code.

The fix
=======
The main strategy for the solution is to let the reset vector decide
if it needs to jump to shmobile_boot_fn or to the bootrom code.
In a watchdog triggered reset scenario, since the [S]BAR registers keep
their values, the boot CPU will jump into the newly designed reset
vector, the assembly routine will eventually test WOVF (a bit in register
RWTCSRA that indicates if the watchdog counter has overflown, the value
of this bit gets retained in this scenario), and jump to the bootrom code
which will in turn load up the bootloader, etc.
When bringing up SMP or using CPU hotplug, the reset vector will jump
to shmobile_boot_fn instead.

Thank you All for your help.

Best regards,

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

 .../devicetree/bindings/watchdog/renesas-wdt.txt   | 19 ++++++--
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
 arch/arm/mach-shmobile/headsmp.S                   | 55 ++++++++++++++++++++++
 arch/arm/mach-shmobile/platsmp-apmu.c              |  1 +
 arch/arm/mach-shmobile/pm-rcar-gen2.c              | 15 ++++--
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7790-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7791-cpg-mssr.c             |  2 +
 drivers/clk/renesas/r8a7794-cpg-mssr.c             |  2 +
 drivers/soc/renesas/rcar-rst.c                     | 35 +++++++++++---
 drivers/watchdog/renesas_wdt.c                     | 39 +++++++++++++--
 22 files changed, 229 insertions(+), 26 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
