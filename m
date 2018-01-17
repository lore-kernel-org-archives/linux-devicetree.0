From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] dmaengine: qcom: bam_dma: fixes for remotely
 controlled bam
Date: Wed, 17 Jan 2018 15:48:35 +0530
Message-ID: <20180117101835.GM18649@localhost>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180116190236.14558-1-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 07:02:32PM +0000, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Hi Andy,
> 
> I did hit few issues while trying out SLIMBus BAM on DB820c, this BAM instance
> is remotely controlled and powered up after ADSP is booted using QMI commands.

What do you mean by "remotely controlled" in this series?

> 
> Firstly some of the master registers are written even when the BAM is remotely
> controlled, and secondly reading registers when bam is not ready yet.
> 
> These 4 patches address these issues, there are few more issues like doing PM
> in simillar usecase, these will be addressed soon.
> 
> Thanks,
> Srini
> 
> Srinivas Kandagatla (4):
>   dmaengine: qcom: bam_dma: make bam clk optional
>   dmaengine: qcom: bam_dma: add num-channels binding for remotely
>     controlled
>   dmaengine: qcom: bam_dma: do not write to global regs in remote mode
>   dmaengine: qcom: bam_dma: Add num-ees dt binding for remotely
>     controlled
> 
>  .../devicetree/bindings/dma/qcom_bam_dma.txt       |  4 ++
>  drivers/dma/qcom/bam_dma.c                         | 56 +++++++++++++++-------
>  2 files changed, 43 insertions(+), 17 deletions(-)
> 
> -- 
> 2.15.1
> 

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
