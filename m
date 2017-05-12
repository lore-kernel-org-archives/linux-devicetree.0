From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 2/6] pintrl: meson: document GPIO IRQ DT binding
Date: Fri, 12 May 2017 21:13:41 +0200
Message-ID: <c5ea65c5-f604-d890-4e73-f53bdd47bd31@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.

This documentation is intentionally not placed under
interrupt-controllers as GPIO IRQ support on these SoC's acts more
like an interrupt multiplexer.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove syscon
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 436b8750..44422b85 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -312,6 +312,19 @@
 				status = "disabled";
 			};
 
+			gpio_irq@9880 {
+				compatible = "amlogic,meson-gpio-interrupt";
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


