From: Sagar Dharia <sdharia@codeaurora.org>
Subject: Re: [PATCH 1/4] dmaengine: qcom: bam_dma: make bam clk optional
Date: Tue, 16 Jan 2018 12:38:49 -0700
Message-ID: <c82b1815-7ca1-19f8-1585-25e6e51541cb@codeaurora.org>
References: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
 <20180116190236.14558-2-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180116190236.14558-2-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org


On 1/16/2018 12:02 PM, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> When BAM is remotely controlled it does not sound correct to control
> its clk on Linux side. Make it optional, so that its not madatory
> for remote controlled BAM instances.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/dma/qcom/bam_dma.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 03c4eb3fd314..78e488e8f96d 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1180,13 +1180,14 @@ static int bam_dma_probe(struct platform_device *pdev)
>   						"qcom,controlled-remotely");
>   
>   	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
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
I believe you can also keep pm_runtime disabled if BAM is remotely 
controlled.

Thanks
Sagar
>   	}
>   
>   	ret = bam_init(bdev);
