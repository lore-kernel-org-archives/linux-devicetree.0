From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: pcm_dmaengine: Extract snd_dmaengine_pcm_refine_runtime_hwparams" to the asoc tree
Date: Tue,  1 Oct 2019 12:40:45 +0100 (BST)
Message-ID: <20191001114045.A06972742A31@ypsilon.sirena.org.uk>
References: <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, lars@metafoo.de, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.orgMark Brown <broonie@kernel.org>, mark.rutland@arm.com, nicoleotsuka@gmail.com, perex@perex.cz, robh+dt@kernel.org, timur@kernel.org, tiwai@suse.com, Xiubo.Lee@gmail.com
List-Id: devicetree@vger.kernel.org

The patch

   ASoC: pcm_dmaengine: Extract snd_dmaengine_pcm_refine_runtime_hwparams

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From e957204e732bc2916a241dc61dd7dd14e9a98350 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 27 Sep 2019 09:46:11 +0800
Subject: [PATCH] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_refine_runtime_hwparams

When set the runtime hardware parameters, we may need to query
the capability of DMA to complete the parameters.

This patch is to Extract this operation from
dmaengine_pcm_set_runtime_hwparams function to a separate function
snd_dmaengine_pcm_refine_runtime_hwparams, that other components
which need this feature can call this function.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/dmaengine_pcm.h         |  5 ++
 sound/core/pcm_dmaengine.c            | 83 +++++++++++++++++++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c | 61 ++------------------
 3 files changed, 94 insertions(+), 55 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index c679f6116580..b65220685920 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -83,6 +83,11 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
 	const struct snd_dmaengine_dai_dma_data *dma_data,
 	struct dma_slave_config *config);
 
+int snd_dmaengine_pcm_refine_runtime_hwparams(
+	struct snd_pcm_substream *substream,
+	struct snd_dmaengine_dai_dma_data *dma_data,
+	struct snd_pcm_hardware *hw,
+	struct dma_chan *chan);
 
 /*
  * Try to request the DMA channel using compat_request_channel or
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 89a05926ac73..5749a8a49784 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_close_release_chan);
 
+/**
+ * snd_dmaengine_pcm_refine_runtime_hwparams - Refine runtime hw params
+ * @substream: PCM substream
+ * @dma_data: DAI DMA data
+ * @hw: PCM hw params
+ * @chan: DMA channel to use for data transfers
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ *
+ * This function will query DMA capability, then refine the pcm hardware
+ * parameters.
+ */
+int snd_dmaengine_pcm_refine_runtime_hwparams(
+	struct snd_pcm_substream *substream,
+	struct snd_dmaengine_dai_dma_data *dma_data,
+	struct snd_pcm_hardware *hw,
+	struct dma_chan *chan)
+{
+	struct dma_slave_caps dma_caps;
+	u32 addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
+	snd_pcm_format_t i;
+	int ret = 0;
+
+	if (!hw || !chan || !dma_data)
+		return -EINVAL;
+
+	ret = dma_get_slave_caps(chan, &dma_caps);
+	if (ret == 0) {
+		if (dma_caps.cmd_pause && dma_caps.cmd_resume)
+			hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
+		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
+			hw->info |= SNDRV_PCM_INFO_BATCH;
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			addr_widths = dma_caps.dst_addr_widths;
+		else
+			addr_widths = dma_caps.src_addr_widths;
+	}
+
+	/*
+	 * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
+	 * hw.formats set to 0, meaning no restrictions are in place.
+	 * In this case it's the responsibility of the DAI driver to
+	 * provide the supported format information.
+	 */
+	if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
+		/*
+		 * Prepare formats mask for valid/allowed sample types. If the
+		 * dma does not have support for the given physical word size,
+		 * it needs to be masked out so user space can not use the
+		 * format which produces corrupted audio.
+		 * In case the dma driver does not implement the slave_caps the
+		 * default assumption is that it supports 1, 2 and 4 bytes
+		 * widths.
+		 */
+		for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
+			int bits = snd_pcm_format_physical_width(i);
+
+			/*
+			 * Enable only samples with DMA supported physical
+			 * widths
+			 */
+			switch (bits) {
+			case 8:
+			case 16:
+			case 24:
+			case 32:
+			case 64:
+				if (addr_widths & (1 << (bits / 8)))
+					hw->formats |= pcm_format_to_bits(i);
+				break;
+			default:
+				/* Unsupported types */
+				break;
+			}
+		}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_refine_runtime_hwparams);
+
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 5552c66ca642..f2c98a9cbf75 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -118,12 +118,7 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
 	struct device *dma_dev = dmaengine_dma_dev(pcm, substream);
 	struct dma_chan *chan = pcm->chan[substream->stream];
 	struct snd_dmaengine_dai_dma_data *dma_data;
-	struct dma_slave_caps dma_caps;
 	struct snd_pcm_hardware hw;
-	u32 addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
-			  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
-			  BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
-	snd_pcm_format_t i;
 	int ret;
 
 	if (pcm->config && pcm->config->pcm_hardware)
@@ -145,56 +140,12 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
 		hw.info |= SNDRV_PCM_INFO_BATCH;
 
-	ret = dma_get_slave_caps(chan, &dma_caps);
-	if (ret == 0) {
-		if (dma_caps.cmd_pause && dma_caps.cmd_resume)
-			hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
-		if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
-			hw.info |= SNDRV_PCM_INFO_BATCH;
-
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			addr_widths = dma_caps.dst_addr_widths;
-		else
-			addr_widths = dma_caps.src_addr_widths;
-	}
-
-	/*
-	 * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
-	 * hw.formats set to 0, meaning no restrictions are in place.
-	 * In this case it's the responsibility of the DAI driver to
-	 * provide the supported format information.
-	 */
-	if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
-		/*
-		 * Prepare formats mask for valid/allowed sample types. If the
-		 * dma does not have support for the given physical word size,
-		 * it needs to be masked out so user space can not use the
-		 * format which produces corrupted audio.
-		 * In case the dma driver does not implement the slave_caps the
-		 * default assumption is that it supports 1, 2 and 4 bytes
-		 * widths.
-		 */
-		for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
-			int bits = snd_pcm_format_physical_width(i);
-
-			/*
-			 * Enable only samples with DMA supported physical
-			 * widths
-			 */
-			switch (bits) {
-			case 8:
-			case 16:
-			case 24:
-			case 32:
-			case 64:
-				if (addr_widths & (1 << (bits / 8)))
-					hw.formats |= pcm_format_to_bits(i);
-				break;
-			default:
-				/* Unsupported types */
-				break;
-			}
-		}
+	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
+							dma_data,
+							&hw,
+							chan);
+	if (ret)
+		return ret;
 
 	return snd_soc_set_runtime_hwparams(substream, &hw);
 }
-- 
2.20.1
