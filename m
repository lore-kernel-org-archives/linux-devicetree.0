Return-Path: <SRS0=l81v=UG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/3] Add PCIe support for HiHope RZ/G2M platform
Date: Fri,  7 Jun 2019 08:13:56 +0100
Message-Id: <1559891639-62529-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series adds PCIe[01] support for HiHope RZ/G2M with sub board.

This patchset is based on renesas-dev branch.

Biju Das (3):
  arm64: dts: renesas: r8a774a1: Add PCIe device nodes
  arm64: dts: renesas: hihope-common: Declare pcie bus clock
  arm64: dts: renesas: hihope-rzg2-ex: Enable PCIe support

 arch/arm64/boot/dts/renesas/hihope-common.dtsi  |  4 ++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi |  8 ++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi       | 54 +++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

-- 
2.7.4
