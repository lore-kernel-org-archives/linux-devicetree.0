From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v7 3/9] ARM: dts: meson: add GPIO interrupt-controller support
Date: Sat, 10 Jun 2017 23:57:23 +0200
Message-ID: <95704321-1783-8ad0-e35d-3b439339e427@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
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
v7:
- no changes
---
 arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 69930773..6c3a68af 100644
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
index d9f116a4..64d02932 100644
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
2.13.1


