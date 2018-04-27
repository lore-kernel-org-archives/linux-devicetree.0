From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH v2 08/11] arm64: dts: r8a77965: Populate the DU instance placeholder
Date: Fri, 27 Apr 2018 17:57:19 +0100
Message-ID: <20180427165722.19445-9-kieran.bingham+renesas@ideasonboard.com>
References: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT
        AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The DU entity node has been previously added but only as a placeholder.
Populate the node with the properties to use the device.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v2:
 - Remove LVDS references from DU
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 362eddc6b3d1..a35ea2f32da2 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1106,9 +1106,19 @@
 		};
 
 		du: display@feb00000 {
-			reg = <0 0xfeb00000 0 0x80000>,
-			      <0 0xfeb90000 0 0x14>;
-			/* placeholder */
+			compatible = "renesas,du-r8a77965";
+			reg = <0 0xfeb00000 0 0x80000>;
+			reg-names = "du";
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 724>,
+				 <&cpg CPG_MOD 723>,
+				 <&cpg CPG_MOD 721>;
+			clock-names = "du.0", "du.1", "du.3";
+			status = "disabled";
+
+			vsps = <&vspd0 0 &vspd1 0 &vspd0 1>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.17.0
