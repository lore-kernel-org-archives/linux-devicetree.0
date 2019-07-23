From: Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: da850-evm: Use generic jedec, spi-nor for flash
Date: Tue, 23 Jul 2019 07:10:42 -0500
Message-ID: <20190723121042.28634-1-aford173@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>, Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Logic PD re-spun the L138 and AM1808 SOM's with larger flash.
The m25p80 driver has a generic 'jedec,spi-nor' compatible option
which is requests to use whenever possible since it will read the
JEDEC READ ID opcode.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 5b2b1ed04d51..f2e7609e5346 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -281,7 +281,7 @@
 	flash: m25p80@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "m25p64";
+		compatible = "jedec,spi-nor";
 		spi-max-frequency = <30000000>;
 		m25p,fast-read;
 		reg = <0>;
-- 
2.17.1
