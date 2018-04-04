Return-Path: <SRS0=18ew=GZ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/2] Add Renesas r8a77470 PFC driver
Date: Wed,  4 Apr 2018 16:22:55 +0100
Message-Id: <1522855377-48527-1-git-send-email-biju.das@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

This patch series aims to add support for r8a77470 PFC driver

This patch is tested against "sh-pfc" branch of 'renesas-drivers.git' 
repo. 

V1-->V2
        Incorporated sergie's review comment.

Biju Das (2):
  pinctrl: sh-pfc: Add r8a77470 PFC support
  dt-bindings: pinctrl: sh-pfc: Document r8a77470 PFC support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |    1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |    5 +
 drivers/pinctrl/sh-pfc/Makefile                    |    1 +
 drivers/pinctrl/sh-pfc/core.c                      |    6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c              | 2156 ++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |    1 +
 6 files changed, 2170 insertions(+)
 create mode 100644 drivers/pinctrl/sh-pfc/pfc-r8a77470.c

-- 
2.7.4
