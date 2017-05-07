From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 3/5] pintrl: meson: add DT node for GPIO IRQ on Meson GX
Date: Sun, 7 May 2017 18:34:13 +0200
Message-ID: <8c9cd473-96dc-c0dc-8e4a-9bcb2befc373@gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the DT node for GPIO IRQ support on AMlogic Meson GX.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 436b8750..4d8219f2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -312,6 +312,19 @@
 				status = "disabled";
 			};
 
+			gpio_irq@9880 {
+				compatible = "amlogic,meson-gpio-interrupt", "syscon";
+				reg = <0x0 0x09880 0x0 0x10>;
+				interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+					     <GIC_SPI 65 IRQ_TYPE_NONE>,
+					     <GIC_SPI 66 IRQ_TYPE_NONE>,
+					     <GIC_SPI 67 IRQ_TYPE_NONE>,
+					     <GIC_SPI 68 IRQ_TYPE_NONE>,
+					     <GIC_SPI 69 IRQ_TYPE_NONE>,
+					     <GIC_SPI 70 IRQ_TYPE_NONE>,
+					     <GIC_SPI 71 IRQ_TYPE_NONE>;
+			};
+
 			watchdog@98d0 {
 				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
-- 
2.12.2


