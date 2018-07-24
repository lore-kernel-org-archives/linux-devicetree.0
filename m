Return-Path: <SRS0=JVBZ=KI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/3] RZ/G2M SoC identification support
Date: Tue, 24 Jul 2018 16:47:15 +0100
Message-Id: <1532447238-13486-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add SoC identification support 
for RZ/G2M SoC. RZ/G2M SoC is similar to R-Car Gen3 M3-W SoC.


Biju Das (3):
  dt-bindings: arm: Document RZ/G2M SoC DT bindings
  arm64: Add Renesas R8A774A1 support
  soc: renesas: Identify RZ/G2M

 Documentation/devicetree/bindings/arm/shmobile.txt |  2 ++
 arch/arm64/Kconfig.platforms                       |  6 +++++
 drivers/soc/renesas/renesas-soc.c                  | 27 ++++++++++++++++------
 3 files changed, 28 insertions(+), 7 deletions(-)

-- 
2.7.4
