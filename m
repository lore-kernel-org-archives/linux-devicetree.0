From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 0/3] Add CMT support to r8a774[35]
Date: Mon, 18 Dec 2017 17:39:00 +0000
Message-ID: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

this series adds CMT support for r8a7743 and r8a7745.

Thanks,

Fabrizio Castro (3):
  dt-bindings: timer: renesas, cmt: Document r8a774[35] CMT support
  ARM: dts: r8a7743: Add CMT SoC specific support
  ARM: dts: r8a7745: Add CMT SoC specific support

 .../devicetree/bindings/timer/renesas,cmt.txt      | 14 +++++++---
 arch/arm/boot/dts/r8a7743.dtsi                     | 32 ++++++++++++++++++++++
 arch/arm/boot/dts/r8a7745.dtsi                     | 32 ++++++++++++++++++++++
 3 files changed, 74 insertions(+), 4 deletions(-)

-- 
2.7.4
