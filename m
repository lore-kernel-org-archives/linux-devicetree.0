From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend 2/2] ARM: shmobile: r8a7779 dtsi: Add SoC-specific thermal compatible property
Date: Thu, 28 Aug 2014 10:20:40 +0200
Message-ID: <1409214040-5937-2-git-send-email-geert+renesas@glider.be>
References: <1409214040-5937-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1409214040-5937-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The thermal node used the generic compatible property only.
Add the SoC-specific one, to make it future proof.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Resend, doc update is in v3.17-rc1
---
 arch/arm/boot/dts/r8a7779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 559788b2ff77..ddc89000854c 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -256,7 +256,7 @@
 	};
 
 	thermal@ffc48000 {
-		compatible = "renesas,rcar-thermal";
+		compatible = "renesas,thermal-r8a7779", "renesas,rcar-thermal";
 		reg = <0xffc48000 0x38>;
 	};
 
-- 
1.9.1

