From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 10/10] ARM: dts: omap3-beagle: Add USB OTG PHY details
Date: Tue, 24 Sep 2013 11:53:56 +0300
Message-ID: <1380012836-29900-11-git-send-email-rogerq@ti.com>
References: <1380012836-29900-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1380012836-29900-1-git-send-email-rogerq@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: balbi@ti.com, bcousson@baylibre.com, tony@atomide.com
Cc: p.zabel@pengutronix.de, broonie@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

Add information about the USB OTG PHY. Without this
the OTG port on beagle will not work.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/boot/dts/omap3-beagle.dts |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
index 1237822..7669c16 100644
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -169,3 +169,10 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&gpio1_pins>;
 };
+
+&usb_otg_hs {
+	interface-type = <0>;
+	usb-phy = <&usb2_phy>;
+	mode = <3>;
+	power = <50>;
+};
-- 
1.7.4.1

