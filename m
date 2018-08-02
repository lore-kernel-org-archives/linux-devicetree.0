Return-Path: <SRS0=H47x=KR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/5] Add GPIO and EAVB Pinctrl support
Date: Thu,  2 Aug 2018 15:11:22 +0100
Message-Id: <1533219087-33695-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add GPIO and EAVB Pinctrl support
for RZ/G1C SoC.

V1-->V2
    Add support for gpio-reserved-ranges 

Biju Das (5):
  gpio: rcar: Add GPIO hole support
  dt-bindings: gpio: rcar: Add gpio-reserved-ranges support
  ARM: dts: r8a77470: Add GPIO support
  ARM: dts: iwg23s-sbc: specify EtherAVB PHY IRQ
  ARM: dts: iwg23s-sbc: Add pinctl support for EtherAVB

 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt |  3 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          | 10 +++
 arch/arm/boot/dts/r8a77470.dtsi                    | 91 ++++++++++++++++++++++
 drivers/gpio/gpio-rcar.c                           | 30 ++++++-
 4 files changed, 133 insertions(+), 1 deletion(-)

-- 
2.7.4
