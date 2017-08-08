From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/3] Add SMP support
Date: Tue,  8 Aug 2017 11:56:30 +0100
Message-ID: <1502189793-59679-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

This series aims to add SMP support for r8a7743 SoC.

This series has been tested against Linux-next tag 20170727
and renesas-dev branch.

Biju Das (3):
  dt-bindings: apmu: Document r8a7743 support
  ARM: dts: r8a7743: Add APMU node and second CPU core
  ARM: dts: r8a7743: Add OPP table for frequency scaling

 .../devicetree/bindings/power/renesas,apmu.txt     |  3 ++-
 arch/arm/boot/dts/r8a7743.dtsi                     | 25 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

-- 
1.9.1
