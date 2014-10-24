From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: shmobile: r8a73a4: Add SoC-specific CMT compatible property
Date: Fri, 24 Oct 2014 13:36:02 +0200
Message-ID: <1414150563-6645-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The CMT1 timer used the generic compatible property only.
Add the SoC-specific one, which is already documented, to make it future
proof.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a73a4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index 80939671b0342006..b5ead845c6c32f24 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -114,7 +114,7 @@
 	};
 
 	cmt1: timer@e6130000 {
-		compatible = "renesas,cmt-48-gen2";
+		compatible = "renesas,cmt-48-r8a73a4", "renesas,cmt-48-gen2";
 		reg = <0 0xe6130000 0 0x1004>;
 		interrupts = <0 120 IRQ_TYPE_LEVEL_HIGH>;
 
-- 
1.9.1

