From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v7 4/9] ARM64: dts: meson: add GPIO interrupt-controller
 support
Date: Sat, 10 Jun 2017 23:57:26 +0200
Message-ID: <8591ca75-61f4-69ca-229f-5ca3bcc53905@gmail.com>
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
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 436b8750..87c7403e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -312,6 +312,14 @@
 				status = "disabled";
 			};
 
+			gpio_intc: interrupt-controller@9880 {
+				compatible = "amlogic,meson-gpio-intc";
+				reg = <0x0 0x09880 0x0 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <64 65 66 67 68 79 70 71>;
+			};
+
 			watchdog@98d0 {
 				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
-- 
2.13.1


