From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RfC v3 3/7] pinctrl: meson: add DT node for GPIO IRQ on Meson
 GX
Date: Wed, 17 May 2017 22:16:44 +0200
Message-ID: <d41eab00-2074-789d-045d-ac9ce3b4349f@gmail.com>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add the DT node for GPIO IRQ support on AMlogic Meson GX.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove syscon
v3:
- no changes
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
2.13.0


