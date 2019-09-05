From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/8] ASoC: meson: axg-frddr: expose all 8 outputs
Date: Thu,  5 Sep 2019 14:01:15 +0200
Message-ID: <20190905120120.31752-4-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

The FRDDR component, as it, has a maximum of 8 outputs. Depending on
the SoC, these may not all be connected.

Instead of decribing only the connected outputs of each SoC, describe
them all and let ASoC routing do the rest.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-frddr.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 2b8807737b2b..0968e8375000 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -104,7 +104,7 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 };
 
 static const char * const axg_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3"
+	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4", "OUT 5", "OUT 6", "OUT 7",
 };
 
 static SOC_ENUM_SINGLE_DECL(axg_frddr_sel_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
@@ -120,6 +120,10 @@ static const struct snd_soc_dapm_widget axg_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
@@ -128,6 +132,10 @@ static const struct snd_soc_dapm_route axg_frddr_dapm_routes[] = {
 	{ "OUT 1", "OUT 1",  "SINK SEL" },
 	{ "OUT 2", "OUT 2",  "SINK SEL" },
 	{ "OUT 3", "OUT 3",  "SINK SEL" },
+	{ "OUT 4", "OUT 4",  "SINK SEL" },
+	{ "OUT 5", "OUT 5",  "SINK SEL" },
+	{ "OUT 6", "OUT 6",  "SINK SEL" },
+	{ "OUT 7", "OUT 7",  "SINK SEL" },
 };
 
 static const struct snd_soc_component_driver axg_frddr_component_drv = {
@@ -162,16 +170,12 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 	.pcm_new	= axg_frddr_pcm_new,
 };
 
-static const char * const g12a_frddr_sel_texts[] = {
-	"OUT 0", "OUT 1", "OUT 2", "OUT 3", "OUT 4",
-};
-
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel1_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel2_enum, FIFO_CTRL0, CTRL0_SEL2_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel3_enum, FIFO_CTRL0, CTRL0_SEL3_SHIFT,
-			    g12a_frddr_sel_texts);
+			    axg_frddr_sel_texts);
 
 static const struct snd_kcontrol_new g12a_frddr_out1_demux =
 	SOC_DAPM_ENUM("Output Src 1", g12a_frddr_sel1_enum);
@@ -211,6 +215,9 @@ static const struct snd_soc_dapm_widget g12a_frddr_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("OUT 2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 3", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("OUT 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 5", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 6", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("OUT 7", NULL, 0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
@@ -228,16 +235,25 @@ static const struct snd_soc_dapm_route g12a_frddr_dapm_routes[] = {
 	{ "OUT 2", "OUT 2", "SINK 1 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 1 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 1 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 1 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 1 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 1 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 2 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 2 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 2 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 2 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 2 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 2 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 2 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 2 SEL" },
 	{ "OUT 0", "OUT 0", "SINK 3 SEL" },
 	{ "OUT 1", "OUT 1", "SINK 3 SEL" },
 	{ "OUT 2", "OUT 2", "SINK 3 SEL" },
 	{ "OUT 3", "OUT 3", "SINK 3 SEL" },
 	{ "OUT 4", "OUT 4", "SINK 3 SEL" },
+	{ "OUT 5", "OUT 5", "SINK 3 SEL" },
+	{ "OUT 6", "OUT 6", "SINK 3 SEL" },
+	{ "OUT 7", "OUT 7", "SINK 3 SEL" },
 };
 
 static const struct snd_soc_component_driver g12a_frddr_component_drv = {
-- 
2.21.0
