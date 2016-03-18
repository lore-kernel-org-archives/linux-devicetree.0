From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Fri, 18 Mar 2016 14:37:44 +0800
Message-ID: <56EBA238.9050902@huawei.com>
References: <1457682114-1667-1-git-send-email-xuejiancheng@huawei.com>
 <56E27C29.2040904@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E27C29.2040904-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Binquan Peng <pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jagan,
	Thank you for comments. I'll modify in next version.

Regards,
Jiancheng

On 2016/3/11 16:04, Jagan Teki wrote:
> 
> 
> On Friday 11 March 2016 01:11 PM, Jiancheng Xue wrote:
>> Add hisilicon spi-nor flash controller driver
>>
>> Signed-off-by: Binquan Peng <pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>> ---
[...]
>> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
>> +            size_t len, size_t *retlen, const u_char *write_buf)
>> +{
>> +    struct hifmc_priv *priv = nor->priv;
>> +    struct hifmc_host *host = priv->host;
>> +    const unsigned char *ptr = write_buf;
>> +    size_t num;
>> +
>> +    while (len > 0) {
>> +        if (to & HIFMC_DMA_MASK)
>> +            num = (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK))
>> +                >= len    ? len
>> +                : (HIFMC_DMA_MAX_LEN - (to & HIFMC_DMA_MASK));
>> +        else
>> +            num = (len >= HIFMC_DMA_MAX_LEN)
>> +                ? HIFMC_DMA_MAX_LEN : len;
> 
> Since num is the actual length bytes to read Better to rename num to actual_len for proper meaning here.
> 
>> +        memcpy(host->buffer, ptr, num);
>> +        hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, num,
>> +                FMC_OP_WRITE);
>> +        to += num;
>> +        ptr += num;
>> +        len -= num;
>> +    }
>> +    *retlen += (size_t)(ptr - write_buf);
> 
> Please avoid this type casting and do *retlen += num inside while.
> 
> -- 
> Jagan
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
