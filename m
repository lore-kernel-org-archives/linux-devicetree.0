From: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: fsl_asrc: update supported sample format" to the asoc tree
Date: Tue,  1 Oct 2019 12:40:45 +0100 (BST)
Message-ID: <20191001114045.E1B2827429C0@ypsilon.sirena.org.uk>
References: <45a7c383f43cc1dd9d0934846447aee653278c03.1569493933.git.shengjiu.wang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <45a7c383f43cc1dd9d0934846447aee653278c03.1569493933.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, lars@metafoo.de, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.orgMark Brown <broonie@kernel.org>, mark.rutland@arm.com, nicoleotsuka@gmail.comNicolin Chen <nicoleotsuka@gmail.com>, perex@perex.cz, robh+dt@kernel.org, timur@kernel.org, tiwai@suse.com, Xiubo.Lee@gmail.com
List-Id: devicetree@vger.kernel.org

The patch

   ASoC: fsl_asrc: update supported sample format

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

>From 109539c986cee525e5ff9ae98793f23c2b29e54d Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 27 Sep 2019 09:46:10 +0800
Subject: [PATCH] ASoC: fsl_asrc: update supported sample format

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
Link: https://lore.kernel.org/r/45a7c383f43cc1dd9d0934846447aee653278c03.1569493933.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1
