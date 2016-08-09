From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] ARM64: dts: meson-gxbb: Add GXBB AO Clock and Reset node
Date: Tue,  9 Aug 2016 11:13:28 +0200
Message-ID: <1470734008-18849-4-git-send-email-narmstrong@baylibre.com>
References: <1470734008-18849-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470734008-18849-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the AO clock controller node for the AmLogic GXBB SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index e502c24..c81e1ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -45,6 +45,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
 #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+#include <dt-bindings/clock/gxbb-aoclkc.h>
+#include <dt-bindings/reset/gxbb-aoclkc.h>
 
 / {
 	compatible = "amlogic,meson-gxbb";
@@ -205,6 +207,13 @@
 				};
 			};
 
+			clkc_AO: clock-controller@040 {
+				compatible = "amlogic,gxbb-aoclkc";
+				reg = <0x0 0x00040 0x0 0x4>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart_AO: serial@4c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x0 0x004c0 0x0 0x14>;
-- 
2.7.0
