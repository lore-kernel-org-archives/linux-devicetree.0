Return-Path: <SRS0=kCE6=KL=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/4] Add GPIO and EAVB Pinctrl support
Date: Fri, 27 Jul 2018 10:51:25 +0100
Message-Id: <1532685089-35645-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add GPIO and EAVB Pinctrl support 
for RZ/G1C SoC.

Biju Das (4):
  gpio: rcar: Enhance gpio-ranges support
  ARM: dts: r8a77470: Add GPIO support
  ARM: dts: iwg23s-sbc: specify EtherAVB PHY IRQ
  ARM: dts: iwg23s-sbc: Add pinctl support for EtherAVB

 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 10 ++++
 arch/arm/boot/dts/r8a77470.dtsi           | 90 +++++++++++++++++++++++++++++++
 drivers/gpio/gpio-rcar.c                  | 15 ++++--
 3 files changed, 112 insertions(+), 3 deletions(-)

-- 
2.7.4
