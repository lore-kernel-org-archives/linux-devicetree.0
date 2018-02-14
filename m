From: Kieran Bingham <kbingham@kernel.org>
Subject: [PATCH v3 4/5] arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
Date: Wed, 14 Feb 2018 09:55:07 +0000
Message-ID: <1518602108-1724-5-git-send-email-kbingham@kernel.org>
References: <1518602108-1724-1-git-send-email-kbingham@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518602108-1724-1-git-send-email-kbingham@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT
        AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The VSPD includes a CLUT on RPF2. Ensure that the register space is
mapped correctly to support this.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1f32340af2d1..772991db8820 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2607,7 +2607,7 @@
 
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x4000>;
+			reg = <0 0xfea20000 0 0x8000>;
 			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2627,7 +2627,7 @@
 
 		vspd1: vsp@fea28000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x4000>;
+			reg = <0 0xfea28000 0 0x8000>;
 			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 622>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2647,7 +2647,7 @@
 
 		vspd2: vsp@fea30000 {
 			compatible = "renesas,vsp2";
-			reg = <0 0xfea30000 0 0x4000>;
+			reg = <0 0xfea30000 0 0x8000>;
 			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 621>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-- 
2.7.4
