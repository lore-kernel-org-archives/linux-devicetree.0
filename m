From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [RESEND PATCH 3/4] ARM: dts: mvebu: set reduced-width property for SDRAM on 98dx3236
Date: Mon,  7 Aug 2017 13:46:40 +1200
Message-ID: <20170807014641.4003-4-chris.packham@alliedtelesis.co.nz>
References: <20170807014641.4003-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170807014641.4003-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gregory.clement@free-electrons.com, bp@alien8.de, jlu@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Because the 98dx3236 and similar SoCs are switch chips with integrated
CPUs they use a reduced pin count for the SDRAM interface. As such
"full" with is 32-bits and "half" width is 16-bits (as opposed to 64/32
on the discrete SoC). Set the reduced-width property on the sdramc node
to indicate this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
index 0e12816d961e..4d6a2acc1b55 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -129,6 +129,7 @@
 			sdramc@1400 {
 				compatible = "marvell,armada-xp-sdram-controller";
 				reg = <0x1400 0x500>;
+				marvell,reduced-width;
 			};
 
 			L2: l2-cache@8000 {
-- 
2.13.0
