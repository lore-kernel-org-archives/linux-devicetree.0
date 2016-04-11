From: gpramod@codeaurora.org
Subject: Re: [PATCH v2 3/5] dmaengine: qcom: bam_dma: add controlled remotely
 dt property
Date: Mon, 11 Apr 2016 13:23:14 +0530
Message-ID: <ee74d1afe72c26fb865d55151c54e09f@codeaurora.org>
References: <1459896982-30171-1-git-send-email-stanimir.varbanov@linaro.org>
 <1459896982-30171-4-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1459896982-30171-4-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 2016-04-06 04:26, Stanimir Varbanov wrote:
> Some of the peripherals has bam which is controlled by remote
> processor, thus the bam dma driver must avoid register writes
> which initialise bam hw block. Those registers are protected
> from xPU block and any writes to them will lead to secure
> violation and system reboot.
> 
> Adding the contolled_remotely flag in bam driver to avoid
> not permitted register writes in bam_init function.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Reviewed-by: Andy Gross <andy.gross@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 2 ++
>  drivers/dma/qcom/bam_dma.c                             | 7 +++++++
>  2 files changed, 9 insertions(+)
> 

Tested-by: Pramod Gurav <gpramod@codeaurora.org>

> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> index 1c9d48ea4914..9cbf5d9df8fd 100644
> --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> @@ -13,6 +13,8 @@ Required properties:
>  - clock-names: must contain "bam_clk" entry
>  - qcom,ee : indicates the active Execution Environment identifier 
> (0-7) used in
>    the secure world.
> +- qcom,controlled-remotely : optional, indicates that the bam is 
> controlled by
> +  remote proccessor i.e. execution environment.
> 
>  Example:
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 789d5f836bf7..d0f878a78fae 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -387,6 +387,7 @@ struct bam_device {
> 
>  	/* execution environment ID, from DT */
>  	u32 ee;
> +	bool controlled_remotely;
> 
>  	const struct reg_offset_data *layout;
> 
> @@ -1042,6 +1043,9 @@ static int bam_init(struct bam_device *bdev)
>  	val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
>  	bdev->num_channels = val & BAM_NUM_PIPES_MASK;
> 
> +	if (bdev->controlled_remotely)
> +		return 0;
> +
>  	/* s/w reset bam */
>  	/* after reset all pipes are disabled and idle */
>  	val = readl_relaxed(bam_addr(bdev, 0, BAM_CTRL));
> @@ -1129,6 +1133,9 @@ static int bam_dma_probe(struct platform_device 
> *pdev)
>  		return ret;
>  	}
> 
> +	bdev->controlled_remotely = of_property_read_bool(pdev->dev.of_node,
> +						"qcom,controlled-remotely");
> +
>  	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
>  	if (IS_ERR(bdev->bamclk))
>  		return PTR_ERR(bdev->bamclk);
