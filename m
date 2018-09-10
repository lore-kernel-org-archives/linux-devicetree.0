Return-Path: <SRS0=Rtep=LY=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] Add RZ/G2E RST support
Date: Mon, 10 Sep 2018 16:09:39 +0100
Message-Id: <1536592181-25649-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series adds RST support for the RZ/G2E SoC.

It applies on top of renesas-devel-20180906-v4.19-rc2.

Thanks,
Fab

Fabrizio Castro (2):
  dt-bindings: reset: rcar-rst: Document r8a774c0 rst
  soc: renesas: rcar-rst: Add support for RZ/G2E

 Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
 drivers/soc/renesas/Kconfig                             | 6 +++---
 drivers/soc/renesas/rcar-rst.c                          | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.7.4
