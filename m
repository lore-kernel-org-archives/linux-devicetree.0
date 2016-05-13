From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/23] ARM: dts: r8a7740: Fix W=1 dtc warnings
Date: Fri, 13 May 2016 09:55:43 +0200
Message-ID: <1463126163-29423-4-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /cache-controller has a reg or ranges property, but no unit name

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 39b2f88ad151e434..159e04eb1b9e55da 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -39,7 +39,7 @@
 		      <0xc2000000 0x1000>;
 	};
 
-	L2: cache-controller {
+	L2: cache-controller@f0100000 {
 		compatible = "arm,pl310-cache";
 		reg = <0xf0100000 0x1000>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
-- 
1.9.1
