Return-Path: <SRS0=r14x=MU=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 0/6] Add uSD and eMMC to iwg23s
Date: Mon,  8 Oct 2018 09:51:46 +0100
Message-Id: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Adrian Hunter <adrian.hunter@intel.com>, Shawn Lin <shawn.lin@rock-chips.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, tianshuliang <tianshuliang@hisilicon.com>, Jan Glauber <jglauber@cavium.com>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Carlo Caione <carlo@endlessm.com>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Liming Sun <lsun@mellanox.com>, Arnd Bergmann <arnd@arndb.de>, Alex Smith <alex.smith@imgtec.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this new version incorporates Geert's comments.
This series applies on top of next-20181005.

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
