Return-Path: <SRS0=c6Dm=MD=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/4] Add SDHI2 support to iwg23s
Date: Fri, 21 Sep 2018 12:55:07 +0100
Message-Id: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series adds SDHI2 support to the iwg23s.
The RZ/G1C (the SoC powering the iwg23s) is slightly different from
the other R-Car and RZ/G1 devices, in the sense that this device uses
only one bit of the POC Control Register to control the voltage of the
entire interface, as opposed to one bit per pin.
There is a discussion on the ML that is going on about this:
https://patchwork.kernel.org/patch/10604395/
and the patches from this series implement "option 2".

Thanks,
Fab

Fabrizio Castro (4):
  dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
  pinctrl: sh-pfc: r8a77470: Add SDHI2 voltage switch
  ARM: dts: r8a77470: Add SDHI2 support
  ARM: dts: iwg23s-sbc: Add uSD card support

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |  1 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          | 49 ++++++++++++++++++++++
 arch/arm/boot/dts/r8a77470.dtsi                    | 15 +++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              | 32 +++++++++++++-
 4 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.7.4
