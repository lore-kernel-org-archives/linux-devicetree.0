From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 08/25] mtd: nand: qcom: reorganize nand page write
Date: Fri, 4 Aug 2017 09:48:36 +0200
Message-ID: <20170804094836.7734111a@bbrezillon>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
        <1500464893-11352-9-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-9-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, 19 Jul 2017 17:17:56 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> Each NAND page consist of multiple codewords. Following is
> sequence for NAND page write according to hardware guide.
> 
> 1. Program Power-up configuration, page row, page column
>    address and flash configuration registers.
> 2. Write NAND_FLASH_CMD followed by NANC_EXEC_CMD for each
>    codeword.
> 3. Read NAND_FLASH_STATUS for each codeword.
> 
> The step 1 should be done once for each page and step 2,3 should
> be done for each codeword.
> 
> Currently, all the 3 steps are being done for each codeword which
> is wrong. Now this patch reorganizes page write functions to
> configure page specific register once and per codeword specific
> registers for each NAND ECC step.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 27ea594..5b71478 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -638,15 +638,24 @@ static void config_nand_single_cw_page_read(struct qcom_nand_controller *nandc)
>  	config_nand_cw_read(nandc);
>  }
>  
> -static void config_cw_write_pre(struct qcom_nand_controller *nandc)
> +/*
> + * Helper to prepare DMA descriptors used to configure registers needed for
> + * before writing a NAND page.
> + */
> +static void config_nand_page_write(struct qcom_nand_controller *nandc)
>  {
> -	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
> +	write_reg_dma(nandc, NAND_ADDR0, 2);
>  	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
>  	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
>  }
>  
> -static void config_cw_write_post(struct qcom_nand_controller *nandc)
> +/*
> + * Helper to prepare DMA descriptors for configuring registers
> + * before writing each codeword in NAND page.
> + */
> +static void config_nand_cw_write(struct qcom_nand_controller *nandc)
>  {
> +	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
>  
>  	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
> @@ -1329,6 +1338,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	host->use_ecc = true;
>  	update_rw_regs(host, ecc->steps, false);
> +	config_nand_page_write(nandc);
>  
>  	for (i = 0; i < ecc->steps; i++) {
>  		int data_size, oob_size;
> @@ -1342,7 +1352,6 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  			oob_size = ecc->bytes;
>  		}
>  
> -		config_cw_write_pre(nandc);
>  
>  		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size);
>  
> @@ -1360,7 +1369,7 @@ static int qcom_nandc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  				       oob_buf, oob_size);
>  		}
>  
> -		config_cw_write_post(nandc);
> +		config_nand_cw_write(nandc);
>  
>  		data_buf += data_size;
>  		oob_buf += oob_size;
> @@ -1393,6 +1402,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
>  
>  	host->use_ecc = false;
>  	update_rw_regs(host, ecc->steps, false);
> +	config_nand_page_write(nandc);
>  
>  	for (i = 0; i < ecc->steps; i++) {
>  		int data_size1, data_size2, oob_size1, oob_size2;
> @@ -1411,8 +1421,6 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
>  			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
>  		}
>  
> -		config_cw_write_pre(nandc);
> -
>  		write_data_dma(nandc, reg_off, data_buf, data_size1);
>  		reg_off += data_size1;
>  		data_buf += data_size1;
> @@ -1428,7 +1436,7 @@ static int qcom_nandc_write_page_raw(struct mtd_info *mtd,
>  		write_data_dma(nandc, reg_off, oob_buf, oob_size2);
>  		oob_buf += oob_size2;
>  
> -		config_cw_write_post(nandc);
> +		config_nand_cw_write(nandc);
>  	}
>  
>  	ret = submit_descs(nandc);
> @@ -1478,10 +1486,10 @@ static int qcom_nandc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
>  	set_address(host, host->cw_size * (ecc->steps - 1), page);
>  	update_rw_regs(host, 1, false);
>  
> -	config_cw_write_pre(nandc);
> +	config_nand_page_write(nandc);
>  	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
>  		       data_size + oob_size);
> -	config_cw_write_post(nandc);
> +	config_nand_cw_write(nandc);
>  
>  	ret = submit_descs(nandc);
>  
> @@ -1563,9 +1571,9 @@ static int qcom_nandc_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  	set_address(host, host->cw_size * (ecc->steps - 1), page);
>  	update_rw_regs(host, 1, false);
>  
> -	config_cw_write_pre(nandc);
> +	config_nand_page_write(nandc);
>  	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, host->cw_size);
> -	config_cw_write_post(nandc);
> +	config_nand_cw_write(nandc);
>  
>  	ret = submit_descs(nandc);
>  
