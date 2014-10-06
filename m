From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] ARM: shmobile: kzm9d dts: Add chosen/stdout-path
Date: Mon,  6 Oct 2014 13:59:13 +0200
Message-ID: <1412596753-20734-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add a stdout-path property so that automatic console selection works
in the absence of a "console=" parameter on the kernel command line.

Note that we have to keep the "console=ttyS1,115200n81" parameter in
chosen/bootargs, else the console will use the default setting of 9600
baud.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Keep "console="
v2:
  - No changes
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index a1794cbd23fee319..667d323e80a3e176 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -25,6 +25,7 @@
 
 	chosen {
 		bootargs = "console=ttyS1,115200n81 ignore_loglevel root=/dev/nfs ip=dhcp";
+		stdout-path = &uart1;
 	};
 
 	gpio_keys {
-- 
1.9.1

