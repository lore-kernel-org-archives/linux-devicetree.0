From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 09/14] qcom: mtd: nand: BAM support for read page
Date: Tue, 4 Jul 2017 15:10:11 +0530
Message-ID: <ddf2e1c0-e08e-c8b8-2b10-ef39ce1482b2@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-10-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-10-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 06/29/2017 12:46 PM, Abhishek Sahu wrote:
> 1. The BAM mode requires few registers configuration before each
>     NAND page read and codeword read which is different from ADM
>     so add the helper functions which will be called in BAM mode
>     only.
> 
> 2. The NAND page read handling of BAM is different from ADM so
>     call the appropriate helper functions
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 63 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 8e7dc9e..17766af 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -870,6 +870,35 @@ static void config_cw_read(struct qcom_nand_controller *nandc)
>   }
>   
>   /*
> + * Helpers to prepare DMA descriptors for configuring registers
> + * before reading a NAND page with BAM.
> + */
> +static void config_bam_page_read(struct qcom_nand_controller *nandc)
> +{
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 3, 0);
> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> +	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
> +	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
> +	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
> +		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
> +}
> +
> +/*
> + * Helpers to prepare DMA descriptors for configuring registers
> + * before reading each codeword in NAND page with BAM.
> + */

If I understood right, EBI2 nand required us to load all the registers
configured in config_cw_read() for every codeword, and for BAM, the
registers configured in config_bam_page_read() just needs to be done once,
and the registers in config_bam_cw_read()  need to be reloaded for every
codeword?

Could you please clarify this better in the commit message and comments? Also,
I still see config_cw_read() being used for QPIC nand in nandc_param() and
copy_last_cw()?

Also, I think these should be called config_qpic_page_read() and
config_qpic_cw_read() since it seems more of a property of the NAND controller
rather than the underlying DMA engine. If so, config_cw_read() can be called
config_cw_ebi2_read(). Please correct me if I'm wrong somewhere.

> +static void config_bam_cw_read(struct qcom_nand_controller *nandc)
> +{
> +	write_reg_dma(nandc, NAND_READ_LOCATION_0, 2, 0);
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
> +
> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
> +	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> +		     NAND_BAM_NEXT_SGL);
> +}
> +
> +/*
>    * helpers to prepare dma descriptors used to configure registers needed for
>    * writing a codeword/step in a page
>    */
> @@ -1398,6 +1427,9 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
>   	struct nand_ecc_ctrl *ecc = &chip->ecc;
>   	int i, ret;
>   
> +	if (nandc->dma_bam_enabled)
> +		config_bam_page_read(nandc);
> +
>   	/* queue cmd descs for each codeword */
>   	for (i = 0; i < ecc->steps; i++) {
>   		int data_size, oob_size;
> @@ -1411,7 +1443,36 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
>   			oob_size = host->ecc_bytes_hw + host->spare_bytes;
>   		}
>   
> -		config_cw_read(nandc);
> +		if (nandc->dma_bam_enabled) {
> +			if (data_buf && oob_buf) {
> +				nandc_set_reg(nandc, NAND_READ_LOCATION_0,
> +					      (0 << READ_LOCATION_OFFSET) |
> +					      (data_size <<
> +					      READ_LOCATION_SIZE) |
> +					      (0 << READ_LOCATION_LAST));
> +				nandc_set_reg(nandc, NAND_READ_LOCATION_1,
> +					      (data_size <<
> +					      READ_LOCATION_OFFSET) |
> +					      (oob_size << READ_LOCATION_SIZE) |
> +					      (1 << READ_LOCATION_LAST));
> +			} else if (data_buf) {
> +				nandc_set_reg(nandc, NAND_READ_LOCATION_0,
> +					      (0 << READ_LOCATION_OFFSET) |
> +					      (data_size <<
> +					      READ_LOCATION_SIZE) |
> +					      (1 << READ_LOCATION_LAST));
> +			} else {
> +				nandc_set_reg(nandc, NAND_READ_LOCATION_0,
> +					      (data_size <<
> +					      READ_LOCATION_OFFSET) |
> +					      (oob_size << READ_LOCATION_SIZE) |
> +					      (1 << READ_LOCATION_LAST));
> +			}

Could we put the READ_LOCATION_x register configuration into a small helper?
This is probably a matter of taste, but you could consider configuring like this.
Maybe something similar for patch #11 for raw page reads.

	if (data_buf && oob_buf) {
		r0_off = 0;
		r0_size = r1_off = data_size;
		r1_size = oob_size;
		r0_last = 0;
		r1_last = 1;
	} else if (data_buf) {
		rl0_off = 0;
		rl0_size = data_size;
		rl0_last = 1;
	} else {
		rl0_off = data_size;
		rl0_size = oob_size;
		rl0_last = 1;
	}

	nandc_set_reg(nandc, NAND_READ_LOCATION_0,
		      (rl0_off << READ_LOCATION_OFFSET) |
		      (rl0_size << READ_LOCATION_SIZE) |
		      (rl0_last << READ_LOCATION_LAST));
	if (rl1_last)
		/* program LOCATION_1 register */

Thanks,
Archit

> +
> +			config_bam_cw_read(nandc);
> +		} else {
> +			config_cw_read(nandc);
> +		}
>   
>   		if (data_buf)
>   			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
