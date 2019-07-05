Return-Path: <SRS0=D4jh=VC=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add HDMI audio support to the HiHope RZ/G2[MN]
Date: Fri,  5 Jul 2019 14:39:36 +0100
Message-Id: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series adds HDMI audio support to the HiHope RZ/G2[MN].

Thanks,
Fab

Fabrizio Castro (3):
  arm64: dts: renesas: r8a774a1: Use extended audio dmac register
  arm64: dts: renesas: r8a774a1: Add SSIU support for sound
  arm64: dts: renesas: hihope-common: Add HDMI audio support

 arch/arm64/boot/dts/renesas/hihope-common.dtsi |  48 +++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi      | 253 +++++++++++++++++++++++--
 2 files changed, 280 insertions(+), 21 deletions(-)

-- 
2.7.4
