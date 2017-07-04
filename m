From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/9] ARM: dts: r8a7791: Reserve SRAM for the SMP jump stub
Date: Tue,  4 Jul 2017 17:41:40 +0200
Message-ID: <1499182903-31339-7-git-send-email-geert+renesas@glider.be>
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
 arch/arm/boot/dts/r8a7791.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index f4748a9cb0375e4d..e135da440eed7b94 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -898,6 +898,14 @@
 	icram1:	sram@e63c0000 {
 		compatible = "mmio-sram";
 		reg = <0 0xe63c0000 0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0xe63c0000 0x1000>;
+
+		smp-sram@0 {
+			compatible = "renesas,smp-sram";
+			reg = <0 0x10>;
+		};
 	};
 
 	ether: ethernet@ee700000 {
-- 
2.7.4
