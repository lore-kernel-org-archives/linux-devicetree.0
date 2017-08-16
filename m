From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v4 08/20] mtd: nand: qcom: support for passing flags in
 transfer functions
Date: Wed, 16 Aug 2017 12:53:33 +0530
Message-ID: <0e5bd9593a974f04fea4a25559298e7c@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-9-git-send-email-absahu@codeaurora.org>
 <0d002cd6-17b7-f015-1af6-a53150e7ea0c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0d002cd6-17b7-f015-1af6-a53150e7ea0c@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 2017-08-16 09:48, Archit Taneja wrote:
> On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
>> The BAM has multiple flags to control the transfer. This patch
>> adds flags parameter in register and data transfer functions and
>> modifies all these functions call with appropriate flags using
>> following rule
>> 
>> 1. Read and write can’t go in single command descriptor so
>>     separate SGL should be used.
>> 2. For some of the requests, NWD flag should be set in BAM
>>     DMA descriptor.
>> 3. For Data write, the BAM has internal buffer for each codeword.
>>     All write request will modify the data in internal buffer and
>>     this buffer will be flushed to NAND device once EOT flag is set.
>>     So for all the write requests in single codeword, the EOT should
>>     be cleared for all tx data descriptors except the last one.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 122 
>> ++++++++++++++++++++++++------------------
>>   1 file changed, 70 insertions(+), 52 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index f52a692..d9c8a6b 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -180,6 +180,14 @@
>>   #define QPIC_PER_CW_CMD_SGL		32
>>   #define QPIC_PER_CW_DATA_SGL		8
>>   +/* Flags used for BAM DMA desc preparation*/

  We can remove BAM from here since later on
  we will pass flag for erase code word and it will
  be used by ADM also.

