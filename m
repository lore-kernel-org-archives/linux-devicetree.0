From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/13] ARM: shmobile: r8a7779 dtsi: Add SoC-specific thermal compatible property
Date: Wed,  9 Jul 2014 14:23:39 +0200
Message-ID: <1404908623-909-10-git-send-email-geert+renesas@glider.be>
References: <1404908623-909-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404908623-909-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The thermal node used the generic compatible property only.
Add the SoC-specific one, to make it future proof.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 94e2fc836492..aca1f9bd714e 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -262,7 +262,7 @@
 	};
 
 	thermal@ffc48000 {
-		compatible = "renesas,rcar-thermal";
+		compatible = "renesas,thermal-r8a7779", "renesas,rcar-thermal";
 		reg = <0xffc48000 0x38>;
 	};
 
-- 
1.9.1
