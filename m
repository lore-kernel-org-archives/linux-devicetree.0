From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V4 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Date: Tue, 24 Sep 2019 14:43:44 -0700
Message-ID: <20190924214343.GA964@Asurada-Nvidia.nvidia.com>
References: <cover.1569296075.git.shengjiu.wang@nxp.com>
 <b93ce3dced55bbad8e0b4b7e700cf394b1ae1551.1569296075.git.shengjiu.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b93ce3dced55bbad8e0b4b7e700cf394b1ae1551.1569296075.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: timur@kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2019 at 06:52:35PM +0800, Shengjiu Wang wrote:
> There is error "aplay: pcm_write:2023: write error: Input/output error"
> on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> 
> In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> sample, but we didn't add any constraint, that cause issues.
> 
> So we need to query the caps of dma, then update the hw parameters
> according to the caps.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c     |  4 +--
>  sound/soc/fsl/fsl_asrc.h     |  3 ++
>  sound/soc/fsl/fsl_asrc_dma.c | 59 +++++++++++++++++++++++++++++++-----
>  3 files changed, 56 insertions(+), 10 deletions(-)
> 
> @@ -270,12 +268,17 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
>  
>  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  {
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
> +	struct snd_dmaengine_dai_dma_data *dma_data;
>  	struct device *dev = component->dev;
>  	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
>  	struct fsl_asrc_pair *pair;
> +	struct dma_chan *tmp_chan = NULL;
> +	u8 dir = tx ? OUT : IN;
> +	int ret = 0;
>  
>  	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);

Sorry, I didn't catch it previously. We would need to release
this memory also for all error-out paths, as the code doesn't
have any error-out routine, prior to applying this change.

>  	if (!pair)
> @@ -285,11 +288,51 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)

> +	/* Request a dummy pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * dummy pair, we just request "1" channel temporary.
> +	 */

"temporary" => "temporarily"

> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		return ret;
> +	}
> +
> +	/* Request a dummy dma channel, which will be release later. */

"release" => "released"
