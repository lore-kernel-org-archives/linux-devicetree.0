From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/5] ARM: dts: Add iWave RZ/G1M board support
Date: Tue,  6 Jun 2017 16:10:13 +0100
Message-ID: <1496761818-62126-1-git-send-email-biju.das@bp.renesas.com>
References: <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1496420523-23506-4-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series aims to add iWave RZ/G1M R8A7743 based Qseven SOM and RainboW-G20D- Qseven board support. 

This series has been tested against linux-next tag next-20170606.

Modifications:
v1->v2
-Documented iWave iW-RainboW-G20M-Qseven-RZG1M system on module
-Documented iW-RainboW-G20D-Qseven-RZG1M board in alphabatical order
-Added compatible string in iWave RZG1M Qseven SOM
-Modified the compatible string in iWave G20D-Q7 board 

History:
-------
[v1]: http://www.spinics.net/lists/devicetree/msg179565.html

Biju Das (5):
  of: Add vendor prefix for iWave Systems Technologies Pvt. Ltd
  ARM: shmobile: document iW-RainboW-G20M-Qseven-RZG1M system on module
  ARM: shmobile: document iW-RainboW-G20D-Qseven-RZG1M board
  ARM: dts: iwg20m: Add iWave RZG1M Qseven SOM
  ARM: dts: iwg20d-q7: Add support for iWave G20D-Q7 board based on
    RZ/G1M

 Documentation/devicetree/bindings/arm/shmobile.txt |  4 +++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts            | 25 +++++++++++++++++++
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi              | 29 ++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
 create mode 100644 arch/arm/boot/dts/r8a7743-iwg20m.dtsi

-- 
1.9.1
