From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 02/14] qcom: mtd: nand: add and initialize QPIC DMA
 resources
Date: Thu, 29 Jun 2017 11:48:36 +0200
Message-ID: <01e12a9a-4f3b-1bde-473a-3cbe3f72ef74@gmail.com>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-3-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-3-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 06/29/2017 09:15 AM, Abhishek Sahu wrote:
> 1. The QPIC NAND uses 3 BAM channels: command, data tx and
>    data rx while EBI2 NAND uses only single ADM channel.
> 
> 2. The EBI2 NAND uses normal register read buffer since this
>    buffer will be remapped with dma_map_sg. The QPIC NAND will give
>    register read buffer in command descriptor and the command
>    descriptor will be mapped with dma_map_sg so the register buffer
>    should be DMA coherent.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

The patch does two things, so make two patches. Also split the DT
changes into separate patch ...

> ---
>  .../devicetree/bindings/mtd/qcom_nandc.txt         |  25 +++--
>  drivers/mtd/nand/qcom_nandc.c                      | 106 ++++++++++++++++-----
>  2 files changed, 99 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> index 5d0f7ae..87b9a56 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> @@ -9,15 +9,17 @@ Required properties:
>  - clock-names:		must contain "core" for the core clock and "aon" for the
>  			always on clock
>  - dmas:			DMA specifier, consisting of a phandle to the ADM DMA
> -			controller node and the channel number to be used for
> -			NAND. Refer to dma.txt and qcom_adm.txt for more details
> -- dma-names:		must be "rxtx"
> -- qcom,cmd-crci:	must contain the ADM command type CRCI block instance
> -			number specified for the NAND controller on the given
> -			platform
> -- qcom,data-crci:	must contain the ADM data type CRCI block instance
> -			number specified for the NAND controller on the given
> -			platform
> +			or BAM DMA controller node and the channel number to
> +			be used for NAND. Refer to dma.txt, qcom_adm.txt(ADM)
> +			and qcom/bam_dma.txt(BAM) for more details
> +- dma-names:		"rxtx" - ADM
> +			"tx", "rx", "cmd" - BAM
> +- qcom,cmd-crci:	Only required for ADM DMA. must contain the ADM command
> +			type CRCI block instance number specified for the NAND
> +			controller on the given platform.
> +- qcom,data-crci:	Only required for ADM DMA. must contain the ADM data
> +			type CRCI block instance number specified for the NAND
> +			controller on the given platform.
>  - #address-cells:	<1> - subnodes give the chip-select number
>  - #size-cells:		<0>
>  
> @@ -95,6 +97,11 @@ nand@79b0000 {
>  		<&gcc GCC_QPIC_AHB_CLK>;
>  	clock-names = "core", "aon";
>  
> +	dmas = <&qpicbam 0>,
> +		<&qpicbam 1>,
> +		<&qpicbam 2>;
> +	dma-names = "tx", "rx", "cmd";
> +
>  	#address-cells = <1>;
>  	#size-cells = <0>;
>  
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index f55f728..520add9 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -226,6 +226,7 @@ struct nandc_regs {
>   *				by upper layers directly
>   * @buf_size/count/start:	markers for chip->read_buf/write_buf functions
>   * @reg_read_buf:		local buffer for reading back registers via DMA
> + * @reg_read_buf_phys:		contains dma address for register read buffer
>   * @reg_read_pos:		marker for data read in reg_read_buf
>   *
>   * @regs:			a contiguous chunk of memory for DMA register
> @@ -249,9 +250,19 @@ struct qcom_nand_controller {
>  	struct clk *core_clk;
>  	struct clk *aon_clk;
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
> +
>  	struct list_head desc_list;
>  
>  	u8		*data_buffer;
> @@ -261,6 +272,7 @@ struct qcom_nand_controller {
>  	int		buf_start;
>  
>  	__le32 *reg_read_buf;
> +	dma_addr_t reg_read_buf_phys;
>  	int reg_read_pos;
>  
>  	struct nandc_regs *regs;
> @@ -1956,16 +1968,48 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>  	if (!nandc->regs)
>  		return -ENOMEM;
>  
> -	nandc->reg_read_buf = devm_kzalloc(nandc->dev,
> -				MAX_REG_RD * sizeof(*nandc->reg_read_buf),
> -				GFP_KERNEL);
> -	if (!nandc->reg_read_buf)
> -		return -ENOMEM;
>  
> -	nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
> -	if (!nandc->chan) {
> -		dev_err(nandc->dev, "failed to request slave channel\n");
> -		return -ENODEV;
> +	if (!nandc->dma_bam_enabled) {
> +		nandc->reg_read_buf =
> +			devm_kzalloc(nandc->dev, MAX_REG_RD *
> +				     sizeof(*nandc->reg_read_buf), GFP_KERNEL);
> +
> +		if (!nandc->reg_read_buf)
> +			return -ENOMEM;
> +
> +		nandc->chan = dma_request_slave_channel(nandc->dev, "rxtx");
> +		if (!nandc->chan) {
> +			dev_err(nandc->dev,
> +				"failed to request slave channel\n");
> +			return -ENODEV;
> +		}
> +	} else {
> +		nandc->reg_read_buf =
> +			dmam_alloc_coherent(nandc->dev, MAX_REG_RD *
> +					    sizeof(*nandc->reg_read_buf),
> +					    &nandc->reg_read_buf_phys,
> +					    GFP_KERNEL);
> +
> +		if (!nandc->reg_read_buf)
> +			return -ENOMEM;
> +
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
>  	}
>  
>  	INIT_LIST_HEAD(&nandc->desc_list);
> @@ -1978,7 +2022,19 @@ static int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
>  
>  static void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
>  {
> -	dma_release_channel(nandc->chan);
> +	if (nandc->dma_bam_enabled) {
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
>  }
>  
>  /* one time setup of a few nand controller registers */
> @@ -2063,16 +2119,20 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
>  	struct device_node *np = nandc->dev->of_node;
>  	int ret;
>  
> -	ret = of_property_read_u32(np, "qcom,cmd-crci", &nandc->cmd_crci);
> -	if (ret) {
> -		dev_err(nandc->dev, "command CRCI unspecified\n");
> -		return ret;
> -	}
> +	if (!nandc->dma_bam_enabled) {
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
>  	}
>  
>  	return 0;
> @@ -2128,7 +2188,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>  
>  	ret = qcom_nandc_alloc(nandc);
>  	if (ret)
> -		return ret;
> +		goto err_core_clk;
>  
>  	ret = clk_prepare_enable(nandc->core_clk);
>  	if (ret)
> 

Can you please fix your mailer to stop adding "QUALCOMM INDIA, on behalf
of Qualcomm Innovation Center"... stuff at the bottom of the patches ?

-- 
Best regards,
Marek Vasut
