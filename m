From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V3 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Date: Fri, 20 Sep 2019 16:25:33 -0700
Message-ID: <20190920232533.GA29851@Asurada-Nvidia.nvidia.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
 <0fe619f4c8f0898cf51c7324c9a0784c5782ed91.1568861098.git.shengjiu.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0fe619f4c8f0898cf51c7324c9a0784c5782ed91.1568861098.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: timur@kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de
List-Id: devicetree@vger.kernel.org

Hello Shengjiu,

One issue for error-out and some nit-pickings inline. Thanks.

On Thu, Sep 19, 2019 at 08:11:42PM +0800, Shengjiu Wang wrote:
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
>  sound/soc/fsl/fsl_asrc.h     |  3 +++
>  sound/soc/fsl/fsl_asrc_dma.c | 52 +++++++++++++++++++++++++++++++-----
>  3 files changed, 50 insertions(+), 9 deletions(-)
> 
> @@ -276,6 +274,11 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  	struct device *dev = component->dev;
>  	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
>  	struct fsl_asrc_pair *pair;
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> +	u8 dir = tx ? OUT : IN;
> +	struct dma_chan *tmp_chan;
> +	struct snd_dmaengine_dai_dma_data *dma_data;

Nit: would it be possible to reorganize these a bit? Usually
we put struct things together unless there is a dependency,
similar to fsl_asrc_dma_hw_params().

> @@ -285,9 +288,44 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  
>  	runtime->private_data = pair;
>  
> +	/* Request a temp pair, which is release in the end */

Nit: "which will be released later" or "and will release it
later"? And could we use a work like "dummy"? Or at least I
would love to see the comments explaining the parameter "1"
in the function call below.

> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		return ret;
> +	}
> +
> +	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> +	if (!tmp_chan) {
> +		dev_err(dev, "can't get dma channel\n");

Could we align with other error messages using "failed to"?

> +	ret = snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
> +	if (ret)
> +		return ret;
> +
[...]
> +	dma_release_channel(tmp_chan);
> +	fsl_asrc_release_pair(pair);

I think we need an "out:" here for those error-out routines
to goto. Otherwise, it'd be a pair leak?

> +

Could we drop this? There is a blank line below already :)

>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 
