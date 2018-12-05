Return-Path: <SRS0=5gDw=OO=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/5] Add more support to RZ/G1N
Date: Wed,  5 Dec 2018 09:06:50 +0000
Message-Id: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add support for some more interfaces to 
RZ/G1N SoC/iwg20d based board (Display and QSPI).

This patch series tested against renesas-dev.

V1--> V2
	* Add SPI NOR support : Incorporated Geert's review comment.
	* Add DU support : Removed LVDS definition from DU node.

Biju Das (5):
  ARM: dts: iwg20d-q7-common: Move cmt/rwdt node out of RZ/G1M SOM
  ARM: dts: r8a7744-iwg20m: Add SPI NOR support
  ARM: dts: r8a7744: Add DU support
  ARM: dts: r8a7743: Remove LVDS encoder from du node
  ARM: dts: r8a7744: Fix sorting of vsp and msiof nodes

 arch/arm/boot/dts/iwg20d-q7-common.dtsi |   9 ++
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi   |   9 --
 arch/arm/boot/dts/r8a7743.dtsi          |   9 +-
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi   |  26 ++++++
 arch/arm/boot/dts/r8a7744.dtsi          | 161 ++++++++++++++++----------------
 5 files changed, 121 insertions(+), 93 deletions(-)

-- 
2.7.4
