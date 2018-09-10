Return-Path: <SRS0=Rtep=LY=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add RZ/G2E SYSC support
Date: Mon, 10 Sep 2018 15:41:25 +0100
Message-Id: <1536590488-23270-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series adds SYSC support for RZ/G2E SoC (a.k.a. r8a774c0).

Thanks,
Fab

Fabrizio Castro (3):
  dt-bindings: power: Add r8a774c0 SYSC power domain definitions
  soc: renesas: rcar-sysc: Add r8a774c0 support
  dt-bindings: power: rcar-sysc: Document r8a774c0 sysc

 .../bindings/power/renesas,rcar-sysc.txt           |  1 +
 drivers/soc/renesas/Kconfig                        |  5 ++
 drivers/soc/renesas/Makefile                       |  1 +
 drivers/soc/renesas/r8a774c0-sysc.c                | 68 ++++++++++++++++++++++
 drivers/soc/renesas/rcar-sysc.c                    |  3 +
 drivers/soc/renesas/rcar-sysc.h                    |  1 +
 include/dt-bindings/power/r8a774c0-sysc.h          | 25 ++++++++
 7 files changed, 104 insertions(+)
 create mode 100644 drivers/soc/renesas/r8a774c0-sysc.c
 create mode 100644 include/dt-bindings/power/r8a774c0-sysc.h

-- 
2.7.4
