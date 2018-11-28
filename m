Return-Path: <SRS0=vcRE=OH=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/5] Add more support to RZ/G1N
Date: Wed, 28 Nov 2018 16:38:26 +0000
Message-Id: <1543423111-19745-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add support for some more interfaces
to RZ/G1N SoC (IPMMU, VSP, VIN, PWM and TPU).

This patch series tested against renesas-dev.
it depends on the the below patch series.

https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=48065

Biju Das (5):
  ARM: dts: r8a7744: add VIN dt support
  ARM: dts: r8a7744: Add VSP support
  ARM: dts: r8a7744: Add IPMMU DT nodes
  ARM: dts: r8a7744: Add PWM SoC support
  ARM: dts: r8a7744: Add TPU support

 arch/arm/boot/dts/r8a7744.dtsi | 198 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

-- 
2.7.4
