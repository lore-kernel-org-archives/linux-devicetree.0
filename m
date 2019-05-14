From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/3] arm64: dts: meson: u200: enable i2c busses
Date: Tue, 14 May 2019 12:12:36 +0200
Message-ID: <20190514101237.13969-3-jbrunet@baylibre.com>
References: <20190514101237.13969-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514101237.13969-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the 3 i2c busses present on the u200 reference design.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 972926121beb..e02534ab7673 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -169,6 +169,27 @@
 	pinctrl-names = "default";
 };
 
+/* i2c Touch */
+&i2c0 {
+	status = "okay";
+	pinctrl-0 = <&i2c0_sda_z0_pins>, <&i2c0_sck_z1_pins>;
+	pinctrl-names = "default";
+};
+
+/* i2c CM */
+&i2c2 {
+	status = "okay";
+	pinctrl-0 = <&i2c2_sda_z_pins>, <&i2c2_sck_z_pins>;
+	pinctrl-names = "default";
+};
+
+/* i2c Audio */
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.20.1
