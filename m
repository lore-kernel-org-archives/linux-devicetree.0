From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 0/4] Add PWM and TPU support to r8a7745
Date: Mon, 18 Dec 2017 18:06:47 +0000
Message-ID: <1513620411-17478-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Dear All,

this series includes all that is required to add PWM and TPU SoC specific
support for the r8a7745.

Thanks,

Fabrizio Castro (4):
  pinctrl: sh-pfc: r8a7794: Add PWM[0123456] support
  ARM: dts: r8a7745: Add PWM SoC support
  pinctrl: sh-pfc: r8a7794: Add tpu groups and function
  ARM: dts: r8a7745: Add TPU support

 arch/arm/boot/dts/r8a7745.dtsi       |  87 ++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 266 +++++++++++++++++++++++++++++++++++
 2 files changed, 353 insertions(+)

-- 
2.7.4
