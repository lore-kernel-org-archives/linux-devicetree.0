Return-Path: <SRS0=HlV8=LZ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/2] Add RZ/G1N PFC driver.
Date: Tue, 11 Sep 2018 11:30:03 +0100
Message-Id: <1536661805-36464-1-git-send-email-biju.das@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add support for RZ/G1N (R8A7744) PFC driver.

RZ/G1N SoC is similar to RZ/G1M and R-Car Gen2 M2-W/M2-N SoC.

This patchset is based on renesas-devel-20180906-v4.19-rc2.

Biju Das (2):
  dt-bindings: pinctrl: sh-pfc: Document r8a7744 PFC support
  pinctrl: sh-pfc: r8a7791: Add r8a7744 support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |  1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |  5 +++++
 drivers/pinctrl/sh-pfc/Makefile                    |  1 +
 drivers/pinctrl/sh-pfc/core.c                      |  6 ++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c               | 22 ++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  1 +
 6 files changed, 36 insertions(+)

-- 
2.7.4
