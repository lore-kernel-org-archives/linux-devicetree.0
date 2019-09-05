From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/8] ASoC: meson: add reset binding
Date: Thu,  5 Sep 2019 14:01:14 +0200
Message-ID: <20190905120120.31752-3-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

The g12a audio subsystem, which is a derivative of the axg subsystem,
provides a dedicated reset line for each of the audio components.

The axg did not provide that and it is unclear if/when these reset are
required. The reset already helped solve a channel mapping issue on the
tdm formatter devices. Let's add the reset binding for the other
components, so we can describe this in DT. We'll use it later on
in the driver when/if needed.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt | 5 ++++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt  | 3 +++
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt        | 3 +++
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt       | 3 +++
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt      | 2 ++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 4b17073c8f8c..3080979350a0 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -12,7 +12,10 @@ Required properties:
 - interrupts: interrupt specifier for the fifo.
 - clocks: phandle to the fifo peripheral clock provided by the audio
 	  clock controller.
-- resets: phandle to memory ARB line provided by the arb reset controller.
+- resets: list of reset phandle, one for each entry reset-names.
+- reset-names: should contain the following:
+  * "arb" : memory ARB line (required)
+  * "rst" : dedicated device reset line (optional)
 - #sound-dai-cells: must be 0.
 
 Example of FRDDR A on the A113 SoC:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index b3f097976e6b..716878107a24 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -13,6 +13,9 @@ Required properties:
   * "sysclk" : dsp system clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the pdm input.
+
 Example of PDM on the A113 SoC:
 
 pdm: audio-controller@ff632000 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 62e5bca71664..df92a4ecf288 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -11,6 +11,9 @@ Required properties:
   * "refclk" : spdif input reference clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the spdif input.
+
 Example on the A113 SoC:
 
 spdifin: audio-controller@400 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index d38aa35ec630..28381dd1f633 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -10,6 +10,9 @@ Required properties:
   * "mclk" : master clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the spdif output.
+
 Example on the A113 SoC:
 
 spdifout: audio-controller@480 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
index 173a95045540..4e8cd7eb7cec 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -6,6 +6,7 @@ Required properties:
 - reg: physical base address of the controller and length of memory
        mapped region.
 - #sound-dai-cells: should be 1.
+- resets: phandle to the dedicated reset line of the hdmitx glue.
 
 Example on the S905X2 SoC:
 
@@ -13,6 +14,7 @@ tohdmitx: audio-controller@744 {
 	compatible = "amlogic,g12a-tohdmitx";
 	reg = <0x0 0x744 0x0 0x4>;
 	#sound-dai-cells = <1>;
+	resets = <&clkc_audio AUD_RESET_TOHDMITX>;
 };
 
 Example of an 'amlogic,axg-sound-card':
-- 
2.21.0
