From: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v10] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Fri, 29 Apr 2016 10:13:20 +0800
Message-ID: <5722C340.2010602@hisilicon.com>
References: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
 <20160427153850.GE25981@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160427153850.GE25981@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, hermit.wangheming-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jiangheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Brian,

On 2016/4/27 23:38, Brian Norris wrote:
> Hi Jiancheng,
> 
> Cyrille hit on one of my concerns; if posible we'd like not to have you
> sniffing the opcodes in read_reg()/write_reg(). But let's keep the
> discussion on that thread.
> 
OK. I'll look into this issue seriously and reply on that thread later.

> Two other comments below.
> 
> On Tue, Apr 19, 2016 at 03:27:19PM +0800, Jiancheng Xue wrote:
>> From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> Add hisilicon spi-nor flash controller driver
>>
>> Signed-off-by: Binquan Peng <pengbinquan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Signed-off-by: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
[...]
>> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
>> new file mode 100644
>> index 0000000..942dafd
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
>> @@ -0,0 +1,539 @@
> 
> [...]
> 
>> +static void hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
>> +		dma_addr_t dma_buf, size_t len, u8 op_type)
>> +{
>> +	struct hifmc_priv *priv = nor->priv;
>> +	struct hifmc_host *host = priv->host;
>> +	u8 if_type = 0, dummy = 0;
>> +	u8 w_cmd = 0, r_cmd = 0;
>> +	u32 reg;
>> +
>> +	writel(start_off, host->regbase + FMC_ADDRL);
>> +
>> +	if (op_type == FMC_OP_READ) {
>> +		if_type = get_if_type(nor->flash_read);
>> +		dummy = nor->read_dummy >> 3;
>> +		r_cmd = nor->read_opcode;
>> +	} else {
>> +		w_cmd = nor->program_opcode;
>> +	}
>> +
>> +	reg = OP_CFG_FM_CS(priv->chipselect)
>> +		| OP_CFG_MEM_IF_TYPE(if_type)
>> +		| OP_CFG_ADDR_NUM(nor->addr_width)
>> +		| OP_CFG_DUMMY_NUM(dummy);
>> +	writel(reg, host->regbase + FMC_OP_CFG);
>> +
>> +	reg = FMC_DMA_LEN_SET(len);
>> +	writel(reg, host->regbase + FMC_DMA_LEN);
>> +	writel(dma_buf, host->regbase + FMC_DMA_SADDR_D0);
>> +
>> +	reg = OP_CTRL_RD_OPCODE(r_cmd)
>> +		| OP_CTRL_WR_OPCODE(w_cmd)
>> +		| OP_CTRL_RW_OP(op_type)
>> +		| OP_CTRL_DMA_OP_READY;
>> +	writel(0xff, host->regbase + FMC_INT_CLR);
>> +	writel(reg, host->regbase + FMC_OP_DMA);
>> +	wait_op_finish(host);
> 
> Do you want to return the status here, so we can handle errors?
> 

OK. I'll fix it in v11.

>> +}
>> +
>> +static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
>> +		size_t *retlen, u_char *read_buf)
>> +{
>> +	struct hifmc_priv *priv = nor->priv;
>> +	struct hifmc_host *host = priv->host;
>> +	int offset;
>> +
>> +	/* read all bytes in only one read */
>> +	if (len <= HIFMC_DMA_MAX_LEN) {
>> +		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
>> +				len, FMC_OP_READ);
>> +		memcpy(read_buf, host->buffer, len);
> 
> Why do you have a special case for "all in one read"? This is just a
> basic loop...
> 
See below.
>> +	} else {
>> +		/* read HIFMC_DMA_MAX_LEN bytes at a time */
>> +		for (offset = 0; offset < len; offset += HIFMC_DMA_MAX_LEN) {
>> +			hisi_spi_nor_dma_transfer(nor, from + offset,
>> +				host->dma_buffer,
>> +				HIFMC_DMA_MAX_LEN, FMC_OP_READ);
>> +			memcpy(read_buf + offset,
>> +				host->buffer, HIFMC_DMA_MAX_LEN);
>> +		}
>> +		/* read remaining bytes */
>> +		offset -= HIFMC_DMA_MAX_LEN;
>> +		hisi_spi_nor_dma_transfer(nor, from + offset, host->dma_buffer,
>> +				len - offset, FMC_OP_READ);
>> +		memcpy(read_buf + offset, host->buffer, len - offset);
>> +	}
> 
> I think the entire if/else can be rewritten as:
> 
> 	for (offset = 0; offset < len; offset += HIFMC_DMA_MAX_LEN) {
> 		size_t trans = min(HIFMC_DMA_MAX_LEN, len - offset);
> 
> 		hisi_spi_nor_dma_transfer(nor, from + offset, host->dma_buffer,
> 					  trans, FMC_OP_READ);
> 		memcpy(read_buf + offset, host->buffer, trans);
> 	}
> 
I had referred to the implementation of spi_nor_write. But now it seems much
simpler and clearer above. I'll apply this code in v11. Thank you very much.

>> +	*retlen = len;
>> +
>> +	return 0;
>> +}
>> +
>> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
>> +			size_t len, size_t *retlen, const u_char *write_buf)
>> +{
>> +	struct hifmc_priv *priv = nor->priv;
>> +	struct hifmc_host *host = priv->host;
>> +
>> +	/* len is smaller than HIFMC_DMA_MAX_LEN*/
> 
> Where do you get that assumption? This function must handle whatever
> 'len' is passed to it, and that may be large. (I suspect your error is
> inspired by the fact that mtd-utils *usually* does smaller write
> transfers.)
> 
In spi_nor_write, nor->write is called with the len not bigger than nor->page_size.
I wrongly thought nor->page_size was always smaller than HIFMC_DMA_MAX_LEN.
I'll rewrite this function referring to _read function. Thank you!

Regards,
Jiancheng

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
