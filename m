From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 08/14] qcom: mtd: nand: Add support for additional CSRs
Date: Tue, 4 Jul 2017 12:24:34 +0530
Message-ID: <a04e02b5-56c0-3fb8-813e-a2dd8a53861f@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-9-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-9-git-send-email-absahu@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org



On 06/29/2017 12:46 PM, Abhishek Sahu wrote:
> 1. NAND_READ_LOCATION: provides the offset in page for
>     reading in BAM DMA mode
> 
> 2. NAND_ERASED_CW_DETECT_CFG: contains the status for erased
>     code words
> 
> 3. NAND_BUFFER_STATUS: contains the status for ECC
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 67 ++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 65c9059..8e7dc9e 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -54,6 +54,8 @@
>   #define	NAND_VERSION			0xf08
>   #define	NAND_READ_LOCATION_0		0xf20
>   #define	NAND_READ_LOCATION_1		0xf24
> +#define	NAND_READ_LOCATION_2		0xf28
> +#define	NAND_READ_LOCATION_3		0xf2c
>   
>   /* dummy register offsets, used by write_reg_dma */
>   #define	NAND_DEV_CMD1_RESTORE		0xdead
> @@ -132,6 +134,11 @@
>   #define	ERASED_PAGE			(PAGE_ALL_ERASED | PAGE_ERASED)
>   #define	ERASED_CW			(CODEWORD_ALL_ERASED | CODEWORD_ERASED)
>   
> +/* NAND_READ_LOCATION_n bits */
> +#define READ_LOCATION_OFFSET		0
> +#define READ_LOCATION_SIZE		16
> +#define READ_LOCATION_LAST		31
> +
>   /* Version Mask */
>   #define	NAND_VERSION_MAJOR_MASK		0xf0000000
>   #define	NAND_VERSION_MAJOR_SHIFT	28
> @@ -177,6 +184,11 @@
>   #define NAND_BAM_NWD			(0x0002)
>   /* Finish writing in the current sgl and start writing in another sgl */
>   #define NAND_BAM_NEXT_SGL		(0x0004)
> +/*
> + * Erased codeword status is being used two times in single transfer so this
> + * flag will determine the current value of erased codeword status register
> + */
> +#define NAND_ERASED_CW_SET		(0x0008)
>   
>   #define QPIC_PER_CW_MAX_CMD_ELEMENTS	(32)
>   #define QPIC_PER_CW_MAX_CMD_SGL		(32)
> @@ -258,6 +270,13 @@ struct nandc_regs {
>   	__le32 orig_vld;
>   
>   	__le32 ecc_buf_cfg;
> +	__le32 read_location0;
> +	__le32 read_location1;
> +	__le32 read_location2;
> +	__le32 read_location3;
> +
> +	__le32 erased_cw_detect_cfg_clr;
> +	__le32 erased_cw_detect_cfg_set;
>   };
>   
>   /*
> @@ -504,6 +523,16 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
>   		return &regs->orig_vld;
>   	case NAND_EBI2_ECC_BUF_CFG:
>   		return &regs->ecc_buf_cfg;
> +	case NAND_BUFFER_STATUS:
> +		return &regs->clrreadstatus;
> +	case NAND_READ_LOCATION_0:
> +		return &regs->read_location0;
> +	case NAND_READ_LOCATION_1:
> +		return &regs->read_location1;
> +	case NAND_READ_LOCATION_2:
> +		return &regs->read_location2;
> +	case NAND_READ_LOCATION_3:
> +		return &regs->read_location3;
>   	default:
>   		return NULL;
>   	}
> @@ -545,7 +574,7 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
>   {
>   	struct nand_chip *chip = &host->chip;
>   	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
> -	u32 cmd, cfg0, cfg1, ecc_bch_cfg;
> +	u32 cmd, cfg0, cfg1, ecc_bch_cfg, read_location0;
>   
>   	if (read) {
>   		if (host->use_ecc)
> @@ -562,12 +591,20 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
>   
>   		cfg1 = host->cfg1;
>   		ecc_bch_cfg = host->ecc_bch_cfg;
> +		if (read)
> +			read_location0 = (0 << READ_LOCATION_OFFSET) |
> +				(host->cw_data << READ_LOCATION_SIZE) |
> +				(1 << READ_LOCATION_LAST);
>   	} else {
>   		cfg0 = (host->cfg0_raw & ~(7U << CW_PER_PAGE)) |
>   				(num_cw - 1) << CW_PER_PAGE;
>   
>   		cfg1 = host->cfg1_raw;
>   		ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
> +		if (read)
> +			read_location0 = (0 << READ_LOCATION_OFFSET) |
> +				(host->cw_size << READ_LOCATION_SIZE) |
> +				(1 << READ_LOCATION_LAST);
>   	}
>   
>   	nandc_set_reg(nandc, NAND_FLASH_CMD, cmd);
> @@ -578,6 +615,9 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
>   	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
>   	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
> +
> +	if (read)
> +		nandc_set_reg(nandc, NAND_READ_LOCATION_0, read_location0);
>   }
>   
>   /*
> @@ -756,6 +796,13 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>   	if (first == NAND_FLASH_CMD)
>   		flow_control = true;
>   
> +	if (first == NAND_ERASED_CW_DETECT_CFG) {
> +		if (flags & NAND_ERASED_CW_SET)
> +			vaddr = &regs->erased_cw_detect_cfg_set;
> +		else
> +			vaddr = &regs->erased_cw_detect_cfg_clr;
> +	}
> +
>   	if (first == NAND_EXEC_CMD)
>   		flags |= NAND_BAM_NWD;
>   
> @@ -808,6 +855,12 @@ static void config_cw_read(struct qcom_nand_controller *nandc)
>   	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
>   	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
>   
> +	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
> +	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, NAND_ERASED_CW_SET);
> +	if (nandc->dma_bam_enabled)
> +		write_reg_dma(nandc, NAND_READ_LOCATION_0, 1,
> +			      NAND_BAM_NEXT_SGL);
> +
>   	write_reg_dma(nandc, NAND_EXEC_CMD, 1,
>   		      NAND_BAM_NWD | NAND_BAM_NEXT_SGL);
>   
> @@ -882,6 +935,10 @@ static int nandc_param(struct qcom_nand_host *host)
>   
>   	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
>   	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
> +	nandc_set_reg(nandc, NAND_READ_LOCATION_0,
> +		      (0 << READ_LOCATION_OFFSET) |
> +		      (512 << READ_LOCATION_SIZE) |
> +		      (1 << READ_LOCATION_LAST));
>   
>   	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
>   	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
> @@ -1413,6 +1470,10 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
>   
>   	set_address(host, host->cw_size * (ecc->steps - 1), page);
>   	update_rw_regs(host, 1, true);
> +	nandc_set_reg(nandc, NAND_READ_LOCATION_0,
> +		      (0 << READ_LOCATION_OFFSET) |
> +		      (size << READ_LOCATION_SIZE) |
> +		      (1 << READ_LOCATION_LAST));
>   
>   	config_cw_read(nandc);
>   
> @@ -2147,6 +2208,10 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>   
>   	host->clrflashstatus = FS_READY_BSY_N;
>   	host->clrreadstatus = 0xc0;
> +	nandc->regs->erased_cw_detect_cfg_clr =
> +		cpu_to_le32(CLR_ERASED_PAGE_DET);
> +	nandc->regs->erased_cw_detect_cfg_set =
> +		cpu_to_le32(SET_ERASED_PAGE_DET);
>   

Can these 2 be put in qcom_nand_host like done for other registers?

Thanks,
Archit

>   	dev_dbg(nandc->dev,
>   		"cfg0 %x cfg1 %x ecc_buf_cfg %x ecc_bch cfg %x cw_size %d cw_data %d strength %d parity_bytes %d steps %d\n",
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
