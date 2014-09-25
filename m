From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] ARM: shmobile: kzm9g-reference dts: Add chosen/stdout-path
Date: Thu, 25 Sep 2014 18:13:29 +0200
Message-ID: <1411661609-4280-14-git-send-email-geert+renesas@glider.be>
References: <1411661609-4280-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1411661609-4280-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a stdout-path property so that automatic console selection works
in the absence of a "console=" parameter on the kernel command line.
In addition, this will allow the PM domain code to find the PM domain
for the console device.

Note that we have to keep the "console=ttySC4" parameter in
chosen/bootargs, else we only get console messages on tty0.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0-kzm9g-reference.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
index 30ef97e99dc53ea7..0dac0e66ccad8f74 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
@@ -40,6 +40,7 @@
 
 	chosen {
 		bootargs = "console=tty0 console=ttySC4,115200 root=/dev/nfs ip=dhcp ignore_loglevel rw";
+		stdout-path = &scifa4;
 	};
 
 	memory {
-- 
1.9.1

