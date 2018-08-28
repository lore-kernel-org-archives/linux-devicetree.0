From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/5] ARM: dts: at91: nattis: make the SD-card slot work
Date: Tue, 28 Aug 2018 11:48:41 +0200
Message-ID: <20180828094844.10018-3-peda@axentia.se>
References: <20180828094844.10018-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828094844.10018-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The cd-gpios signal is assumed active-low by the driver, and the
cd-inverted property is needed if it is, in fact, active-high. Fix
this oversight.

Fixes: 0e4323899973 ("ARM: dts: at91: add devicetree for the Axentia Nattis with Natte power")
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index bfa5815a0721..4308a07b792e 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -221,6 +221,7 @@
 		reg = <0>;
 		bus-width = <4>;
 		cd-gpios = <&pioD 5 GPIO_ACTIVE_HIGH>;
+		cd-inverted;
 	};
 };
 
-- 
2.11.0
