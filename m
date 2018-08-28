From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 3/5] ARM: dts: at91: nattis: state the actual lvds-encoder chip
Date: Tue, 28 Aug 2018 11:48:42 +0200
Message-ID: <20180828094844.10018-4-peda@axentia.se>
References: <20180828094844.10018-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828094844.10018-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Just to be explicit.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 4308a07b792e..fbc796125c56 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -117,7 +117,7 @@
 	};
 
 	lvds-encoder {
-		compatible = "lvds-encoder";
+		compatible = "ti,ds90c185", "lvds-encoder";
 
 		ports {
 			#address-cells = <1>;
-- 
2.11.0
