Return-Path: <SRS0=c6Dm=MD=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Add RZ/G1C and RZ/G1N I2C related support
Date: Fri, 21 Sep 2018 18:36:57 +0100
Message-Id: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series documents the I2C controllers found in the RZ/G1C and
RZ/G1N, and also adds I2C4 support to the RZ/G1C SoC specific dtsi.

Thanks,
Fab

Biju Das (2):
  dt-bindings: i2c: rcar: Document r8a7744 support
  dt-bindings: i2c: sh_mobile: Document r8a7744 support

Fabrizio Castro (2):
  dt-bindings: i2c: rcar: Add r8a77470 support
  ARM: dts: r8a77470: Add I2C4 support

 Documentation/devicetree/bindings/i2c/i2c-rcar.txt      |  2 ++
 Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt |  1 +
 arch/arm/boot/dts/r8a77470.dtsi                         | 14 ++++++++++++++
 3 files changed, 17 insertions(+)

-- 
2.7.4
