Return-Path: <SRS0=Wv3U=KW=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 0/5] Add GPIO and EAVB Pinctrl support
Date: Tue,  7 Aug 2018 08:57:01 +0100
Message-Id: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add GPIO and EAVB Pinctrl support for RZ/G1C SoC.

----
V1-->V2
  * Add support for gpio-reserved-ranges 
V2-->V3
  * Updated binding documentation
  * Rework based on Geert's comment.
----
Biju Das (5):
  gpio: rcar: Add GPIO hole support
  dt-bindings: gpio: rcar: Add gpio-reserved-ranges support
  ARM: dts: r8a77470: Add GPIO support
  ARM: dts: iwg23s-sbc: specify EtherAVB PHY IRQ
  ARM: dts: iwg23s-sbc: Add pinctl support for EtherAVB

 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt | 61 ++++++++-------
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          | 10 +++
 arch/arm/boot/dts/r8a77470.dtsi                    | 91 ++++++++++++++++++++++
 drivers/gpio/gpio-rcar.c                           |  6 ++
 4 files changed, 142 insertions(+), 26 deletions(-)

-- 
2.7.4
