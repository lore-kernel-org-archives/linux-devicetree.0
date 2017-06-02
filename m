From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/4] ARM: dts: Add iWave RZ/G1M board support
Date: Fri,  2 Jun 2017 17:21:59 +0100
Message-ID: <1496420523-23506-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add iWave RZ/G1M R8A7743 based Qseven SOM and RainboW-G20D- Qseven board support. 

This series has been tested against linux-next tag next-20170602.

Regards,

Biju Das (4):
  of: Add vendor prefix for iWave Systems Technologies Pvt. Ltd
  ARM: shmobile: document iW-RainboW-G20D-Qseven-RZG1M board
  ARM: dts: iwg20m: Add iWave RZG1M Qseven SOM
  ARM: dts: iwg20d-q7: Add support for iWave G20D-Q7 board based on
    RZ/G1M

 Documentation/devicetree/bindings/arm/shmobile.txt |  2 ++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts            | 25 ++++++++++++++++++++
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi              | 27 ++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
 create mode 100644 arch/arm/boot/dts/r8a7743-iwg20m.dtsi

-- 
1.9.1
