From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv4 2/3] arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
Date: Sat, 24 Aug 2019 18:49:11 +0000
Message-ID: <20190824184912.795-3-linux.amoon@gmail.com>
References: <20190824184912.795-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190824184912.795-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add missing linking regulator node to usb bus for power usb devices.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes from previous patch
[1] https://lore.kernel.org/patchwork/patch/1031243/
split the changes and add the comments to power source
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 41d5fa370eb3..f3dcabf97c63 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -36,8 +36,15 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 
+		/*
+		 * signal name from schematics: PWREN
+		 */
 		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		/*
+		 * signal name from sehematics: USB_POWER
+		 */
+		vin-supply = <&p5v0>;
 	};
 
 	leds {
-- 
2.23.0
