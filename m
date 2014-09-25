From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/13] ARM: shmobile: koelsch dts: Add chosen/stdout-path
Date: Thu, 25 Sep 2014 18:13:27 +0200
Message-ID: <1411661609-4280-12-git-send-email-geert+renesas@glider.be>
References: <1411661609-4280-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1411661609-4280-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a stdout-path property so that automatic console selection works
in the absence of a "console=" parameter on the kernel command line.

Remove the now-superfluous "console=" parameter from chosen/bootargs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7791-koelsch.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
index 51807a3795d9b5b8..a33e8eaa7008da51 100644
--- a/arch/arm/boot/dts/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
@@ -25,7 +25,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySC6,115200 ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		stdout-path = &scif0;
 	};
 
 	memory@40000000 {
-- 
1.9.1

