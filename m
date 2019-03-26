From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH] ARM: dts: sun7i: fix typos in uart pin mux
Date: Tue, 26 Mar 2019 11:29:02 +0000
Message-ID: <20190326112902.30080-1-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Werner=20B=C3=B6llmann?= <Werner.Boellmann@fh-dortmund.de>
List-Id: devicetree@vger.kernel.org

The recently added uart mux options had a few typos.  Fix them.

Fixes: 43d0fe112585 ("ARM: dts: sun7i: add pinctrl for missing uart mux options")
Reported-by: Werner Böllmann <Werner.Boellmann@fh-dortmund.de>
Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 9f8bd8f3164b..9234cf8f72bf 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -1006,19 +1006,19 @@
 
 			/omit-if-no-ref/
 			uart1_cts_rts_pa_pins: uart1-cts-rts-pa-pins {
-				pins = "PA12", "PIA13";
-				function = "uart2";
+				pins = "PA12", "PA13";
+				function = "uart1";
 			};
 
 			/omit-if-no-ref/
 			uart2_pa_pins: uart2-pa-pins {
-				pins = "PIA2", "PIA3";
+				pins = "PA2", "PA3";
 				function = "uart2";
 			};
 
 			/omit-if-no-ref/
 			uart2_cts_rts_pa_pins: uart2-cts-rts-pa-pins {
-				pins = "PA0", "PIA1";
+				pins = "PA0", "PA1";
 				function = "uart2";
 			};
 
-- 
2.21.0
