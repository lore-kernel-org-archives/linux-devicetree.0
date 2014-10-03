From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 08/13] ARM: shmobile: marzen dts: Add chosen/stdout-path
Date: Fri,  3 Oct 2014 17:11:39 +0200
Message-ID: <1412349104-18724-9-git-send-email-geert+renesas@glider.be>
References: <1412349104-18724-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1412349104-18724-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a stdout-path property so that automatic console selection works
in the absence of a "console=" parameter on the kernel command line.

Note that we have to keep the "console=" parameter in chosen/bootargs,
as this DTS is shared between legacy and multi-platform.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Keep "console="
---
 arch/arm/boot/dts/r8a7779-marzen.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index c160404e4d405eb2..9e1b859190ca48e4 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -25,6 +25,7 @@
 
 	chosen {
 		bootargs = "console=ttySC2,115200 ignore_loglevel root=/dev/nfs ip=on";
+		stdout-path = &scif2;
 	};
 
 	memory {
-- 
1.9.1

