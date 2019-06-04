Return-Path: <SRS0=lN0X=UD=renesas.com=prvs=50588f7500=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] dts: rza2mevb: Add IRQ pin controller for RZ/A2
Date: Tue, 4 Jun 2019 15:09:12 -0500
Message-ID: <20190604200914.64896-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The IRQ pin controller that was added for RZ/A1 is the exact same
one that is in RZ/A2. So we only need to add it to the device
tree.

Tested on the RZ/A2M EVB board (after gathering all the appropirate
patches from different maintainer trees)


Chris Brandt (2):
  ARM: dts: r7s9210: Add IRQC device node
  ARM: dts: rza2mevb: Add input switch

 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 20 ++++++++++++++++++++
 arch/arm/boot/dts/r7s9210.dtsi         | 19 +++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.16.1
