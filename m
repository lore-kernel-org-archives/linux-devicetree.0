From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH V5 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Date: Wed, 25 Sep 2019 18:49:06 -0700
Message-ID: <20190926014905.GA24545@Asurada-Nvidia.nvidia.com>
References: <cover.1569387932.git.shengjiu.wang@nxp.com>
 <7c05d8396fd8c4f9d41c13a85e7486f3664bc73f.1569387932.git.shengjiu.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7c05d8396fd8c4f9d41c13a85e7486f3664bc73f.1569387932.git.shengjiu.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: timur@kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de
List-Id: devicetree@vger.kernel.org

Just a small concern...

On Thu, Sep 26, 2019 at 09:29:51AM +0800, Shengjiu Wang wrote:
>  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  {
> +
> +	release_pair = false;
> +	ret = snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);

This set_runtime_hwparams() always returns 0 for now, but if
one day it changes and it fails here, kfree() will be still
ignored although the startup() gets error-out.

We could avoid this if we continue to ignore the return value
like the current code. Or we may check ret at kfree() also?

> +
> +out:
> +	dma_release_channel(tmp_chan);
> +
> +dma_chan_err:
> +	fsl_asrc_release_pair(pair);
> +
> +req_pair_err:
> +	if (release_pair)
> +		kfree(pair);
> +
> +	return ret;
>  }
