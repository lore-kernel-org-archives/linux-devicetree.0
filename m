Return-Path: <SRS0=H47x=KR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/5] Add RZ/G2M SYSC/RST/Clock support
Date: Thu,  2 Aug 2018 15:48:17 +0100
Message-Id: <1533221302-44598-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add SYSC/RST/Clock support for 
for RZ/G2M SoC. RZ/G2M SoC is similar to R-Car Gen3 M3-W SoC.

----
V1-->V2
     * Incorporated review comments
----
Biju Das (5):
  dt-bindings: power: Add r8a774a1 SYSC power domain definitions
  soc: renesas: rcar-sysc: Add r8a774a1 support
  soc: renesas: rcar-rst: Add support for RZ/G2M
  clk: renesas: Add r8a774a1 CPG Core Clock Definitions
  clk: renesas: cpg-mssr: Add r8a774a1 support

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   9 +-
 .../bindings/power/renesas,rcar-sysc.txt           |   1 +
 .../devicetree/bindings/reset/renesas,rst.txt      |   1 +
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            | 323 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 drivers/soc/renesas/Kconfig                        |  11 +-
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/r8a774a1-sysc.c                |  45 +++
 drivers/soc/renesas/rcar-rst.c                     |   4 +-
 drivers/soc/renesas/rcar-sysc.c                    |   3 +
 drivers/soc/renesas/rcar-sysc.h                    |   1 +
 include/dt-bindings/clock/r8a774a1-cpg-mssr.h      |  58 ++++
 include/dt-bindings/power/r8a774a1-sysc.h          |  31 ++
 16 files changed, 493 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a774a1-cpg-mssr.c
 create mode 100644 drivers/soc/renesas/r8a774a1-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a774a1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774a1-sysc.h

-- 
2.7.4
