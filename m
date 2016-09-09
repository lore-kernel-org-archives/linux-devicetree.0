From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 3/4] ARM64: dts: amlogic: add spi nor pins
Date: Fri,  9 Sep 2016 10:28:57 +0200
Message-ID: <1473409738-27175-4-git-send-email-jbrunet@baylibre.com>
References: <1473409738-27175-1-git-send-email-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473409738-27175-1-git-send-email-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 762f3681a49c..49e803e42e10 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -333,6 +333,16 @@
 					};
 				};
 
+				nor_pins: nor {
+					mux {
+						groups = "nor_d",
+						       "nor_q",
+						       "nor_c",
+						       "nor_cs";
+						function = "nor";
+					};
+				};
+
 				sdcard_pins: sdcard {
 					mux {
 						groups = "sdcard_d0",
-- 
2.7.4
