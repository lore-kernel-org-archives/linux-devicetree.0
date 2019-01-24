From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] arm64: dts: allwinner: a64-amarula-relic: Add STLM75 sensor
Date: Thu, 24 Jan 2019 23:22:54 +0530
Message-ID: <20190124175254.27650-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Amarula A64 Relic has STLM75 sensor for digital temperature
and thermal watchdog.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Note: the respective driver change is already in mainline
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e9a41bbc1079776dabe42ed8113b086b99ae56c

 .../dts/allwinner/sun50i-a64-amarula-relic.dts    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
index 6cb2b7f0c817..5d942543d978 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
@@ -34,6 +34,21 @@
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	temp@48 {
+		compatible = "st,stlm75";
+		reg = <0x48>;
+	};
+};
+
+&i2c0_pins {
+	bias-pull-up;
+};
+
 &mmc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
-- 
2.18.0.321.gffc6fa0e3
