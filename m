From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/19] ARM: dts: bockw: Name serial port pfc subnode after device name
Date: Fri, 10 Jun 2016 15:00:50 +0200
Message-ID: <1465563665-2231-5-git-send-email-geert+renesas@glider.be>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Name the Pin Function Controller subnode for SCIF0 after its device
name, instead of after the serial port alias.

This avoids conflicts when enabling support for more serial ports later,
either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7778-bockw.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7778-bockw.dts b/arch/arm/boot/dts/r8a7778-bockw.dts
index 0a0bd3b6bb401ce2..211d239d9041a886 100644
--- a/arch/arm/boot/dts/r8a7778-bockw.dts
+++ b/arch/arm/boot/dts/r8a7778-bockw.dts
@@ -129,7 +129,7 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
-	scif0_pins: serial0 {
+	scif0_pins: scif0 {
 		groups = "scif0_data_a", "scif0_ctrl";
 		function = "scif0";
 	};
-- 
1.9.1
