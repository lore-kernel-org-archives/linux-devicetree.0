Return-Path: <SRS0=tKDt=HJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/4] Add SYS-DMAC, IRQC and SCIF to SoC dtsi
Date: Fri, 20 Apr 2018 16:27:05 +0100
Message-Id: <1524238029-55315-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series add support for SYS-DMAC, External interrupt
Controller(IRQC) and SCIF wth DMA support to the r8a77470 SoC dtsi

This patch series tested against renesas-dev branch 
tag "renesas-dev-20180420-v4.17-rc1"

Biju Das (4):
  ARM: dts: r8a77470: Add SYS-DMAC support
  ARM: dts: r8a77470: Add IRQC support
  ARM: dts: r8a77470: Add SCIF support
  ARM: dts: r8a77470: Add SCIF DMA support

 arch/arm/boot/dts/r8a77470.dtsi | 173 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 2 deletions(-)

-- 
2.7.4
