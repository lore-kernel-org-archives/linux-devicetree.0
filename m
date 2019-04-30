Return-Path: <SRS0=HRCn=TA=renesas.com=prvs=40235708d9=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/7] dts: r7s9210: Add RZ/A2 devices
Date: Tue, 30 Apr 2019 08:23:02 -0500
Message-ID: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

So while I added RZ/A2 drivers a while back, I never actually added them
all to the device tree.

This series adds everything that is currently supported.

Chris Brandt (7):
  ARM: dts: r7s9210: Add RSPI
  ARM: dts: r7s9210: Add Ethernet support
  dt-bindings: i2c: riic: document r7s9210 support
  ARM: dts: r7s9210: Add RIIC support
  ARM: dts: r7s9210: Add SDHI support
  ARM: dts: r7s9210-rza2mevb: Add Ethernet support
  ARM: dts: r7s9210-rza2mevb: Add SDHI support

 Documentation/devicetree/bindings/i2c/i2c-riic.txt |   5 +-
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |  74 +++++++++
 arch/arm/boot/dts/r7s9210.dtsi                     | 170 +++++++++++++++++++++
 3 files changed, 248 insertions(+), 1 deletion(-)

-- 
2.16.1
