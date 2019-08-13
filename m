From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 4/5] ARM: dts: sun8i: a83t: Remove the watchdog clock
Date: Tue, 13 Aug 2019 14:47:43 +0200
Message-ID: <20190813124744.32614-4-mripard@kernel.org>
References: <20190813124744.32614-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813124744.32614-1-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The watchdog binding doesn't define a clock, and it indeed looks like
there's no explicit clock feeding it.

Let's remove it from our DT.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 523be6611c50..15f8c80f69a5 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -817,7 +817,6 @@
 			compatible = "allwinner,sun6i-a31-wdt";
 			reg = <0x01c20ca0 0x20>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc24M>;
 		};
 
 		spdif: spdif@1c21000 {
-- 
2.21.0
