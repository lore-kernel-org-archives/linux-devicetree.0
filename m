From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH v9] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Date: Fri, 8 Apr 2016 16:26:14 +0800
Message-ID: <57076B26.7030700@huawei.com>
References: <1458979861-3619-1-git-send-email-xuejiancheng@huawei.com>
 <56F73BC9.5000300@gmail.com> <56F8F630.5050008@huawei.com>
 <20160404064418.GC13995@localhost> <5705C17F.9030904@huawei.com>
 <5705C5E2.6070206@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5705C5E2.6070206-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2016/4/7 10:28, Marek Vasut wrote:
> On 04/07/2016 04:10 AM, Jiancheng Xue wrote:
>> Hi Brian,
>>    Thank you very much for your comments. I'll fix these issues in next version.
>> In addition, for easy understanding I'd like to rewrite hisi_spi_nor_write and
>> hisi_spi_nor_read. Your comments on these modifications will be highly appreciated.
> 
> Would you please stop top-posting ? It rubs some people the wrong way.
> 
I feel very sorry about that. I have read the etiquette and won't make the same mistake again.

>> static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
>> 		size_t *retlen, u_char *read_buf)
>> {
>> 	struct hifmc_priv *priv = nor->priv;
>> 	struct hifmc_host *host = priv->host;
>> 	int i;
>>
>> 	/* read all bytes in only one time */
>> 	if (len <= HIFMC_DMA_MAX_LEN) {
>> 		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
>> 				len, FMC_OP_READ);
>> 		memcpy(read_buf, host->buffer, len);
> 
> Is all the ad-hoc memcpying necessary? I think you can use
> dma_map_single() and co to obtain DMAble memory for your
> controller's use and then you can probably get rid of most
> of this stuff.
> 
Considering read_buf >= high_mem case, I think it is also complicated to use dma_map_*
and the DMA buffer allocated by the driver is still needed. But I am not sure about
this. Please let me know if I am wrong. Thank you!

Regards,
Jiancheng

>> 	} else {
>> 		/* read HIFMC_DMA_MAX_LEN bytes at a time */
>> 		for (i = 0; i < len; i += HIFMC_DMA_MAX_LEN) {
>> 			hisi_spi_nor_dma_transfer(nor, from + i, host->dma_buffer,
>> 				HIFMC_DMA_MAX_LEN, FMC_OP_READ);
>> 			memcpy(read_buf + i, host->buffer, HIFMC_DMA_MAX_LEN);
>> 		}
>> 		/* read remaining bytes */
>> 		i -= HIFMC_DMA_MAX_LEN;
>> 		hisi_spi_nor_dma_transfer(nor, from + i, host->dma_buffer,
>> 				len - i, FMC_OP_READ);
>> 		memcpy(read_buf + i, host->buffer, len - i);
>> 	}
>> 	*retlen = len;
>>
>> 	return 0;
>> }
>>
[...]
>> On 2016/4/4 14:44, Brian Norris wrote:
>>> Hi Jiancheng,
>>>
>>> Looking good. In addition to Marek's comments, I have just a few small
>>> comments. I'll post a small diff at the end, and a few inline comments.
>>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
