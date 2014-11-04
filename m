From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: shmobile: alt dts: Drop console= bootargs parameter
Date: Tue,  4 Nov 2014 13:23:38 +0900
Message-ID: <1415075018-27529-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Alt is booted from DT, so chosen/stdout-path is
always used, and we can drop the "console=" parameter from chosen/bootargs.

This change has a side-effect of changing the console speed from 38400
to 115200. This is intentional as 115200 is consistently used on
all other shmobile boards.

Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7794-alt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7794-alt.dts b/arch/arm/boot/dts/r8a7794-alt.dts
index 8aec512..f2cf757 100644
--- a/arch/arm/boot/dts/r8a7794-alt.dts
+++ b/arch/arm/boot/dts/r8a7794-alt.dts
@@ -20,7 +20,7 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySC0,38400 ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = &scif2;
 	};
 
-- 
2.1.1

