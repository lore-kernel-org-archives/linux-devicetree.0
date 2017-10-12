From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/13] ARM: dts: r8a7778: Add clock for CA9 CPU core
Date: Thu, 12 Oct 2017 11:35:08 +0200
Message-ID: <1507800916-11509-6-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Improve hardware description by adding a clock property to the device
node corresponding to the CA9 CPU core.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7778.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7778.dtsi b/arch/arm/boot/dts/r8a7778.dtsi
index 8f3156c0e5754b09..0f98629a730f6b4f 100644
--- a/arch/arm/boot/dts/r8a7778.dtsi
+++ b/arch/arm/boot/dts/r8a7778.dtsi
@@ -33,6 +33,7 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clock-frequency = <800000000>;
+			clocks = <&z_clk>;
 		};
 	};
 
-- 
2.7.4
