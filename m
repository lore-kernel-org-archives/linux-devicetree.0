From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 23/23] arm64: dts: salvator-x: Fix W=1 dtc warnings
Date: Fri, 13 May 2016 09:56:03 +0200
Message-ID: <1463126163-29423-24-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@4 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 76bc94a528aab23c..b2437a90925065fe 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -62,7 +62,7 @@
 		clock-frequency = <24576000>;
 	};
 
-	vcc_sdhi0: regulator@1 {
+	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI0 Vcc";
@@ -73,7 +73,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi0: regulator@2 {
+	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI0 VccQ";
@@ -86,7 +86,7 @@
 			  1800000 0>;
 	};
 
-	vcc_sdhi3: regulator@3 {
+	vcc_sdhi3: regulator-vcc-sdhi3 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI3 Vcc";
@@ -97,7 +97,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi3: regulator@4 {
+	vccq_sdhi3: regulator-vccq-sdhi3 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI3 VccQ";
-- 
1.9.1
