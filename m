From: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH V6 2/4] ASoC: fsl_asrc: update supported sample format
Date: Fri, 27 Sep 2019 09:46:10 +0800
Message-ID: <45a7c383f43cc1dd9d0934846447aee653278c03.1569493933.git.shengjiu.wang@nxp.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1569493933.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1569493933.git.shengjiu.wang@nxp.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de
List-Id: devicetree@vger.kernel.org

The ASRC support 24bit/16bit/8bit input width, which is
data width, not slot width.

For the S20_3LE format, the data with is 20bit, slot width
is 24bit, if we set ASRMCR1n.IWD to be 24bits, the result
is the volume is lower than expected, it likes 24bit data
right shift 4 bits

So replace S20_3LE with S24_3LE in supported list and add S8
format in TX supported list

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 4d3804a1ea55..584badf956d2 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -624,7 +624,7 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 
 #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S16_LE | \
-				 SNDRV_PCM_FMTBIT_S20_3LE)
+				 SNDRV_PCM_FMTBIT_S24_3LE)
 
 static struct snd_soc_dai_driver fsl_asrc_dai = {
 	.probe = fsl_asrc_dai_probe,
@@ -635,7 +635,8 @@ static struct snd_soc_dai_driver fsl_asrc_dai = {
 		.rate_min = 5512,
 		.rate_max = 192000,
 		.rates = SNDRV_PCM_RATE_KNOT,
-		.formats = FSL_ASRC_FORMATS,
+		.formats = FSL_ASRC_FORMATS |
+			   SNDRV_PCM_FMTBIT_S8,
 	},
 	.capture = {
 		.stream_name = "ASRC-Capture",
-- 
2.21.0
