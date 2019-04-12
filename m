From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 3/5] ARM: dts: da850-lcdk: enable cpufreq
Date: Fri, 12 Apr 2019 15:44:35 +0200
Message-ID: <20190412134437.14864-4-brgl@bgdev.pl>
References: <20190412134437.14864-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412134437.14864-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: David Lechner <david@lechnology.com>

Add a fixed regulator for the da850-lcdk board along with board-specific
CPU configuration.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850-lcdk.dts | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index 26f453dc8370..f29ed9010812 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -155,12 +155,43 @@
 			};
 		};
 	};
+
+	cvdd: regulator0 {
+		compatible = "regulator-fixed";
+		regulator-name = "cvdd";
+		regulator-min-microvolt = <1300000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &ref_clk {
 	clock-frequency = <24000000>;
 };
 
+&cpu {
+	cpu-supply = <&cvdd>;
+};
+
+/* LCDK has a fixed CVDD of 1.3V, so only op points >= 300MHz are valid */
+
+&opp_100 {
+	status = "disabled";
+};
+
+&opp_200 {
+	status = "disabled";
+};
+
+&opp_375 {
+	status = "okay";
+};
+
+&opp_456 {
+	status = "okay";
+};
+
 &pmx_core {
 	status = "okay";
 
-- 
2.21.0
