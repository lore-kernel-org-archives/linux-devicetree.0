From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Date: Thu, 31 Mar 2016 15:24:45 +0800
Message-ID: <56FCD0BD.4010505@huawei.com>
References: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458979861-3619-1-git-send-email-xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,
    I'll highly appreciated any of your comments.

On 2016/3/26 16:11, Jiancheng Xue wrote:
> Add hisilicon spi-nor flash controller driver
> 
[...]
> +static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
> +		size_t *retlen, u_char *read_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	unsigned char *ptr = read_buf;
> +	size_t actual_len;
> +
> +	*retlen = 0;
> +	while (len > 0) {
> +		actual_len = (len >= HIFMC_DMA_MAX_LEN)
> +			? HIFMC_DMA_MAX_LEN : len;
> +		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
> +				actual_len, FMC_OP_READ);
> +		memcpy(ptr, host->buffer, actual_len);
> +		ptr += actual_len;
> +		from += actual_len;
> +		len -= actual_len;
> +		*retlen += actual_len;
> +	}
> +
> +	return 0;
> +}
For easy understanding, the read function will be changed like below:

static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
		size_t *retlen, u_char *read_buf)
{
	struct hifmc_priv *priv = nor->priv;
	struct hifmc_host *host = priv->host;
	int i;

	/* read all bytes in only one time */
	if (len <= HIFMC_DMA_MAX_LEN) {
		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
				len, FMC_OP_READ);
		memcpy(read_buf, host->buffer, len);
	} else {
		/* read HIFMC_DMA_MAX_LEN bytes at a time */
		for (i = 0; i < len; i += HIFMC_DMA_MAX_LEN) {
			hisi_spi_nor_dma_transfer(nor, from + i, host->dma_buffer,
				HIFMC_DMA_MAX_LEN, FMC_OP_READ);
			memcpy(read_buf + i, host->buffer, HIFMC_DMA_MAX_LEN);
		}
		/* read remaining bytes */
		i -= HIFMC_DMA_MAX_LEN;
		hisi_spi_nor_dma_transfer(nor, from + i, host->dma_buffer,
				len - i, FMC_OP_READ);
		memcpy(read_buf + i, host->buffer, len - i);
	}
	*retlen = len;

	return 0;
}

> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> +			size_t len, size_t *retlen, const u_char *write_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	const unsigned char *ptr = write_buf;
> +	size_t actual_len;
> +
> +	*retlen = 0;
> +	while (len > 0) {
> +		if (to & HIFMC_DMA_MASK)
> +			actual_len = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
> +				>= len	? len
> +				: (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));
> +		else
> +			actual_len = (len >= HIFMC_DMA_MAX_LEN)
> +				? HIFMC_DMA_MAX_LEN : len;
> +		memcpy(host->buffer, ptr, actual_len);
> +		hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, actual_len,
> +				FMC_OP_WRITE);
> +		to += actual_len;
> +		ptr += actual_len;
> +		len -= actual_len;
> +		*retlen += actual_len;
> +	}
> +}
> +
Because "len" passed from spi_nor_write is smaller than nor->page_size, and nor->page_size
is smaller than the length of host->dma_buffer. We can transfer "len" bytes data by
hisi_spi_nor_dma_transfer at one time. hisi_spi_nor_write can be simplified like below:

static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
			size_t len, size_t *retlen, const u_char *write_buf)
{
	struct hifmc_priv *priv = nor->priv;
	struct hifmc_host *host = priv->host;

	/* len is smaller than dma buffer length*/
	memcpy(host->buffer, write_buf, len);
	hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, len,
					FMC_OP_WRITE);

	*retlen = len;
}

Regards,
Jiancheng





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
