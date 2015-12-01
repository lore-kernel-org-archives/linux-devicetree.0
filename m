From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH 4/4] dmaengine: qcom_bam_dma: add controlled remotely dt
 property
Date: Tue, 1 Dec 2015 11:30:26 -0600
Message-ID: <20151201173026.GD26687@Agamemnon.attlocal.net>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
 <1448961299-15161-5-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448961299-15161-5-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 01, 2015 at 11:14:59AM +0200, Stanimir Varbanov wrote:
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
> ---
>  .../devicetree/bindings/dma/qcom_bam_dma.txt       |    2 ++
>  drivers/dma/qcom_bam_dma.c                         |    7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> index 1c9d48ea4914..87b6b2bf5e1e 100644
> --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> @@ -13,6 +13,8 @@ Required properties:
>  - clock-names: must contain "bam_clk" entry
>  - qcom,ee : indicates the active Execution Environment identifier (0-7) used in
>    the secure world.
> +- qcom,controlled-remotely : optional, indicates that the bam is controled by
> +  remote proccessor i.e. execution enviroment.

Please fix the spelling.  controlled, environment.  Otherwise looks ok.

>  
>  Example:
>  
> diff --git a/drivers/dma/qcom_bam_dma.c b/drivers/dma/qcom_bam_dma.c
> index 6d290de9ab2b..5dedab77180a 100644
> --- a/drivers/dma/qcom_bam_dma.c
> +++ b/drivers/dma/qcom_bam_dma.c
> @@ -387,6 +387,7 @@ struct bam_device {
>  
>  	/* execution environment ID, from DT */
>  	u32 ee;
> +	bool controlled_remotely;
>  
>  	const struct reg_offset_data *layout;
>  
> @@ -1039,6 +1040,9 @@ static int bam_init(struct bam_device *bdev)
>  	val = readl_relaxed(bam_addr(bdev, 0, BAM_NUM_PIPES));
>  	bdev->num_channels = val & BAM_NUM_PIPES_MASK;
>  
> +	if (bdev->controlled_remotely)
> +		return 0;
> +
>  	/* s/w reset bam */
>  	/* after reset all pipes are disabled and idle */
>  	val = readl_relaxed(bam_addr(bdev, 0, BAM_CTRL));
> @@ -1126,6 +1130,9 @@ static int bam_dma_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	bdev->controlled_remotely = of_property_read_bool(pdev->dev.of_node,
> +						"qcom,controlled-remotely");
> +
>  	bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
>  	if (IS_ERR(bdev->bamclk))
>  		return PTR_ERR(bdev->bamclk);


Reviewed-by: Andy Gross <agross@codeaurora.org>
