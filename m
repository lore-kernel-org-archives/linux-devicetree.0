Return-Path: <SRS0=MvHc=SL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:30038 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfDIIwo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Apr 2019 04:52:44 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH 08/11] ARM: dts: r8a77470: Add Ether support
Date: Tue,  9 Apr 2019 17:51:49 +0900
Message-Id: <1554799912-24764-9-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, broonie@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, devicetree@vger.kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add ether node to dtsi for Ether support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index f2349a0..c66a3c4 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -1013,6 +1013,20 @@
 			dma-channels = <13>;
 		};
 
+		ether: ethernet@ee700000 {
+			compatible = "renesas,ether-r8a77470",
+				     "renesas,rcar-gen2-ether";
+			reg = <0 0xee700000 0 0x400>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 813>;
+			power-domains = <&sysc r8a77470_PD_ALWAYS_ON>;
+			resets = <&cpg 813>;
+			phy-mode = "rmii";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4
