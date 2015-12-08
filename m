From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/13] ARM: shmobile: bockw dts: Update console parameters
Date: Tue,  8 Dec 2015 18:54:09 +0100
Message-ID: <1449597258-32623-5-git-send-email-geert+renesas@glider.be>
References: <1449597258-32623-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1449597258-32623-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Drop the "console=" parameter from the kernel command line, as it's no
longer needed for DT-based platforms.
Add serial port config to chosen/stdout-path.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7778-bockw.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7778-bockw.dts b/arch/arm/boot/dts/r8a7778-bockw.dts
index 158ad94fd4d187a7..b1aa025992293a58 100644
--- a/arch/arm/boot/dts/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/r8a7778-bockw.dts
@@ -28,8 +28,8 @@
 	};
 
 	chosen {
-		bootargs = "console=ttySC0,115200 ignore_loglevel ip=dhcp root=/dev/nfs rw";
-		stdout-path = &scif0;
+		bootargs = "ignore_loglevel ip=dhcp root=/dev/nfs rw";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory {
-- 
1.9.1

