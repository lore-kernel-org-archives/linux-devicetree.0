From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 3/4] arm64: dts: allwinner: h6: add r_watchog node
Date: Sat, 18 May 2019 17:23:54 +0200
Message-ID: <20190518152355.11134-4-peron.clem@gmail.com>
References: <20190518152355.11134-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190518152355.11134-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Allwinner H6 has a r_watchdog similar to A64.

Declare it in the device-tree.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 60b47f23b2f5..27647e496269 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -632,6 +632,14 @@
 			#reset-cells = <1>;
 		};
 
+		r_watchdog: watchdog@7020400 {
+			compatible = "allwinner,sun50i-h6-wdt",
+				     "allwinner,sun50i-a64-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x07020400 0x20>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		r_intc: interrupt-controller@7021000 {
 			compatible = "allwinner,sun50i-h6-r-intc",
 				     "allwinner,sun6i-a31-r-intc";
-- 
2.17.1
