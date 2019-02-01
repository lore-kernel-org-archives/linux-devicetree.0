Return-Path: <SRS0=oLYD=QI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/5] Add CMT/TMU support for RZ/G2E
Date: Fri,  1 Feb 2019 10:10:36 +0000
Message-Id: <1549015841-33536-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add CMT/TMU timer support for RZ/G2E SoC.

This patch series is tested against renesas-dev and linux-next.

Biju Das (5):
  dt-bindings: timer: renesas, cmt: Document r8a774c0 CMT support
  arm64: dts: renesas: r8a774c0: Add CMT device nodes
  clk: renesas: r8a774c0: Add TMU clock
  dt-bindings: timer: renesas: tmu: Document r8a774c0 bindings
  arm64: dts: renesas: r8a774c0: Add TMU device nodes

 .../devicetree/bindings/timer/renesas,cmt.txt      |   2 +
 .../devicetree/bindings/timer/renesas,tmu.txt      |   1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          | 135 +++++++++++++++++++++
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            |   5 +
 4 files changed, 143 insertions(+)

-- 
2.7.4
