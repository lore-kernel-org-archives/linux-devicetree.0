From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 09/12] ARM: dts: sun8i: orangepi-plus: Fix node with unit name and no reg property
Date: Thu, 21 Sep 2017 19:21:48 +0200
Message-ID: <20170921172151.29779-10-clabbe.montjoie@gmail.com>
References: <20170921172151.29779-1-clabbe.montjoie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921172151.29779-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch fix the warning "xxx has a unit name, but no reg property" by
removing "@0" from such node.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
index 331ed683ac62..119732505844 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
@@ -114,7 +114,7 @@
 };
 
 &pio {
-	usb3_vbus_pin_a: usb3_vbus_pin@0 {
+	usb3_vbus_pin_a: usb3_vbus_pin {
 		pins = "PG11";
 		function = "gpio_out";
 	};
-- 
2.13.5
