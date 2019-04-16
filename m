Return-Path: <SRS0=vr9i=SS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:13324 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbfDPB4J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Apr 2019 21:56:09 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH 3/4] arm64: dts: renesas: r8a77965: Add TPU support
Date: Tue, 16 Apr 2019 10:55:51 +0900
Message-Id: <1555379752-5980-4-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
References: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, broonie@kernel.org, geert+renesas@glider.be, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add TPU support on r8a77965 SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 11 +++++++++++
 drivers/clk/renesas/r8a77965-cpg-mssr.c   |  1 +
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index d8b8172..d83a2d1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1125,6 +1125,17 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a77965", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a77965",
 				     "renesas,rcar-gen3-msiof";
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 8f87e31..46d5a50 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -132,6 +132,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("cmt2",			301,	R8A77965_CLK_R),
 	DEF_MOD("cmt1",			302,	R8A77965_CLK_R),
 	DEF_MOD("cmt0",			303,	R8A77965_CLK_R),
+	DEF_MOD("tpu0",			304,	R8A77965_CLK_S3D4),
 	DEF_MOD("scif2",		310,	R8A77965_CLK_S3D4),
 	DEF_MOD("sdif3",		311,	R8A77965_CLK_SD3),
 	DEF_MOD("sdif2",		312,	R8A77965_CLK_SD2),
-- 
2.7.4
