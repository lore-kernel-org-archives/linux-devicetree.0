Return-Path: <SRS0=tEXb=OI=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/2] Add Initial Device Tree for RZ/A2
Date: Thu, 29 Nov 2018 08:05:57 -0500
Message-Id: <20181129130559.66732-1-chris.brandt@renesas.com>
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add a Device Tree for RZ/A2 and the existing eval board.

Once these get approved, I'll start piling on the other drivers in
another patch series.


Chris Brandt (2):
  ARM: dts: r7s9210: Initial SoC device tree
  ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB

 Documentation/devicetree/bindings/arm/shmobile.txt |   2 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             | 133 +++++++++++++
 arch/arm/boot/dts/r7s9210.dtsi                     | 211 +++++++++++++++++++++
 4 files changed, 347 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
 create mode 100644 arch/arm/boot/dts/r7s9210.dtsi

-- 
2.16.1
