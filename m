From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/9] ARM: dts: r8a7743: Reserve SRAM for the SMP jump stub
Date: Tue,  4 Jul 2017 17:41:37 +0200
Message-ID: <1499182903-31339-4-git-send-email-geert+renesas@glider.be>
References: <1499182903-31339-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1499182903-31339-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Reserve SRAM for the jump stub for CPU core bringup.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7743.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index b8ce935f6fb196fe..4d59e498fb45fe15 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -481,6 +481,14 @@
 		icram1:	sram@e63c0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63c0000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63c0000 0x1000>;
+
+			smp-sram@0 {
+				compatible = "renesas,smp-sram";
+				reg = <0 0x10>;
+			};
 		};
 
 		ether: ethernet@ee700000 {
-- 
2.7.4
