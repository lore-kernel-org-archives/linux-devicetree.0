From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/3] ARM: dts: mvebu: add sdram controller node to Armada-38x
Date: Tue,  9 Jan 2018 11:31:57 +1300
Message-ID: <20180108223158.21930-3-chris.packham@alliedtelesis.co.nz>
References: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: jlu@pengutronix.de, linux@armlinux.org.uk, bp@alien8.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Armada-38x uses an SDRAM controller that is compatible with the
Armada-XP. The key difference is the width of the bus (XP is 64/32, 38x
is 32/16). The SDRAM controller registers are the same between the two
SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-38x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 00ff549d4e39..6d34c5ec178f 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -138,6 +138,11 @@
 			#size-cells = <1>;
 			ranges = <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
 
+			sdramc@1400 {
+				compatible = "marvell,armada-xp-sdram-controller";
+				reg = <0x1400 0x500>;
+			};
+
 			L2: cache-controller@8000 {
 				compatible = "arm,pl310-cache";
 				reg = <0x8000 0x1000>;
-- 
2.15.1
