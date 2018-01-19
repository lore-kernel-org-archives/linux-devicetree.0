From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/4] dmaengine: qcom: bam_dma: make bam clk optional
Date: Fri, 19 Jan 2018 11:22:21 +0530
Message-ID: <20180119055221.GV18649@localhost>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180116190236.14558-2-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180116190236.14558-2-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 07:02:33PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> When BAM is remotely controlled it does not sound correct to control
> its clk on Linux side. Make it optional, so that its not madatory

s/madatory/mandatory

> for remote controlled BAM instances.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/dma/qcom/bam_dma.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 03c4eb3fd314..78e488e8f96d 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1180,13 +1180,14 @@ static int bam_dma_probe(struct platform_device *pdev)
>  						"qcom,controlled-remotely");
>  
>  	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");

but you still do clk_get unconditionally?

> -	if (IS_ERR(bdev->bamclk))
> -		return PTR_ERR(bdev->bamclk);
> -
> -	ret = clk_prepare_enable(bdev->bamclk);
> -	if (ret) {
> -		dev_err(bdev->dev, "failed to prepare/enable clock\n");
> -		return ret;
> +	if (IS_ERR(bdev->bamclk)) {
> +		bdev->bamclk = NULL;
> +	} else {
> +		ret = clk_prepare_enable(bdev->bamclk);
> +		if (ret) {
> +			dev_err(bdev->dev, "failed to prepare/enable clock\n");
> +			return ret;
> +		}

wouldn't it be better to set that an instance is remote controlled and thus
not at all visible to Linux?

>  	}
>  
>  	ret = bam_init(bdev);
> -- 
> 2.15.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
~Vinod
