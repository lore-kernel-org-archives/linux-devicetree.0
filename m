Return-Path: <SRS0=QSCE=RW=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/2] Add HDMI support to the iwg23s
Date: Tue, 19 Mar 2019 12:21:37 +0000
Message-Id: <1552998099-22972-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series adds HDMI support to the iwg23s board.

Thanks,
Fab

Fabrizio Castro (2):
  ARM: dts: r8a77470: Add DU support
  ARM: dts: iwg23s-sbc: Add HDMI support

 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 79 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a77470.dtsi           | 32 +++++++++++++
 2 files changed, 111 insertions(+)

-- 
2.7.4
