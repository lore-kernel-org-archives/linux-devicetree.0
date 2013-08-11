Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53141 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754970Ab3HKSDJ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sun, 11 Aug 2013 14:03:09 -0400
From: Mark Brown <broonie@kernel.org>
Date: Sun, 11 Aug 2013 19:02:40 +0100
Message-Id: <1376244161-24206-2-git-send-email-broonie@kernel.org>
In-Reply-To: <1376244161-24206-1-git-send-email-broonie@kernel.org>
References: <1376244161-24206-1-git-send-email-broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: dt: Move RT5640 pin list from Tegra board binding to CODEC binding
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Mark Brown <broonie@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: Mark Brown <broonie@linaro.org>

The pin list is the same for any board using the CODEC.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 .../bindings/sound/nvidia,tegra-audio-rt5640.txt   | 25 ++--------------------
 Documentation/devicetree/bindings/sound/rt5640.txt | 20 +++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
index d130818..cba4f88 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
@@ -11,29 +11,8 @@ Required properties:
 - nvidia,audio-routing : A list of the connections between audio components.
   Each entry is a pair of strings, the first being the connection's sink,
   the second being the connection's source. Valid names for sources and
-  sinks are the RT5640's pins, and the jacks on the board:
-
-  RT5640 pins:
-
-  * DMIC1
-  * DMIC2
-  * MICBIAS1
-  * IN1P
-  * IN1R
-  * IN2P
-  * IN2R
-  * HPOL
-  * HPOR
-  * LOUTL
-  * LOUTR
-  * MONOP
-  * MONON
-  * SPOLP
-  * SPOLN
-  * SPORP
-  * SPORN
-
-  Board connectors:
+  sinks are the RT5640's pins (as documented in its binding), and the jacks
+  on the board:
 
   * Headphones
   * Speakers
diff --git a/Documentation/devicetree/bindings/sound/rt5640.txt b/Documentation/devicetree/bindings/sound/rt5640.txt
index 005bcb2..068a114 100644
--- a/Documentation/devicetree/bindings/sound/rt5640.txt
+++ b/Documentation/devicetree/bindings/sound/rt5640.txt
@@ -18,6 +18,26 @@ Optional properties:
 
 - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
 
+Pins on the device (for linking into audio routes):
+
+  * DMIC1
+  * DMIC2
+  * MICBIAS1
+  * IN1P
+  * IN1R
+  * IN2P
+  * IN2R
+  * HPOL
+  * HPOR
+  * LOUTL
+  * LOUTR
+  * MONOP
+  * MONON
+  * SPOLP
+  * SPOLN
+  * SPORP
+  * SPORN
+
 Example:
 
 rt5640 {
-- 
1.8.4.rc1

