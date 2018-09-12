Return-Path: <SRS0=GHC0=L2=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add clocks to r8a774c0
Date: Wed, 12 Sep 2018 11:41:51 +0100
Message-Id: <1536748914-27416-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series adds clock support for the RZ/G2E (a.k.a. r8a774c0),
and applies on top of renesas-devel-20180910-v4.19-rc3.

Thanks,
Fab


Fabrizio Castro (3):
  clk: renesas: Add r8a774c0 CPG Core Clock Definitions
  clk: renesas: cpg-mssr: Add r8a774c0 support
  dt-bindings: clock: renesas: cpg-mssr: Document r8a774c0

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   7 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            | 286 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a774c0-cpg-mssr.h      |  60 +++++
 7 files changed, 363 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a774c0-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a774c0-cpg-mssr.h

-- 
2.7.4
