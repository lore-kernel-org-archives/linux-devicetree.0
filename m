From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFCv1 2/5] arm64: dts: meson: Add missing pwm control gpio signal for pwm-regulator
Date: Mon,  7 Oct 2019 13:16:46 +0000
Message-ID: <20191007131649.1768-3-linux.amoon@gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007131649.1768-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As per schematics add missing VDDCPUA_PWM and VDDCPUB_PWM
gpio signal use to enable/disable the pwm regulator for DVFS.

Fixes: d14734a04a8a (arm64: dts: meson-g12b-odroid-n2: enable DVFS)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index a9a661258886..66262a6ab3fe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -135,6 +135,8 @@
 
 		regulator-boot-on;
 		regulator-always-on;
+		/* VDDCPUA_PWM */
+		enable-gpios = <&gpio GPIOE_1 GPIO_ACTIVE_HIGH>;
 	};
 
 	vddcpu_b: regulator-vddcpu-b {
@@ -154,6 +156,8 @@
 
 		regulator-boot-on;
 		regulator-always-on;
+		/* VDDCPUB_PWM */
+		enable-gpios = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
 	};
 
 	hub_5v: regulator-hub_5v {
-- 
2.23.0
