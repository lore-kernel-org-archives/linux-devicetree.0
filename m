From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 09/23] ARM: dts: sh73a0: Fix W=1 dtc warnings
Date: Fri, 20 May 2016 09:10:00 +0200
Message-ID: <1463728214-13838-10-git-send-email-geert+renesas@glider.be>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /cache-controller has a reg or ranges property, but no unit name

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm/boot/dts/sh73a0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index c4f434cdec60f075..032fe2f14b16998f 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -55,7 +55,7 @@
 		      <0xf0000100 0x100>;
 	};
 
-	L2: cache-controller {
+	L2: cache-controller@f0100000 {
 		compatible = "arm,pl310-cache";
 		reg = <0xf0100000 0x1000>;
 		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-- 
1.9.1
