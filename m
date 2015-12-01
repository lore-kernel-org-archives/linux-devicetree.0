From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH 2/4] dmaengine: qcom_bam_dma: clear BAM interrupt only if
 it is rised
Date: Tue, 1 Dec 2015 11:28:41 -0600
Message-ID: <20151201172841.GC26687@Agamemnon.attlocal.net>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
 <1448961299-15161-3-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448961299-15161-3-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 01, 2015 at 11:14:57AM +0200, Stanimir Varbanov wrote:
> Currently we write BAM_IRQ_CLR register with zero even when no
> BAM_IRQ occured. This write has some bad side effects when the
> BAM instance is for the crypto engine. In case of crypto engine
> some of the BAM registers are xPU protected and they cannot be
> controlled by the driver.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/dma/qcom_bam_dma.c |   12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/qcom_bam_dma.c b/drivers/dma/qcom_bam_dma.c
> index dc9da477eb69..0f06f3b7a72b 100644
> --- a/drivers/dma/qcom_bam_dma.c
> +++ b/drivers/dma/qcom_bam_dma.c
> @@ -800,13 +800,17 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
>  	if (srcs & P_IRQ)
>  		tasklet_schedule(&bdev->task);
>  
> -	if (srcs & BAM_IRQ)
> +	if (srcs & BAM_IRQ) {
>  		clr_mask = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_STTS));
>  
> -	/* don't allow reorder of the various accesses to the BAM registers */
> -	mb();
> +		/*
> +		 * don't allow reorder of the various accesses to the BAM
> +		 * registers
> +		 */
> +		mb();
>  
> -	writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
> +		writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
> +	}

Looks good.  We shouldn't be accessing this unless there is actually an irq
shown in the srcs.


Thanks for catching this.


Reviewed-by: Andy Gross <agross@codeaurora.org>
