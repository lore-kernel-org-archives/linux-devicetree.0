From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCHv2 0/5] Support for Marvell switches with integrated CPUs
Date: Thu,  5 Jan 2017 16:36:36 +1300
Message-ID: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Chris Brand <chris.brand-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.>
List-Id: devicetree@vger.kernel.org

The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with
integrated CPUs. They CPU block is common within these product lines and
(as far as I can tell/have been told) is based on the Armada XP. There
are a few differences due to the fact they have to squeeze the CPU into
the same package as the switch.

Chris Packham (4):
  clk: mvebu: support for 98DX3236 SoC
  arm: mvebu: support for SMP on 98DX3336 SoC
  arm: mvebu: Add device tree for 98DX3236 SoCs
  arm: mvebu: Add device tree for db-dxbc2 and db-xc3-24g4xg boards

Kalyan Kinthada (1):
  pinctrl: mvebu: pinctrl driver for 98DX3236 SoC

 Documentation/devicetree/bindings/arm/cpus.txt     |   1 +
 .../bindings/arm/marvell/98dx3236-resume-ctrl.txt  |  18 ++
 .../devicetree/bindings/arm/marvell/98dx3236.txt   |  23 ++
 .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |   1 +
 .../pinctrl/marvell,armada-98dx3236-pinctrl.txt    |  46 ++++
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi          | 247 +++++++++++++++++++++
 arch/arm/boot/dts/armada-xp-98dx3336.dtsi          |  78 +++++++
 arch/arm/boot/dts/armada-xp-98dx4251.dtsi          |  92 ++++++++
 arch/arm/boot/dts/db-dxbc2.dts                     | 159 +++++++++++++
 arch/arm/boot/dts/db-xc3-24g4xg.dts                | 155 +++++++++++++
 arch/arm/mach-mvebu/Makefile                       |   1 +
 arch/arm/mach-mvebu/common.h                       |   1 +
 arch/arm/mach-mvebu/platsmp.c                      |  43 ++++
 arch/arm/mach-mvebu/pmsu-98dx3236.c                |  69 ++++++
 drivers/clk/mvebu/Makefile                         |   2 +-
 drivers/clk/mvebu/armada-xp.c                      |  42 ++++
 drivers/clk/mvebu/clk-cpu.c                        |  33 ++-
 drivers/clk/mvebu/mv98dx3236-corediv.c             | 207 +++++++++++++++++
 drivers/pinctrl/mvebu/pinctrl-armada-xp.c          | 155 +++++++++++++
 19 files changed, 1369 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx3236-resume-ctrl.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,armada-98dx3236-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/armada-xp-98dx3236.dtsi
 create mode 100644 arch/arm/boot/dts/armada-xp-98dx3336.dtsi
 create mode 100644 arch/arm/boot/dts/armada-xp-98dx4251.dtsi
 create mode 100644 arch/arm/boot/dts/db-dxbc2.dts
 create mode 100644 arch/arm/boot/dts/db-xc3-24g4xg.dts
 create mode 100644 arch/arm/mach-mvebu/pmsu-98dx3236.c
 create mode 100644 drivers/clk/mvebu/mv98dx3236-corediv.c

-- 
2.11.0.24.ge6920cf

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
