From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dmaengine: qcom: bam_dma: add num-channels binding
 for remotely controlled
Date: Mon, 29 Jan 2018 10:19:13 -0600
Message-ID: <20180129161913.z6wgnbxcrf4q2gpm@rob-hp-laptop>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180116190236.14558-3-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180116190236.14558-3-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 07:02:34PM +0000, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> When Linux is master of BAM, it can directly read registers to know number
> of supported channels, however when its remotely controlled reading these
> registers would trigger a crash if the BAM is not yet intialized/powered up
> on the remote side.
> 
> This patch adds num-channels binding to specify number of supported
> dma channels on remotely controlled BAM.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_bam_dma.txt |  2 ++

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/dma/qcom/bam_dma.c                             | 13 +++++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
