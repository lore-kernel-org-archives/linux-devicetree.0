From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 07/14] qcom: mtd: nand: support for passing flags in
 transfer functions
Date: Thu, 29 Jun 2017 11:52:26 +0200
Message-ID: <62a1335e-637f-5a40-9a87-0b6ea824f7ad@gmail.com>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-8-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1498720566-20782-8-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 06/29/2017 09:15 AM, Abhishek Sahu wrote:
> The BAM has multiple flags to control the transfer. This patch
> adds flags parameter in register and data transfer functions and
> modifies all these function call with appropriate flags.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 114 ++++++++++++++++++++++++------------------
>  1 file changed, 65 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 7042a65..65c9059 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -170,6 +170,14 @@
>  #define	ECC_BCH_4BIT	BIT(2)
>  #define	ECC_BCH_8BIT	BIT(3)
>  
> +/* Flags used for BAM DMA desc preparation*/
> +/* Don't set the EOT in current tx sgl */
> +#define NAND_BAM_NO_EOT			(0x0001)

No parenthesis around constants . Also, this looks like you can use
BIT() macro.

> +/* Set the NWD flag in current sgl */
> +#define NAND_BAM_NWD			(0x0002)
> +/* Finish writing in the current sgl and start writing in another sgl */
> +#define NAND_BAM_NEXT_SGL		(0x0004)
> +
>  #define QPIC_PER_CW_MAX_CMD_ELEMENTS	(32)
>  #define QPIC_PER_CW_MAX_CMD_SGL		(32)
>  #define QPIC_PER_CW_MAX_DATA_SGL	(8)
> @@ -712,7 +720,7 @@ static int prep_dma_desc(struct qcom_nand_controller *nandc, bool read,
>   * @num_regs:		number of registers to read
>   */
>  static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
> -			int num_regs)
> +			int num_regs, unsigned int flags)
>  {
>  	bool flow_control = false;
>  	void *vaddr;
> @@ -736,7 +744,7 @@ static int read_reg_dma(struct qcom_nand_controller *nandc, int first,
>   * @num_regs:		number of registers to write
>   */
>  static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
> -			 int num_regs)
> +			 int num_regs, unsigned int flags)
>  {
>  	bool flow_control = false;
>  	struct nandc_regs *regs = nandc->regs;
> @@ -748,6 +756,9 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>  	if (first == NAND_FLASH_CMD)
>  		flow_control = true;
>  
> +	if (first == NAND_EXEC_CMD)
> +		flags |= NAND_BAM_NWD;
> +
>  	if (first == NAND_DEV_CMD1_RESTORE)
>  		first = NAND_DEV_CMD1;
>  
> @@ -768,7 +779,7 @@ static int write_reg_dma(struct qcom_nand_controller *nandc, int first,
>   * @size:		DMA transaction size in bytes
>   */
>  static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
> -			 const u8 *vaddr, int size)
> +			 const u8 *vaddr, int size, unsigned int flags)
>  {
>  	return prep_dma_desc(nandc, true, reg_off, vaddr, size, false);
>  }
> @@ -782,7 +793,7 @@ static int read_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   * @size:		DMA transaction size in bytes
>   */
>  static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
> -			  const u8 *vaddr, int size)
> +			  const u8 *vaddr, int size, unsigned int flags)
>  {
>  	return prep_dma_desc(nandc, false, reg_off, vaddr, size, false);
>  }
> @@ -793,14 +804,16 @@ static int write_data_dma(struct qcom_nand_controller *nandc, int reg_off,
>   */
>  static void config_cw_read(struct qcom_nand_controller *nandc)
>  {
> -	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
> -	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
> -	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 3, 0);
> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> +	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
>  
> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1,
> +		      NAND_BAM_NWD | NAND_BAM_NEXT_SGL);
>  
> -	read_reg_dma(nandc, NAND_FLASH_STATUS, 2);
> -	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1);
> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
> +	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> +		     NAND_BAM_NEXT_SGL);
>  }
>  
>  /*
> @@ -809,19 +822,20 @@ static void config_cw_read(struct qcom_nand_controller *nandc)
>   */
>  static void config_cw_write_pre(struct qcom_nand_controller *nandc)
>  {
> -	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
> -	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
> -	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 3, 0);
> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> +	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
> +		      NAND_BAM_NEXT_SGL);
>  }
>  
>  static void config_cw_write_post(struct qcom_nand_controller *nandc)
>  {
> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  
> -	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
>  
> -	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
> -	write_reg_dma(nandc, NAND_READ_STATUS, 1);
> +	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
> +	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
>  }
>  
>  /*
> @@ -869,8 +883,8 @@ static int nandc_param(struct qcom_nand_host *host)
>  	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
>  	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
>  
> -	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1);
> -	write_reg_dma(nandc, NAND_DEV_CMD1, 1);
> +	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
> +	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
>  
>  	nandc->buf_count = 512;
>  	memset(nandc->data_buffer, 0xff, nandc->buf_count);
> @@ -878,11 +892,11 @@ static int nandc_param(struct qcom_nand_host *host)
>  	config_cw_read(nandc);
>  
>  	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
> -		      nandc->buf_count);
> +		      nandc->buf_count, 0);
>  
>  	/* restore CMD1 and VLD regs */
> -	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1);
> -	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1);
> +	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1, 0);
> +	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1, NAND_BAM_NEXT_SGL);
>  
>  	return 0;
>  }
> @@ -904,14 +918,14 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
>  	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
>  	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>  
> -	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
> -	write_reg_dma(nandc, NAND_DEV0_CFG0, 2);
> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  
> -	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
>  
> -	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
> -	write_reg_dma(nandc, NAND_READ_STATUS, 1);
> +	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
> +	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
>  
>  	return 0;
>  }
> @@ -931,10 +945,10 @@ static int read_id(struct qcom_nand_host *host, int column)
>  	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>  
> -	write_reg_dma(nandc, NAND_FLASH_CMD, 4);
> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  
> -	read_reg_dma(nandc, NAND_READ_ID, 1);
> +	read_reg_dma(nandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
>  
>  	return 0;
>  }
> @@ -948,10 +962,10 @@ static int reset(struct qcom_nand_host *host)
>  	nandc_set_reg(nandc, NAND_FLASH_CMD, RESET_DEVICE);
>  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>  
> -	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  
> -	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
>  
>  	return 0;
>  }
> @@ -1344,7 +1358,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
>  
>  		if (data_buf)
>  			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
> -				      data_size);
> +				      data_size, 0);
>  
>  		/*
>  		 * when ecc is enabled, the controller doesn't read the real
> @@ -1360,7 +1374,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
>  				*oob_buf++ = 0xff;
>  
>  			read_data_dma(nandc, FLASH_BUF_ACC + data_size,
> -				      oob_buf, oob_size);
> +				      oob_buf, oob_size, 0);
>  		}
>  
>  		if (data_buf)
> @@ -1402,7 +1416,7 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
>  
>  	config_cw_read(nandc);
>  
> -	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size);
> +	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
>  
>  	ret = submit_descs(nandc);
>  	if (ret)
> @@ -1470,19 +1484,19 @@ static int qcom_nandc_read_page_raw(struct mtd_info *mtd,
>  
>  		config_cw_read(nandc);
>  
> -		read_data_dma(nandc, reg_off, data_buf, data_size1);
> +		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>  		reg_off += data_size1;
>  		data_buf += data_size1;
>  
> -		read_data_dma(nandc, reg_off, oob_buf, oob_size1);
> +		read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
>  		reg_off += oob_size1;
>  		oob_buf += oob_size1;
>  
> -		read_data_dma(nandc, reg_off, data_buf, data_size2);
> +		read_data_dma(nandc, reg_off, data_buf, data_size2, 0);
>  		reg_off += data_size2;
>  		data_buf += data_size2;
>  
> -		read_data_dma(nandc, reg_off, oob_buf, oob_size2);
> +		read_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
>  		oob_buf += oob_size2;
>  	}
>  
> @@ -1549,7 +1563,8 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  		config_cw_write_pre(nandc);
>  
> -		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size);
> +		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size,
> +			       i == (ecc->steps - 1) ? NAND_BAM_NO_EOT : 0);
>  
>  		/*
>  		 * when ECC is enabled, we don't really need to write anything
> @@ -1562,7 +1577,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			oob_buf += host->bbm_size;
>  
>  			write_data_dma(nandc, FLASH_BUF_ACC + data_size,
> -				       oob_buf, oob_size);
> +				       oob_buf, oob_size, 0);
>  		}
>  
>  		config_cw_write_post(nandc);
> @@ -1618,19 +1633,19 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
>  
>  		config_cw_write_pre(nandc);
>  
> -		write_data_dma(nandc, reg_off, data_buf, data_size1);
> +		write_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>  		reg_off += data_size1;
>  		data_buf += data_size1;
>  
> -		write_data_dma(nandc, reg_off, oob_buf, oob_size1);
> +		write_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
>  		reg_off += oob_size1;
>  		oob_buf += oob_size1;
>  
> -		write_data_dma(nandc, reg_off, data_buf, data_size2);
> +		write_data_dma(nandc, reg_off, data_buf, data_size2, 0);
>  		reg_off += data_size2;
>  		data_buf += data_size2;
>  
> -		write_data_dma(nandc, reg_off, oob_buf, oob_size2);
> +		write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
>  		oob_buf += oob_size2;
>  
>  		config_cw_write_post(nandc);
> @@ -1685,7 +1700,7 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	config_cw_write_pre(nandc);
>  	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
> -		       data_size + oob_size);
> +		       data_size + oob_size, 0);
>  	config_cw_write_post(nandc);
>  
>  	ret = submit_descs(nandc);
> @@ -1769,7 +1784,8 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  	update_rw_regs(host, 1, false);
>  
>  	config_cw_write_pre(nandc);
> -	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, host->cw_size);
> +	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
> +		       host->cw_size, 0);
>  	config_cw_write_post(nandc);
>  
>  	ret = submit_descs(nandc);
> 


-- 
Best regards,
Marek Vasut
