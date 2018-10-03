Return-Path: <SRS0=WjQe=MP=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/6] Add uSD and eMMC to iwg23s
Date: Wed,  3 Oct 2018 12:05:38 +0100
Message-Id: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Shawn Lin <shawn.lin@rock-chips.com>, Carlo Caione <carlo@endlessm.com>, Chunyan Zhang <chunyan.zhang@unisoc.com>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Arnd Bergmann <arnd@arndb.de>, Alex Smith <alex.smith@imgtec.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series includes all that is necessary for uSD and
eMMC to work on the iwg23s board, powered by the RZ/G1C
(a.k.a. r8a77470).

This work applies on top of next-20181002

Thanks,
Fab

Fabrizio Castro (6):
  dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
  pinctrl: sh-pfc: r8a77470: Add SDHI support
  mmc: renesas_sdhi: Add r8a77470 SDHI1 support
  ARM: dts: r8a77470: Add SDHI0 support
  ARM: dts: r8a77470: Add SDHI1 support
  ARM: dts: iwg23s-sbc: Add uSD and eMMC support

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |   6 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |  76 ++++++++++
 arch/arm/boot/dts/r8a77470.dtsi                    |  28 +++-
 drivers/mmc/host/Kconfig                           |   4 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |   6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              | 162 ++++++++++++++++++++-
 6 files changed, 273 insertions(+), 9 deletions(-)

-- 
2.7.4
