Return-Path: <SRS0=V8UA=HN=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/2] Add SCIF support
Date: Tue, 24 Apr 2018 09:56:02 +0100
Message-Id: <1524560164-30040-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series ass SCIF with DMA support to the r8a77470 SoC dtsi

This patch series tested against renesas-dev branch tag "renesas-dev-20180423-v4.17-rc2"

V1-->V2
   Added change log for ZS clock index fix.

Biju Das (2):
  ARM: dts: r8a77470: Add SCIF support
  ARM: dts: r8a77470: Add SCIF DMA support

 arch/arm/boot/dts/r8a77470.dtsi | 87 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 2 deletions(-)

-- 
2.7.4
