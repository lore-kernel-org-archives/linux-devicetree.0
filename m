From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] arm64: dts: alpine: Correct the GIC DT node name
Date: Tue, 27 Nov 2018 14:57:31 +0000
Message-ID: <20181127145731.7283-1-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: devicetree@vger.kernel.org

Harmless mistake, but it's incorrect. The DT spec provides recommendations
for the node names:
"The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming model. If appropriate, the
name should be one of the following choices:
...
interrupt-controller"

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 arch/arm64/boot/dts/al/alpine-v2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/al/alpine-v2.dtsi b/arch/arm64/boot/dts/al/alpine-v2.dtsi
index 5b7bef684256..6f35bab10e9d 100644
--- a/arch/arm64/boot/dts/al/alpine-v2.dtsi
+++ b/arch/arm64/boot/dts/al/alpine-v2.dtsi
@@ -113,7 +113,7 @@
 				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		gic: gic@f0100000 {
+		gic: interrupt-controller@f0100000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0xf0200000 0x0 0x10000>,	/* GIC Dist */
 			      <0x0 0xf0280000 0x0 0x200000>,	/* GICR */
-- 
2.17.1
