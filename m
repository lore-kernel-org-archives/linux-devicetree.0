From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 19/19] ARM: dts: kzm9g: Name serial port pfc subnode after device name
Date: Fri, 10 Jun 2016 15:01:05 +0200
Message-ID: <1465563665-2231-20-git-send-email-geert+renesas@glider.be>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Name the Pin Function Controller subnode for SCIFA4 after its device
name, instead of after the serial port alias.

This avoids conflicts when adding support for more serial ports later,
either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0-kzm9g.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sh73a0-kzm9g.dts b/arch/arm/boot/dts/sh73a0-kzm9g.dts
index 36567cbf2e1c32dd..1df68b1670339491 100644
--- a/arch/arm/boot/dts/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/sh73a0-kzm9g.dts
@@ -352,7 +352,7 @@
 		};
 	};
 
-	scifa4_pins: serial4 {
+	scifa4_pins: scifa4 {
 		groups = "scifa4_data", "scifa4_ctrl";
 		function = "scifa4";
 	};
-- 
1.9.1
