Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:46436 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbeK2Vjl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 16:39:41 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a77965: Remove non-existent IPMMU-IR
Date: Thu, 29 Nov 2018 11:34:34 +0100
Message-Id: <20181129103435.9260-2-geert+renesas@glider.be>
In-Reply-To: <20181129103435.9260-1-geert+renesas@glider.be>
References: <20181129103435.9260-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Aug 24, 2018)
removed the IPMMU-IR IOMMU instance on R-Car M3-N, as this SoC does not
have an Image Processing Unit (IMP-X5) nor the A3IR power domain.

Fixes: 55697cbb44e4f7ea ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a prerequisite for "dt-bindings: power: r8a77965: Remove
non-existent A3IR power domain".
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 3a958fb2524509a2..bca0fefec6b38989 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -795,14 +795,6 @@
 			#iommu-cells = <1>;
 		};
 
-		ipmmu_ir: mmu@ff8b0000 {
-			compatible = "renesas,ipmmu-r8a77965";
-			reg = <0 0xff8b0000 0 0x1000>;
-			renesas,ipmmu-main = <&ipmmu_mm 3>;
-			power-domains = <&sysc R8A77965_PD_A3IR>;
-			#iommu-cells = <1>;
-		};
-
 		ipmmu_mm: mmu@e67b0000 {
 			compatible = "renesas,ipmmu-r8a77965";
 			reg = <0 0xe67b0000 0 0x1000>;
-- 
2.17.1
