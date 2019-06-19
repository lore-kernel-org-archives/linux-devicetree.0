Return-Path: <SRS0=YfZA=US=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: hihope-common: Remove "label" from LEDs
Date: Wed, 19 Jun 2019 15:11:24 +0100
Message-Id: <1560953484-12777-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

Remove "label" properties from the LEDs device tree nodes, since
we don't have nice labels on the PCB.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 625c3aa..cee8bb1 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -22,22 +22,18 @@
 
 		led0 {
 			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
-			label = "LED0";
 		};
 
 		led1 {
 			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
-			label = "LED1";
 		};
 
 		led2 {
 			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
-			label = "LED2";
 		};
 
 		led3 {
 			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
-			label = "LED3";
 		};
 	};
 
-- 
2.7.4
