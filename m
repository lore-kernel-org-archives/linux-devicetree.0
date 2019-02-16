From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH] ARM: dts: sun7i: add pinctrl for missing uart mux options
Date: Sat, 16 Feb 2019 18:21:32 +0000
Message-ID: <20190216182132.12895-1-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds pinctrl settings for various missing uart options.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 45 ++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index af5b067a5f83..2295ff5adf48 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -944,6 +944,31 @@
 				function = "uart0";
 			};
 
+			uart0_pf_pins: uart0-pf-pins {
+				pins = "PF2", "PF4";
+				function = "uart0";
+			};
+
+			uart1_pa_pins: uart1-pa-pins {
+				pins = "PA10", "PA11";
+				function = "uart1";
+			};
+
+			uart1_cts_rts_pa_pins: uart1-cts-rts-pa-pins {
+				pins = "PA12", "PIA13";
+				function = "uart2";
+			};
+
+			uart2_pa_pins: uart2-pa-pins {
+				pins = "PIA2", "PIA3";
+				function = "uart2";
+			};
+
+			uart2_cts_rts_pa_pins: uart2-cts-rts-pa-pins {
+				pins = "PA0", "PIA1";
+				function = "uart2";
+			};
+
 			uart2_pi_pins: uart2-pi-pins {
 				pins = "PI18", "PI19";
 				function = "uart2";
@@ -969,6 +994,11 @@
 				function = "uart3";
 			};
 
+			uart3_cts_rts_ph_pins: uart3-cts-rts-ph-pins {
+				pins = "PH2", "PH3";
+				function = "uart3";
+			};
+
 			uart4_pg_pins: uart4-pg-pins {
 				pins = "PG10", "PG11";
 				function = "uart4";
@@ -979,16 +1009,31 @@
 				function = "uart4";
 			};
 
+			uart5_ph_pins: uart5-ph-pins {
+				pins = "PH6", "PH7";
+				function = "uart5";
+			};
+
 			uart5_pi_pins: uart5-pi-pins {
 				pins = "PI10", "PI11";
 				function = "uart5";
 			};
 
+			uart6_pa_pins: uart6-pa-pins {
+				pins = "PA12", "PA13";
+				function = "uart6";
+			};
+
 			uart6_pi_pins: uart6-pi-pins {
 				pins = "PI12", "PI13";
 				function = "uart6";
 			};
 
+			uart7_pa_pins: uart7-pa-pins {
+				pins = "PA14", "PA15";
+				function = "uart7";
+			};
+
 			uart7_pi_pins: uart7-pi-pins {
 				pins = "PI20", "PI21";
 				function = "uart7";
-- 
2.20.1
