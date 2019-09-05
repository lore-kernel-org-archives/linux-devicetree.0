From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/8] ASoC: meson: add sm1 compatibles
Date: Thu,  5 Sep 2019 14:01:13 +0200
Message-ID: <20190905120120.31752-2-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

Document the compatible strings of the audio devices of the sm1 SoC
family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt  | 4 +++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt   | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt         | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt        | 3 ++-
 .../devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt  | 4 +++-
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt       | 3 ++-
 6 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 4330fc9dca6d..4b17073c8f8c 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-toddr' or
 	      'amlogic,axg-toddr' or
 	      'amlogic,g12a-frddr' or
-	      'amlogic,g12a-toddr'
+	      'amlogic,g12a-toddr' or
+	      'amlogic,sm1-frddr' or
+	      'amlogic,sm1-toddr'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - interrupts: interrupt specifier for the fifo.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index 73f473a9365f..b3f097976e6b 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-pdm' or
-	      'amlogic,g12a-pdm'
+	      'amlogic,g12a-pdm' or
+	      'amlogic,sm1-pdm'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 0b82504fa419..62e5bca71664 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifin' or
-	      'amlogic,g12a-spdifin'
+	      'amlogic,g12a-spdifin' or
+	      'amlogic,sm1-spdifin'
 - interrupts: interrupt specifier for the spdif input.
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index 826152730508..d38aa35ec630 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -2,7 +2,8 @@
 
 Required properties:
 - compatible: 'amlogic,axg-spdifout' or
-	      'amlogic,g12a-spdifout'
+	      'amlogic,g12a-spdifout' or
+	      'amlogic,sm1-spdifout'
 - clocks: list of clock phandle, one for each entry clock-names.
 - clock-names: should contain the following:
   * "pclk" : peripheral clock.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 8835a43edfbb..5996c0cd89c2 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -4,7 +4,9 @@ Required properties:
 - compatible: 'amlogic,axg-tdmin' or
 	      'amlogic,axg-tdmout' or
 	      'amlogic,g12a-tdmin' or
-	      'amlogic,g12a-tdmout'
+	      'amlogic,g12a-tdmout' or
+	      'amlogic,sm1-tdmin' or
+	      'amlogic,sm1-tdmout
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: list of clock phandle, one for each entry clock-names.
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
index aa6c35570d31..173a95045540 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -1,7 +1,8 @@
 * Amlogic HDMI Tx control glue
 
 Required properties:
-- compatible: "amlogic,g12a-tohdmitx"
+- compatible: "amlogic,g12a-tohdmitx" or
+	      "amlogic,sm1-tohdmitx"
 - reg: physical base address of the controller and length of memory
        mapped region.
 - #sound-dai-cells: should be 1.
-- 
2.21.0
