From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Date: Wed, 9 Mar 2016 11:35:57 +0800
Message-ID: <56DF9A1D.8090100@huawei.com>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
 <20160307225229.GC55664@google.com> <56DE9A79.30704@huawei.com>
 <20160308104628.6224bde2@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160308104628.6224bde2@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, furquan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Binquan Peng <pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 2016/3/8 17:46, Boris Brezillon wrote:
>> [...]
>>>> +static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
>>>> +		int len)
>>>> +{
>>>> +	struct hifmc_priv *priv = nor->priv;
>>>> +	struct hifmc_host *host = priv->host;
>>>> +	int ret;
>>>> +
>>>> +	ret = hisi_spi_nor_send_cmd(nor, opcode, len);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	memcpy(buf, host->iobase, len);
>>>
>>> sparse doesn't like any of these memcpy()'s, since that's __iomem. Are
>>> you sure you want a regular memcpy here, and elsewhere?
>>>
>> It's not a must to use memcpy though host->iobase represents a segment of inner memory
>> which stores data from flash device byte by byte.  I will give up using memcpy here and
>> hisi_spi_nor_write_reg() in next version. Thank you!
> 
> Or you can use memcpy_fromio(), which should give you better perfs than
> using readX() accessors in a loop.
> 

Thank you very much for your suggestion. I'll look into sparse and this function.

Regards,
Jiancheng

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
