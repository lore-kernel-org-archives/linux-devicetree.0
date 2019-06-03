Return-Path: <SRS0=EXtB=UC=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 0/2] Fix SDR50 on iwg20d and iwg23s
Date: Mon,  3 Jun 2019 10:53:50 +0100
Message-Id: <1559555632-2258-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

SDR50 has been broken on both the iwg20d and the iwg23s since
commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors").
This patch series fixes the problem with the iWave platforms.

v1->v2:
* Removed enable-active-high property

Thanks,
Fab

Fabrizio Castro (2):
  ARM: dts: iwg20d-q7-common: Fix SDHI1 VccQ regularor
  ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator

 arch/arm/boot/dts/iwg20d-q7-common.dtsi   | 2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4
