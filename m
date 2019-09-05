Return-Path: <SRS0=qxAe=XA=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/3] RZ/G2N SoC identification support
Date: Thu,  5 Sep 2019 10:30:40 +0100
Message-Id: <1567675844-19247-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add SoC identification support
for RZ/G2N SoC. RZ/G2N SoC is similar to R-Car Gen3 M3-N SoC.

Biju Das (3):
  dt-bindings: arm: Document RZ/G2N SoC DT bindings
  soc: renesas: Identify RZ/G2N
  arm64: Add Renesas R8A774B1 support

 Documentation/devicetree/bindings/arm/renesas.yaml | 4 ++++
 drivers/soc/renesas/Kconfig                        | 6 ++++++
 drivers/soc/renesas/renesas-soc.c                  | 8 ++++++++
 3 files changed, 18 insertions(+)

-- 
2.7.4
