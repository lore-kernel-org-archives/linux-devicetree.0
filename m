From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: shmobile: lager dts: Use generic names for device nodes
Date: Tue, 28 Apr 2015 12:29:22 +0200
Message-ID: <1430216963-8161-3-git-send-email-geert+renesas@glider.be>
References: <1430216963-8161-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1430216963-8161-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

sound-codec -> codec

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index aaa4f258e279ccfa..d6d01772528f9bf6 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -525,7 +525,7 @@
 
 	clock-frequency = <100000>;
 
-	ak4643: sound-codec@12 {
+	ak4643: codec@12 {
 		compatible = "asahi-kasei,ak4643";
 		#sound-dai-cells = <0>;
 		reg = <0x12>;
-- 
1.9.1

