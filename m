From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/5] dmaengine: qcom: bam_dma: make bam clk optional
Date: Wed, 14 Feb 2018 07:41:44 -0800
Message-ID: <20180214154144.GB93895@bjorns-mbp-2.lan>
References: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
 <20180214144459.29813-2-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180214144459.29813-2-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: vinod.koul@intel.com, andy.gross@linaro.org, dmaengine@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com
List-Id: devicetree@vger.kernel.org

On Wed 14 Feb 06:44 PST 2018, Srinivas Kandagatla wrote:
> @@ -1233,13 +1233,14 @@ static int bam_dma_probe(struct platform_device *pdev)
>  						"qcom,controlled-remotely");
>  
>  	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
> -	if (IS_ERR(bdev->bamclk))
> -		return PTR_ERR(bdev->bamclk);
> -
> -	ret = clk_prepare_enable(bdev->bamclk);
> -	if (ret) {
> -		dev_err(bdev->dev, "failed to prepare/enable clock\n");
> -		return ret;
> +	if (IS_ERR(bdev->bamclk)) {

In the case of !bdev->controlled_remotely I think this should still be
an error.

> +		bdev->bamclk = NULL;
> +	} else {
> +		ret = clk_prepare_enable(bdev->bamclk);
> +		if (ret) {
> +			dev_err(bdev->dev, "failed to prepare/enable clock\n");
> +			return ret;
> +		}

The rest of the driver will keep operating the bamclk (which is okay),
so for symmetry purposes I think you should just keep the
clk_prepare_enable() block unmodified.

Regards,
Bjorn
