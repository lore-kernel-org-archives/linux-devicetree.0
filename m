From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] ARM: shmobile: r8a7790 dtsi: Remove superfluous interrupt-parent
Date: Wed, 20 Aug 2014 16:28:33 +0200
Message-ID: <1408544914-21742-4-git-send-email-geert+renesas@glider.be>
References: <1408544914-21742-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1408544914-21742-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

There's already an "interrupt-parent = <&gic>;" at the top, which is
inherited by all child nodes, so the "interrupt-parent" property in
the sound node can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 152c75ce8534..5620471d35ee 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1156,7 +1156,6 @@
 	rcar_sound: rcar_sound@0xec500000 {
 		#sound-dai-cells = <1>;
 		compatible =  "renesas,rcar_sound-r8a7791", "renesas,rcar_sound-gen2", "renesas,rcar_sound";
-		interrupt-parent = <&gic>;
 		reg =	<0 0xec500000 0 0x1000>, /* SCU */
 			<0 0xec5a0000 0 0x100>,  /* ADG */
 			<0 0xec540000 0 0x1000>, /* SSIU */
-- 
1.9.1

