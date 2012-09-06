From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/2] ARM/dts: omap4-sdp: Enable GPO functionality for twl6040
Date: Thu,  6 Sep 2012 16:06:17 +0300
Message-ID: <1346936778-18303-2-git-send-email-peter.ujfalusi@ti.com>
References: <1346936778-18303-1-git-send-email-peter.ujfalusi@ti.com>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1346936778-18303-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Benoit Cousson <b-cousson@ti.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Add the needed properties for twl6040 so the GPO functionality can be used
by other drivers.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/omap4-sdp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index f3ff4192..10e14ab 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -128,6 +128,9 @@
 
 	twl6040: twl@4b {
 		compatible = "ti,twl6040";
+		gpio-controller;
+		#gpio-cells = <1>;
+
 		reg = <0x4b>;
 		/* SPI = 0, IRQ# = 119, 4 = active high level-sensitive */
 		interrupts = <0 119 4>; /* IRQ_SYS_2N cascaded to gic */
-- 
1.7.12

