From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH 3/4] dmaengine: qcom_bam_dma: use correct pipe FIFO size
Date: Tue, 1 Dec 2015 11:23:07 -0600
Message-ID: <20151201172307.GA26687@Agamemnon.attlocal.net>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
 <1448961299-15161-4-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448961299-15161-4-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 01, 2015 at 11:14:58AM +0200, Stanimir Varbanov wrote:
> The pipe fifo size register must instruct the bam hw
> how many hw descriptors can be pushed to fifo. Currently
> we isntruct the hw with 32KBytes but wrap the tail in
> bam_start_dma in BAM_P_EVNT_REG on 4095 i.e. 32760. This
> leads to stalled transactions when the tail wraps.
> 
> Fix this by use the correct fifo size in BAM_P_FIFO_SIZES
> register i.e. 32K - 8.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/dma/qcom_bam_dma.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/qcom_bam_dma.c b/drivers/dma/qcom_bam_dma.c
> index 0f06f3b7a72b..6d290de9ab2b 100644
> --- a/drivers/dma/qcom_bam_dma.c
> +++ b/drivers/dma/qcom_bam_dma.c
> @@ -458,7 +458,7 @@ static void bam_chan_init_hw(struct bam_chan *bchan,
>  	 */
>  	writel_relaxed(ALIGN(bchan->fifo_phys, sizeof(struct bam_desc_hw)),
>  			bam_addr(bdev, bchan->id, BAM_P_DESC_FIFO_ADDR));
> -	writel_relaxed(BAM_DESC_FIFO_SIZE,
> +	writel_relaxed(BAM_MAX_DATA_SIZE,
>  			bam_addr(bdev, bchan->id, BAM_P_FIFO_SIZES));

This is just using the #define.  That is ok, but if you use this instead of the
BAM_P_FIFO_SIZES then you need to fix your comment.  Or actually use the
register value.... otherwise looks fine.
