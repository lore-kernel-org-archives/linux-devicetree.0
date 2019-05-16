Return-Path: <SRS0=ZBEu=TQ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/2] Add WLAN/BT support
Date: Thu, 16 May 2019 09:59:24 +0100
Message-Id: <1557997166-63351-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This series adds WLAN/BT support for the CAT874 platform.

This patchset is based on renesas dev branch.

Biju Das (2):
  arm64: dts: renesas: r8a774c0-cat874: Add WLAN support
  arm64: dts: renesas: r8a774c0-cat874: Add BT support

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

-- 
2.7.4
