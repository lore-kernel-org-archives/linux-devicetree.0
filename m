Return-Path: <SRS0=so6l=OM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:34502 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbeLCPE7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Dec 2018 10:04:59 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7743: Remove legacy "renesas,rcar-thermal" compatibility
Date: Mon,  3 Dec 2018 16:04:47 +0100
Message-Id: <20181203150447.25316-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The thermal hardware description for the RZ/G1M SoC was added to its DTS
after the introduction of support for thermal zones, and included a
thermal-zones node from the beginning.

Hence there is no need to claim compatibility with
"renesas,rcar-thermal", which would be needed only for backwards
compatibility with kernels predating thermal zone support.

Fixes: 6c76b4f7d89e89f0 ("ARM: dts: r8a7743: Add thermal device to DT")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7743.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 24715f74ae08c7c2..3cc33f7ff7febae7 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -348,8 +348,7 @@
 
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7743",
-				     "renesas,rcar-gen2-thermal",
-				     "renesas,rcar-thermal";
+				     "renesas,rcar-gen2-thermal";
 			reg = <0 0xe61f0000 0 0x10>, <0 0xe61f0100 0 0x38>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 522>;
-- 
2.17.1
