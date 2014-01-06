From: Nishanth Menon <nm@ti.com>
Subject: [PATCH] ARM: dts: omap3430-sdp: add dip switch information for MMC operation
Date: Mon, 6 Jan 2014 16:37:33 -0600
Message-ID: <1389047853-26375-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

MMC 8 bit mode operation depends on dip switch setting which is not
obvious - The current board file has this description. However, with
removal of the board file in the future, this information will be lost
and has to be rediscovered.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm/boot/dts/omap3430-sdp.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/omap3430-sdp.dts b/arch/arm/boot/dts/omap3430-sdp.dts
index 281914e..cd3d047 100644
--- a/arch/arm/boot/dts/omap3430-sdp.dts
+++ b/arch/arm/boot/dts/omap3430-sdp.dts
@@ -34,6 +34,10 @@
 &mmc1 {
 	vmmc-supply = <&vmmc1>;
 	vmmc_aux-supply = <&vsim>;
+	/*
+	 * S6-3 must be in ON position for 8 bit mode to function
+	 * Else, use 4 bit mode
+	 */
 	bus-width = <8>;
 };
 
-- 
1.7.9.5

