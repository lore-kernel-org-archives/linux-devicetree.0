Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:51060 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932987Ab3HNU0h (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 16:26:37 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ASoC: tegra: support a Mic Jack in the Tegra+RT5640 machine driver
Date: Wed, 14 Aug 2013 14:26:29 -0600
Message-Id: <1376511989-28187-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

Add a Mic Jack widget to the Tegra+RT5640 machine driver, and document
this in the DT binding. This enables the DT to include the Mic Jack in
the audio routing table, and hence enables capture of audio, in addition
to the previously-working playback.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt | 1 +
 sound/soc/tegra/tegra_rt5640.c                                        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
index cba4f88..dc62249 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
@@ -16,6 +16,7 @@ Required properties:
 
   * Headphones
   * Speakers
+  * Mic Jack
 
 - nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
   connected to the CODEC.
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 08794f9..4511c5a 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -99,6 +99,7 @@ static struct snd_soc_jack_gpio tegra_rt5640_hp_jack_gpio = {
 static const struct snd_soc_dapm_widget tegra_rt5640_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
 static const struct snd_kcontrol_new tegra_rt5640_controls[] = {
-- 
1.8.1.5

