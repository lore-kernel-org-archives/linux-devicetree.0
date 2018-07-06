From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] reset: meson: add dt-bindings for meson-axg audio arb
Date: Fri,  6 Jul 2018 16:31:21 +0200
Message-ID: <20180706143122.7612-2-jbrunet@baylibre.com>
References: <20180706143122.7612-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180706143122.7612-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add dt-bindings for the audio memory arbitror found on Amlogic's
A113 based SoCs

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/reset/amlogic,meson-axg-audio-arb.txt  | 21 +++++++++++++++++++++
 .../dt-bindings/reset/amlogic,meson-axg-audio-arb.h | 17 +++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
 create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
new file mode 100644
index 000000000000..e29b3463f2e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
@@ -0,0 +1,21 @@
+* Amlogic audio memory arbitror controller
+
+The Amlogic Audio ARB is a simple device which enables or
+disables the access of Audio FIFOs to DDR on AXG based SoC.
+
+Required properties:
+- compatible: 'amlogic,meson-axg-audio-arb'
+- reg: physical base address of the controller and length of memory
+       mapped region.
+- clocks: phandle to the fifo peripheral clock provided by the audio
+	  clock controller.
+- #reset-cells: must be 1.
+
+Example on the A113 SoC:
+
+arb: reset-controller@280 {
+	compatible = "amlogic,meson-axg-audio-arb";
+	reg = <0x0 0x280 0x0 0x4>;
+	#reset-cells = <1>;
+	clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
+};
diff --git a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
new file mode 100644
index 000000000000..05c36367875c
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT)
+ *
+ * Copyright (c) 2018 Baylibre SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H
+#define _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H
+
+#define AXG_ARB_TODDR_A	0
+#define AXG_ARB_TODDR_B	1
+#define AXG_ARB_TODDR_C	2
+#define AXG_ARB_FRDDR_A	3
+#define AXG_ARB_FRDDR_B	4
+#define AXG_ARB_FRDDR_C	5
+
+#endif /* _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H */
-- 
2.14.4