>> +/* Don't set the EOT in current tx sgl */
>> +#define NAND_BAM_NO_EOT			BIT(0)
>> +/* Set the NWD flag in current sgl */
>> +#define NAND_BAM_NWD			BIT(1)
>> +/* Finish writing in the current sgl and start writing in another sgl 
>> */
>> +#define NAND_BAM_NEXT_SGL		BIT(2)
>> +
>>   /*
>>    * This data type corresponds to the BAM transaction which will be 
>> used for all
>>    * NAND transfers.
>> @@ -731,7 +739,7 @@ static int prep_adm_dma_desc(struct 
>> qcom_nand_controller *nandc, bool read,
>>    * @num_regs:		number of registers to read
> 
> Minor comment: the read_reg_dma/write_reg/read_data/write_data_dma
> funcs add a new arg, so it
> would be nice to update the comment describing the function and its
> arguments. It would also

  Thanks. I will update the comment to include this new arg.

> be nice to mention that the flags are presently used only for
> controllers using BAM.
> 

  We can use this flag for ADM also so I will make the
  comment generic.

> With that,
> 
> Reviewed-by: Archit Taneja <architt@codeaurora.org>
> 
> Thanks,
> Archit
> 
>>    */
>>   static int read_reg_dma(struct qcom_nand_controller *nandc, int 
>> first,
>> -			int num_regs)
>> +			int num_regs, unsigned int flags)
>>   {
>>   	bool flow_control = false;
>>   	void *vaddr;
>> @@ -755,7 +763,7 @@ static int read_reg_dma(struct 
>> qcom_nand_controller *nandc, int first,
>>    * @num_regs:		number of registers to write
>>    */
>>   static int write_reg_dma(struct qcom_nand_controller *nandc, int 
>> first,
>> -			 int num_regs)
>> +			 int num_regs, unsigned int flags)
>>   {
>>   	bool flow_control = false;
>>   	struct nandc_regs *regs = nandc->regs;
>> @@ -767,6 +775,9 @@ static int write_reg_dma(struct 
>> qcom_nand_controller *nandc, int first,
>>   	if (first == NAND_FLASH_CMD)
>>   		flow_control = true;
>>   +	if (first == NAND_EXEC_CMD)
>> +		flags |= NAND_BAM_NWD;
>> +
>>   	if (first == NAND_DEV_CMD1_RESTORE)
>>   		first = NAND_DEV_CMD1;
>>   @@ -788,7 +799,7 @@ static int write_reg_dma(struct 
>> qcom_nand_controller *nandc, int first,
>>    * @size:		DMA transaction size in bytes
>>    */
>>   static int read_data_dma(struct qcom_nand_controller *nandc, int 
>> reg_off,
>> -			 const u8 *vaddr, int size)
>> +			 const u8 *vaddr, int size, unsigned int flags)
>>   {
>>   	return prep_adm_dma_desc(nandc, true, reg_off, vaddr, size, false);
>>   }
>> @@ -802,7 +813,7 @@ static int read_data_dma(struct 
>> qcom_nand_controller *nandc, int reg_off,
>>    * @size:		DMA transaction size in bytes
>>    */
>>   static int write_data_dma(struct qcom_nand_controller *nandc, int 
>> reg_off,
>> -			  const u8 *vaddr, int size)
>> +			  const u8 *vaddr, int size, unsigned int flags)
>>   {
>>   	return prep_adm_dma_desc(nandc, false, reg_off, vaddr, size, 
>> false);
>>   }
>> @@ -813,9 +824,9 @@ static int write_data_dma(struct 
>> qcom_nand_controller *nandc, int reg_off,
>>    */
>>   static void config_nand_page_read(struct qcom_nand_controller 
>> *nandc)
>>   {
>> -	write_reg_dma(nandc, NAND_ADDR0, 2);
>> -	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
>> -	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
>> +	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
>> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
>> +	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
>>   }
>>     /*
>> @@ -824,11 +835,12 @@ static void config_nand_page_read(struct 
>> qcom_nand_controller *nandc)
>>    */
>>   static void config_nand_cw_read(struct qcom_nand_controller *nandc)
>>   {
>> -	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
>> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
>> +	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>>   -	read_reg_dma(nandc, NAND_FLASH_STATUS, 2);
>> -	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1);
>> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
>> +	read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
>> +		     NAND_BAM_NEXT_SGL);
>>   }
>>     /*
>> @@ -847,9 +859,10 @@ static void 
>> config_nand_single_cw_page_read(struct qcom_nand_controller *nandc)
>>    */
>>   static void config_nand_page_write(struct qcom_nand_controller 
>> *nandc)
>>   {
>> -	write_reg_dma(nandc, NAND_ADDR0, 2);
>> -	write_reg_dma(nandc, NAND_DEV0_CFG0, 3);
>> -	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1);
>> +	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
>> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
>> +	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
>> +		      NAND_BAM_NEXT_SGL);
>>   }
>>     /*
>> @@ -858,13 +871,13 @@ static void config_nand_page_write(struct 
>> qcom_nand_controller *nandc)
>>    */
>>   static void config_nand_cw_write(struct qcom_nand_controller *nandc)
>>   {
>> -	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
>> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
>> +	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>>   -	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
>> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
>>   -	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
>> -	write_reg_dma(nandc, NAND_READ_STATUS, 1);
>> +	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
>> +	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
>>   }
>>     /*
>> @@ -911,8 +924,8 @@ static int nandc_param(struct qcom_nand_host 
>> *host)
>>   	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
>>   	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
>>   -	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1);
>> -	write_reg_dma(nandc, NAND_DEV_CMD1, 1);
>> +	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
>> +	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
>>     	nandc->buf_count = 512;
>>   	memset(nandc->data_buffer, 0xff, nandc->buf_count);
>> @@ -920,11 +933,11 @@ static int nandc_param(struct qcom_nand_host 
>> *host)
>>   	config_nand_single_cw_page_read(nandc);
>>     	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
>> -		      nandc->buf_count);
>> +		      nandc->buf_count, 0);
>>     	/* restore CMD1 and VLD regs */
>> -	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1);
>> -	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1);
>> +	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1, 0);
>> +	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1, 
>> NAND_BAM_NEXT_SGL);
>>     	return 0;
>>   }
>> @@ -946,14 +959,14 @@ static int erase_block(struct qcom_nand_host 
>> *host, int page_addr)
>>   	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
>>   	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>>   -	write_reg_dma(nandc, NAND_FLASH_CMD, 3);
>> -	write_reg_dma(nandc, NAND_DEV0_CFG0, 2);
>> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
>> +	write_reg_dma(nandc, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
>> +	write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
>> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>>   -	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
>> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
>>   -	write_reg_dma(nandc, NAND_FLASH_STATUS, 1);
>> -	write_reg_dma(nandc, NAND_READ_STATUS, 1);
>> +	write_reg_dma(nandc, NAND_FLASH_STATUS, 1, 0);
>> +	write_reg_dma(nandc, NAND_READ_STATUS, 1, NAND_BAM_NEXT_SGL);
>>     	return 0;
>>   }
>> @@ -973,10 +986,10 @@ static int read_id(struct qcom_nand_host *host, 
>> int column)
>>   	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
>>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>>   -	write_reg_dma(nandc, NAND_FLASH_CMD, 4);
>> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
>> +	write_reg_dma(nandc, NAND_FLASH_CMD, 4, NAND_BAM_NEXT_SGL);
>> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>>   -	read_reg_dma(nandc, NAND_READ_ID, 1);
>> +	read_reg_dma(nandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
>>     	return 0;
>>   }
>> @@ -990,10 +1003,10 @@ static int reset(struct qcom_nand_host *host)
>>   	nandc_set_reg(nandc, NAND_FLASH_CMD, RESET_DEVICE);
>>   	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>>   -	write_reg_dma(nandc, NAND_FLASH_CMD, 1);
>> -	write_reg_dma(nandc, NAND_EXEC_CMD, 1);
>> +	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>> +	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>>   -	read_reg_dma(nandc, NAND_FLASH_STATUS, 1);
>> +	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
>>     	return 0;
>>   }
>> @@ -1389,7 +1402,7 @@ static int read_page_ecc(struct qcom_nand_host 
>> *host, u8 *data_buf,
>>     		if (data_buf)
>>   			read_data_dma(nandc, FLASH_BUF_ACC, data_buf,
>> -				      data_size);
>> +				      data_size, 0);
>>     		/*
>>   		 * when ecc is enabled, the controller doesn't read the real
>> @@ -1405,7 +1418,7 @@ static int read_page_ecc(struct qcom_nand_host 
>> *host, u8 *data_buf,
>>   				*oob_buf++ = 0xff;
>>     			read_data_dma(nandc, FLASH_BUF_ACC + data_size,
>> -				      oob_buf, oob_size);
>> +				      oob_buf, oob_size, 0);
>>   		}
>>     		if (data_buf)
>> @@ -1447,7 +1460,7 @@ static int copy_last_cw(struct qcom_nand_host 
>> *host, int page)
>>     	config_nand_single_cw_page_read(nandc);
>>   -	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size);
>> +	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, size, 0);
>>     	ret = submit_descs(nandc);
>>   	if (ret)
>> @@ -1516,19 +1529,19 @@ static int qcom_nandc_read_page_raw(struct 
>> mtd_info *mtd,
>>     		config_nand_cw_read(nandc);
>>   -		read_data_dma(nandc, reg_off, data_buf, data_size1);
>> +		read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>>   		reg_off += data_size1;
>>   		data_buf += data_size1;
>>   -		read_data_dma(nandc, reg_off, oob_buf, oob_size1);
>> +		read_data_dma(nandc, reg_off, oob_buf, oob_size1, 0);
>>   		reg_off += oob_size1;
>>   		oob_buf += oob_size1;
>>   -		read_data_dma(nandc, reg_off, data_buf, data_size2);
>> +		read_data_dma(nandc, reg_off, data_buf, data_size2, 0);
>>   		reg_off += data_size2;
>>   		data_buf += data_size2;
>>   -		read_data_dma(nandc, reg_off, oob_buf, oob_size2);
>> +		read_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
>>   		oob_buf += oob_size2;
>>   	}
>>   @@ -1595,7 +1608,8 @@ static int qcom_nandc_write_page(struct 
>> mtd_info *mtd, struct nand_chip *chip,
>>   		}
>>     -		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size);
>> +		write_data_dma(nandc, FLASH_BUF_ACC, data_buf, data_size,
>> +			       i == (ecc->steps - 1) ? NAND_BAM_NO_EOT : 0);
>>     		/*
>>   		 * when ECC is enabled, we don't really need to write anything
>> @@ -1608,7 +1622,7 @@ static int qcom_nandc_write_page(struct mtd_info 
>> *mtd, struct nand_chip *chip,
>>   			oob_buf += host->bbm_size;
>>     			write_data_dma(nandc, FLASH_BUF_ACC + data_size,
>> -				       oob_buf, oob_size);
>> +				       oob_buf, oob_size, 0);
>>   		}
>>     		config_nand_cw_write(nandc);
>> @@ -1663,19 +1677,22 @@ static int qcom_nandc_write_page_raw(struct 
>> mtd_info *mtd,
>>   			oob_size2 = host->ecc_bytes_hw + host->spare_bytes;
>>   		}
>>   -		write_data_dma(nandc, reg_off, data_buf, data_size1);
>> +		write_data_dma(nandc, reg_off, data_buf, data_size1,
>> +			       NAND_BAM_NO_EOT);
>>   		reg_off += data_size1;
>>   		data_buf += data_size1;
>>   -		write_data_dma(nandc, reg_off, oob_buf, oob_size1);
>> +		write_data_dma(nandc, reg_off, oob_buf, oob_size1,
>> +			       NAND_BAM_NO_EOT);
>>   		reg_off += oob_size1;
>>   		oob_buf += oob_size1;
>>   -		write_data_dma(nandc, reg_off, data_buf, data_size2);
>> +		write_data_dma(nandc, reg_off, data_buf, data_size2,
>> +			       NAND_BAM_NO_EOT);
>>   		reg_off += data_size2;
>>   		data_buf += data_size2;
>>   -		write_data_dma(nandc, reg_off, oob_buf, oob_size2);
>> +		write_data_dma(nandc, reg_off, oob_buf, oob_size2, 0);
>>   		oob_buf += oob_size2;
>>     		config_nand_cw_write(nandc);
>> @@ -1729,8 +1746,8 @@ static int qcom_nandc_write_oob(struct mtd_info 
>> *mtd, struct nand_chip *chip,
>>   	update_rw_regs(host, 1, false);
>>     	config_nand_page_write(nandc);
>> -	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
>> -		       data_size + oob_size);
>> +	write_data_dma(nandc, FLASH_BUF_ACC,
>> +		       nandc->data_buffer, data_size + oob_size, 0);
>>   	config_nand_cw_write(nandc);
>>     	ret = submit_descs(nandc);
>> @@ -1814,7 +1831,8 @@ static int qcom_nandc_block_markbad(struct 
>> mtd_info *mtd, loff_t ofs)
>>   	update_rw_regs(host, 1, false);
>>     	config_nand_page_write(nandc);
>> -	write_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer, 
>> host->cw_size);
>> +	write_data_dma(nandc, FLASH_BUF_ACC,
>> +		       nandc->data_buffer, host->cw_size, 0);
>>   	config_nand_cw_write(nandc);
>>     	ret = submit_descs(nandc);
>> 
