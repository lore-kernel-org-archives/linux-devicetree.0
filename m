Return-Path: <SRS0=hFAX=SS=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/6] Add more support to RZ/G2M SoC
Date: Tue, 16 Apr 2019 16:31:51 +0100
Message-Id: <1555428717-18376-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This series adds RZ/G2M SoC dtsi support for DU, VSP, FDP,
and Tie SYS-DMAC, Audio-DMAC, Ethernet AVB to IPMMU.

This patchset is based on renesas dev branch.

Biju Das (6):
  arm64: dts: r8a774a1: Add VSP instances
  arm64: dts: r8a774a1: Add DU device to DT
  arm64: dts: renesas: r8a774a1: Add FDP1 instance
  arm64: dts: renesas: r8a774a1: Tie SYS-DMAC to IPMMU-DS0/1
  arm64: dts: renesas: r8a774a1: Tie Audio-DMAC to IPMMU-MP
  arm64: dts: renesas: r8a774a1: Connect Ethernet-AVB to IPMMU-DS0

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 169 ++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

-- 
2.7.4
