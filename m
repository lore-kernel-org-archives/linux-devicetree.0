Return-Path: <SRS0=UBGr=S3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:23766 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfDYBZ1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Apr 2019 21:25:27 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
Subject: [PATCH v2 2/5] arm64: dts: renesas: r8a7795: Add TPU support
Date: Thu, 25 Apr 2019 10:25:14 +0900
Message-Id: <1556155517-5054-3-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, geert+renesas@glider.be, broonie@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc: yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

Add tpu device node to dtsi for TPU support on r8a7795 SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 55472b2..612761e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1380,6 +1380,17 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a7795", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a7795",
 				     "renesas,rcar-gen3-msiof";
-- 
2.7.4
