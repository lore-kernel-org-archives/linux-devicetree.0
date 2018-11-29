Return-Path: <SRS0=gYPT=OI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:46428 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbeK2Vjk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Nov 2018 16:39:40 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a7795-es1: Add missing power domains to IPMMU nodes
Date: Thu, 29 Nov 2018 11:34:35 +0100
Message-Id: <20181129103435.9260-3-geert+renesas@glider.be>
In-Reply-To: <20181129103435.9260-1-geert+renesas@glider.be>
References: <20181129103435.9260-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

While commit 3b7e7848f0e88b36 ("arm64: dts: renesas: r8a7795: Add IPMMU
device nodes") for R-Car H3 ES2.0 did include power-domains properties,
they were forgotten in the counterpart for older R-Car H3 ES1.x SoCs.

Fixes: e4b9a493df45075b ("arm64: dts: renesas: r8a7795-es1: Add IPMMU device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 0fb84c219b2feaca..40d10daca85201aa 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -28,6 +28,7 @@
 		compatible = "renesas,ipmmu-r8a7795";
 		reg = <0 0xec680000 0 0x1000>;
 		renesas,ipmmu-main = <&ipmmu_mm 5>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		#iommu-cells = <1>;
 	};
 
@@ -35,6 +36,7 @@
 		compatible = "renesas,ipmmu-r8a7795";
 		reg = <0 0xe7730000 0 0x1000>;
 		renesas,ipmmu-main = <&ipmmu_mm 8>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		#iommu-cells = <1>;
 	};
 
-- 
2.17.1
