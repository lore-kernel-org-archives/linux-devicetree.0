From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v2 14/25] mtd: nand: qcom: add and initialize QPIC DMA
 resources
Date: Wed, 2 Aug 2017 14:11:03 +0530
Message-ID: <e84110af-c33a-72aa-0ee6-ec3458124167@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-15-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-15-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 07/19/2017 05:18 PM, Abhishek Sahu wrote:
> 1. QPIC NAND uses 3 BAM channels: command, data tx and data
>     rx while EBI2 NAND uses only single ADM channel.
> 2. CRCI is only required for ADM DMA and its not required for

s/its/it's

>     QPIC NAND.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 83 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 65 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 6d24630..cb2b245 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -250,9 +250,19 @@ struct qcom_nand_controller {
>   	struct clk *core_clk;
>   	struct clk *aon_clk;
>   
> -	struct dma_chan *chan;
> -	unsigned int cmd_crci;
> -	unsigned int data_crci;
> +	union {
> +		struct {
> +			struct dma_chan *tx_chan;
> +			struct dma_chan *rx_chan;
> +			struct dma_chan *cmd_chan;
> +		};
> +		struct {
> +			struct dma_chan *chan;
> +			unsigned int cmd_crci;
> +			unsigned int data_crci;
> +		};
> +	};

Could you put comments here explaining one is for EBI2/ADM
and other is for QPIC/BAM? It'll improve the readability a
bit. Otherwise:

Reviewed-by: Archit Taneja <architt@codeaurora.org>

Thanks,
Archit

> +
>   	struct list_head desc_list;
>   
>   	u8		*data_buffer;
> @@ -1985,10 +1995,31 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>   	if (!nandc->reg_read_buf)
>   		return -ENOMEM;
>   
> -	nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
> -	if (!nandc->chan) {
> -		dev_err(nandc->dev, "failed to request slave channel\n");
> -		return -ENODEV;
> +	if (nandc->props->is_bam) {
> +		nandc->tx_chan = dma_request_slave_channel(nandc->dev, "tx");
> +		if (!nandc->tx_chan) {
> +			dev_err(nandc->dev, "failed to request tx channel\n");
> +			return -ENODEV;
> +		}
> +
> +		nandc->rx_chan = dma_request_slave_channel(nandc->dev, "rx");
> +		if (!nandc->rx_chan) {
> +			dev_err(nandc->dev, "failed to request rx channel\n");
> +			return -ENODEV;
> +		}
> +
> +		nandc->cmd_chan = dma_request_slave_channel(nandc->dev, "cmd");
> +		if (!nandc->cmd_chan) {
> +			dev_err(nandc->dev, "failed to request cmd channel\n");
> +			return -ENODEV;
> +		}
> +	} else {
> +		nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
> +		if (!nandc->chan) {
> +			dev_err(nandc->dev,
> +				"failed to request slave channel\n");
> +			return -ENODEV;
> +		}
>   	}
>   
>   	INIT_LIST_HEAD(&nandc->desc_list);
> @@ -2001,7 +2032,19 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>   
>   static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
>   {
> -	dma_release_channel(nandc->chan);
> +	if (nandc->props->is_bam) {
> +		if (nandc->tx_chan)
> +			dma_release_channel(nandc->tx_chan);
> +
> +		if (nandc->rx_chan)
> +			dma_release_channel(nandc->rx_chan);
> +
> +		if (nandc->cmd_chan)
> +			dma_release_channel(nandc->cmd_chan);
> +	} else {
> +		if (nandc->chan)
> +			dma_release_channel(nandc->chan);
> +	}
>   }
>   
>   /* one time setup of a few nand controller registers */
> @@ -2140,16 +2183,20 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
>   	struct device_node *np = nandc->dev->of_node;
>   	int ret;
>   
> -	ret = of_property_read_u32(np, "qcom,cmd-crci", &nandc->cmd_crci);
> -	if (ret) {
> -		dev_err(nandc->dev, "command CRCI unspecified\n");
> -		return ret;
> -	}
> +	if (!nandc->props->is_bam) {
> +		ret = of_property_read_u32(np, "qcom,cmd-crci",
> +					   &nandc->cmd_crci);
> +		if (ret) {
> +			dev_err(nandc->dev, "command CRCI unspecified\n");
> +			return ret;
> +		}
>   
> -	ret = of_property_read_u32(np, "qcom,data-crci", &nandc->data_crci);
> -	if (ret) {
> -		dev_err(nandc->dev, "data CRCI unspecified\n");
> -		return ret;
> +		ret = of_property_read_u32(np, "qcom,data-crci",
> +					   &nandc->data_crci);
> +		if (ret) {
> +			dev_err(nandc->dev, "data CRCI unspecified\n");
> +			return ret;
> +		}
>   	}
>   
>   	return 0;
> @@ -2199,7 +2246,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>   
>   	ret = qcom_nandc_alloc(nandc);
>   	if (ret)
> -		return ret;
> +		goto err_core_clk;
>   
>   	ret = clk_prepare_enable(nandc->core_clk);
>   	if (ret)
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
