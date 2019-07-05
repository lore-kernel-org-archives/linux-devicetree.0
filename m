Return-Path: <SRS0=pYfm=VC=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/3] Add WLAN/BT support
Date: Fri,  5 Jul 2019 11:15:17 +0100
Message-Id: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This series adds WLAN/BT support for the HiHope RZ/G2M platform.

This patchset is based on renesas devel branch.

Biju Das (3):
  arm64: dts: renesas: hihope-common: Add PCA9654 I/O expander
  arm64: dts: renesas: hihope-common: Add BT support
  arm64: dts: renesas: hihope-common: Add WLAN support

 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 78 ++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

-- 
2.7.4
