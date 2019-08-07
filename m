From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 3/5] ASoC: SOF: topology: Add dummy support for i.MX8 DAIs
Date: Wed,  7 Aug 2019 19:42:56 +0300
Message-ID: <20190807164258.8306-4-daniel.baluta@nxp.com>
References: <20190807164258.8306-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807164258.8306-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.baluta@nxp.com, shawnguo@kernel.org
Cc: aisheng.dong@nxp.com, anson.huang@nxp.com, devicetree@vger.kernel.org, festevam@gmail.com, kernel@pengutronix.de, leonard.crestez@nxp.com, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, m.felsch@pengutronix.de, mark.rutland@arm.com, paul.olaru@nxp.com, peng.fan@nxp.com, robh+dt@kernel.org, shengjiu.wang@nxp.com, sound-open-firmware@alsa-project.org, pierre-louis.bossart@linux.intel.com, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

Add dummy support for SAI/ESAI digital audio interface
IPs found on i.MX8 boards.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/sof/dai.h         |  2 ++
 include/uapi/sound/sof/tokens.h |  8 ++++++++
 sound/soc/sof/topology.c        | 30 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 3d174e20aa53..ec3b5c080537 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -50,6 +50,8 @@ enum sof_ipc_dai_type {
 	SOF_DAI_INTEL_DMIC,		/**< Intel DMIC */
 	SOF_DAI_INTEL_HDA,		/**< Intel HD/A */
 	SOF_DAI_INTEL_SOUNDWIRE,	/**< Intel SoundWire */
+	SOF_DAI_IMX_SAI,		/**< i.MX SAI */
+	SOF_DAI_IMX_ESAI,		/**< i.MX ESAI */
 };
 
 /* general purpose DAI configuration */
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 6435240cef13..8f996857fb24 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -106,4 +106,12 @@
 /* for backward compatibility */
 #define SOF_TKN_EFFECT_TYPE	SOF_TKN_PROCESS_TYPE
 
+/* SAI */
+#define SOF_TKN_IMX_SAI_FIRST_TOKEN		1000
+/* TODO: Add SAI tokens */
+
+/* ESAI */
+#define SOF_TKN_IMX_ESAI_FIRST_TOKEN		1100
+/* TODO: Add ESAI tokens */
+
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 30b5638622dd..e3761657ecc0 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -346,6 +346,8 @@ static const struct sof_dai_types sof_dais[] = {
 	{"SSP", SOF_DAI_INTEL_SSP},
 	{"HDA", SOF_DAI_INTEL_HDA},
 	{"DMIC", SOF_DAI_INTEL_DMIC},
+	{"SAI", SOF_DAI_IMX_SAI},
+	{"ESAI", SOF_DAI_IMX_ESAI},
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -2516,6 +2518,26 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_sai_load(struct snd_soc_component *scomp, int index,
+			     struct snd_soc_dai_link *link,
+			     struct snd_soc_tplg_link_config *cfg,
+			     struct snd_soc_tplg_hw_config *hw_config,
+			     struct sof_ipc_dai_config *config)
+{
+	/*TODO: Add implementation */
+	return 0;
+}
+
+static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
+			      struct snd_soc_dai_link *link,
+			      struct snd_soc_tplg_link_config *cfg,
+			      struct snd_soc_tplg_hw_config *hw_config,
+			      struct sof_ipc_dai_config *config)
+{
+	/*TODO: Add implementation */
+	return 0;
+}
+
 static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_dai_link *link,
 			      struct snd_soc_tplg_link_config *cfg,
@@ -2840,6 +2862,14 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		ret = sof_link_hda_load(scomp, index, link, cfg, hw_config,
 					&config);
 		break;
+	case SOF_DAI_IMX_SAI:
+		ret = sof_link_sai_load(scomp, index, link, cfg, hw_config,
+					&config);
+		break;
+	case SOF_DAI_IMX_ESAI:
+		ret = sof_link_esai_load(scomp, index, link, cfg, hw_config,
+					 &config);
+		break;
 	default:
 		dev_err(sdev->dev, "error: invalid DAI type %d\n", config.type);
 		ret = -EINVAL;
-- 
2.17.1
