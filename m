From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 4/4] ARM64: dts: meson-axg: enable i2c AO on the S400 board
Date: Thu, 17 May 2018 11:31:00 +0200
Message-ID: <20180517093100.22225-5-jbrunet@baylibre.com>
References: <20180517093100.22225-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180517093100.22225-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The i2c AO is used for the MIC daughter card of the S400 board

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index b3e1bdca32bb..4b3331fbfe39 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -95,6 +95,12 @@
 	pinctrl-names = "default";
 };
 
+&i2c_AO {
+	status = "okay";
+	pinctrl-0 = <&i2c_ao_sck_10_pins>, <&i2c_ao_sda_11_pins>;
+	pinctrl-names = "default";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
-- 
2.14.3
