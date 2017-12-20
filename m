From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/9] Add sound support
Date: Wed, 20 Dec 2017 20:01:56 +0000
Message-ID: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This series aims to add sound support for iWave RZ/G1E board.

Biju Das (9):
  ARM: dts: r8a7745: Add audio clocks
  ARM: dts: r8a7745: Add audio DMAC support
  ARM: dts: r8a7745: Add sound support
  ARM: dts: iwg22d-sodimm: Enable SGTL5000 audio codec
  ARM: dts: iwg22d-sodimm: Sound PIO support
  ARM: dts: iwg22d-sodimm: Sound DMA support on DTS
  ARM: dts: iwg22d-sodimm: Sound DMA support via BUSIF on DTS
  ARM: dts: iwg22d-sodimm: Sound DMA support via SRC on DTS
  ARM: dts: iwg22d-sodimm: Sound DMA support via DVC on DTS

 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts |  92 +++++++++++
 arch/arm/boot/dts/r8a7745.dtsi              | 232 ++++++++++++++++++++++++++++
 2 files changed, 324 insertions(+)

-- 
1.9.1
