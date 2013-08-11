Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53148 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755004Ab3HKSDK (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sun, 11 Aug 2013 14:03:10 -0400
From: Mark Brown <broonie@kernel.org>
Date: Sun, 11 Aug 2013 19:02:41 +0100
Message-Id: <1376244161-24206-3-git-send-email-broonie@kernel.org>
In-Reply-To: <1376244161-24206-1-git-send-email-broonie@kernel.org>
References: <1376244161-24206-1-git-send-email-broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: dt: Move WM8753 pin list from Tegra board binding to CODEC binding
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: Mark Brown <broonie@linaro.org>

The pin list is the same for any board using the CODEC.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 .../bindings/sound/nvidia,tegra-audio-wm8753.txt   | 27 ++--------------------
 Documentation/devicetree/bindings/sound/wm8753.txt | 22 ++++++++++++++++++
 2 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
index d145106..aab6ce0 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
@@ -11,31 +11,8 @@ Required properties:
 - nvidia,audio-routing : A list of the connections between audio components.
   Each entry is a pair of strings, the first being the connection's sink,
   the second being the connection's source. Valid names for sources and
-  sinks are the WM8753's pins, and the jacks on the board:
-
-  WM8753 pins:
-
-  * LOUT1
-  * LOUT2
-  * ROUT1
-  * ROUT2
-  * MONO1
-  * MONO2
-  * OUT3
-  * OUT4
-  * LINE1
-  * LINE2
-  * RXP
-  * RXN
-  * ACIN
-  * ACOP
-  * MIC1N
-  * MIC1
-  * MIC2N
-  * MIC2
-  * Mic Bias
-
-  Board connectors:
+  sinks are the WM8753's pins as documented in the binding for the WM8753,
+  and the jacks on the board:
 
   * Headphone Jack
   * Mic Jack
diff --git a/Documentation/devicetree/bindings/sound/wm8753.txt b/Documentation/devicetree/bindings/sound/wm8753.txt
index 5dbcde0..8eee612 100644
--- a/Documentation/devicetree/bindings/sound/wm8753.txt
+++ b/Documentation/devicetree/bindings/sound/wm8753.txt
@@ -10,6 +10,28 @@ Required properties:
   - reg : the I2C address of the device for I2C, the chip select
           number for SPI.
 
+Pins on the device (for linking into audio routes):
+
+  * LOUT1
+  * LOUT2
+  * ROUT1
+  * ROUT2
+  * MONO1
+  * MONO2
+  * OUT3
+  * OUT4
+  * LINE1
+  * LINE2
+  * RXP
+  * RXN
+  * ACIN
+  * ACOP
+  * MIC1N
+  * MIC1
+  * MIC2N
+  * MIC2
+  * Mic Bias
+
 Example:
 
 codec: wm8753@1a {
-- 
1.8.4.rc1

