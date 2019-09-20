From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V3 3/4] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_refine_runtime_hwparams
Date: Fri, 20 Sep 2019 15:50:58 -0700
Message-ID: <20190920225055.GB21389@Asurada-Nvidia.nvidia.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
 <57e3bda7b94fecf94d17f2eacf1c6beebcac74ff.1568861098.git.shengjiu.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <57e3bda7b94fecf94d17f2eacf1c6beebcac74ff.1568861098.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: timur@kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2019 at 08:11:41PM +0800, Shengjiu Wang wrote:
> When set the runtime hardware parameters, we may need to query
> the capability of DMA to complete the parameters.
> 
> This patch is to Extract this operation from
> dmaengine_pcm_set_runtime_hwparams function to a separate function
> snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> which need this feature can call this function.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

> @@ -145,58 +140,15 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea

> +	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> +							dma_data,
> +							&hw,
> +							chan);
> +	if (ret)
> +		return ret;
>  
>  	return snd_soc_set_runtime_hwparams(substream, &hw);
> +
> }

Just a nit, why add a line here? :)

The rest looks good to me, not sure whether the name "refine"
would be the best one though, would like to wait for opinions
from others.

Thanks
