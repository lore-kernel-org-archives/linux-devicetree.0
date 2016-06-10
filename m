From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/19] ARM: dts: lager: Name vin pfc subnode after device name
Date: Fri, 10 Jun 2016 15:00:54 +0200
Message-ID: <1465563665-2231-9-git-send-email-geert+renesas@glider.be>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Name the Pin Function Controller subnode for VIN1 after its device name,
instead of using the generic and indexless "vin".

This avoids conflicts when enabling support for more video inputs later,
either here or in a DT overlay.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 2d72c75ba4cb9c97..5e43763cec6575d3 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -427,7 +427,7 @@
 		function = "usb2";
 	};
 
-	vin1_pins: vin {
+	vin1_pins: vin1 {
 		groups = "vin1_data8", "vin1_clk";
 		function = "vin1";
 	};
-- 
1.9.1
