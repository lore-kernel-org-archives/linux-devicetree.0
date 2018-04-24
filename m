Return-Path: <SRS0=V8UA=HN=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/2] Add EtherAVB support
Date: Tue, 24 Apr 2018 16:37:31 +0100
Message-Id: <1524584253-52936-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series add EtherAVB support to r8a77470 SoC dtsi and 
iwg23s-sbc board.

Biju Das (2):
  ARM: dts: r8a77470: Add EtherAVB support
  ARM: dts: iwg23s-sbc: Add EtherAVB support

 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 15 ++++++++++++++-
 arch/arm/boot/dts/r8a77470.dtsi           | 13 +++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

-- 
2.7.4
