From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v6 4/9] ARM: dts: meson: add GPIO interrupt-controller support
Date: Thu, 8 Jun 2017 21:38:58 +0200
Message-ID: <92414130-4ccf-ae24-acca-cd389014b45e@gmail.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add support for the GPIO interupt controller of certain Amlogic Meson
Soc's.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v5:
- split ARM and ARM64 into separate patches
- added Reviewed-by
v6:
- change parent-interrupts to interrupts
---
 arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 69930773..b4c4175d 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -126,6 +126,14 @@
 };
 
 &cbus {
+	gpio_intc: interrupt-controller@9880 {
+		compatible = "amlogic,meson-gpio-intc";
+		reg = <0x9880 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	pinctrl_cbus: pinctrl@9880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0x9880 0x10>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d9f116a4..fedfef24 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -112,6 +112,14 @@
 };
 
 &cbus {
+	gpio_intc: interrupt-controller@9880 {
+		compatible = "amlogic,meson-gpio-intc";
+		reg = <0x9880 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	clkc: clock-controller@4000 {
 		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
-- 
2.13.0



