From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Sat, 10 Dec 2016 20:08:08 +0100
Message-ID: <2b51e3b8-5d02-c045-63c6-fcb0c9f8f460@gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-2-git-send-email-clg@kaod.org>
 <68aa03be-8195-1824-a9e1-609a5ad74381@gmail.com>
 <f0ad683a-0989-e1ae-b33b-9746260ffa0e@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f0ad683a-0989-e1ae-b33b-9746260ffa0e-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/10/2016 06:34 PM, Cédric Le Goater wrote:
> Hello, 

Hi!

> On 12/10/2016 05:01 AM, Marek Vasut wrote:
>> On 12/09/2016 05:49 PM, Cédric Le Goater wrote:
>>
>> [...]
>>
>>
>>> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
>>> +				    size_t len)
>>> +{
>>> +	if (IS_ALIGNED((u32)src, sizeof(u32)) &&
>>> +	    IS_ALIGNED((u32)buf, sizeof(u32)) &&
>>> +	    IS_ALIGNED(len, sizeof(u32))) {
>>
>> Did you try compiling this on any 64bit system ?
> 
> I cross compile the kernel on a 64bit host and then upload on the
> target. What kind of problem are you forseeing ? 

Something about the pointer being clipped to 4 bytes, I'd rather use
uintptr_t cast instead of u32 . I don't think it matters for this check,
but just to be extra precise ...

>>
>>> +		while (len > 3) {
>>> +			*(u32 *)buf = readl(src);


[...]

>>> +/*
>>> + * Segment Address Registers. Start and end addresses are encoded
>>> + * using 8MB units
>>> + */
>>> +#define SEGMENT_ADDR_REG0		0x30
>>> +#define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)
>>
>> is that ((r) & 0xff0000) << 7 ?
>>
>>> +#define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)
>>
>> ((r) & 0xff000000) >> 1 ?
> 
> yes. 
> 
> I rather keep the initial macros though, which I found easier to 
> understand.
> 
> The Segment Register uses a 8MB unit to encode the start address
> and the end address of the mapping window of a flash SPI slave :
> 
>         | byte 1 | byte 2 | byte 3 | byte 4 |
>         +--------+--------+--------+--------+
>         |  end   |  start |   0    |   0    |

Then the above should be in the comment , it's a good explanation :)

Thanks!

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
