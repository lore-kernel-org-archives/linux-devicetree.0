From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RfC v3 4/7] pinctrl: meson: add DT node for GPIO IRQ on Meson
 8 / 8b
Date: Wed, 17 May 2017 22:16:50 +0200
Message-ID: <a4894770-d4ca-92d4-6511-d35c87abac3d@gmail.com>
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

Add the DT node for GPIO IRQ support on AMlogic Meson 8 and 8b.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove syscon
v3:
- no changes
---
 arch/arm/boot/dts/meson8.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index ebc763ea..1962e16e 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -91,6 +91,19 @@
 		clock-frequency = <141666666>;
 	};
 
+	gpio_irq@c1109880 {
+		compatible = "amlogic,meson-gpio-interrupt";
+		reg = <0xc1109880 0x10>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+			     <GIC_SPI 65 IRQ_TYPE_NONE>,
+			     <GIC_SPI 66 IRQ_TYPE_NONE>,
+			     <GIC_SPI 67 IRQ_TYPE_NONE>,
+			     <GIC_SPI 68 IRQ_TYPE_NONE>,
+			     <GIC_SPI 69 IRQ_TYPE_NONE>,
+			     <GIC_SPI 70 IRQ_TYPE_NONE>,
+			     <GIC_SPI 71 IRQ_TYPE_NONE>;
+	};
+
 	pinctrl_cbus: pinctrl@c1109880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0xc1109880 0x10>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 828aa49c..e48017be 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -183,6 +183,19 @@
 			status = "disabled";
 		};
 
+		gpio_irq@c1109880 {
+			compatible = "amlogic,meson-gpio-interrupt";
+			reg = <0xc1109880 0x10>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+				     <GIC_SPI 65 IRQ_TYPE_NONE>,
+				     <GIC_SPI 66 IRQ_TYPE_NONE>,
+				     <GIC_SPI 67 IRQ_TYPE_NONE>,
+				     <GIC_SPI 68 IRQ_TYPE_NONE>,
+				     <GIC_SPI 69 IRQ_TYPE_NONE>,
+				     <GIC_SPI 70 IRQ_TYPE_NONE>,
+				     <GIC_SPI 71 IRQ_TYPE_NONE>;
+		};
+
 		pinctrl_cbus: pinctrl@c1109880 {
 			compatible = "amlogic,meson8b-cbus-pinctrl";
 			reg = <0xc1109880 0x10>;
-- 
2.13.0


