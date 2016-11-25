From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed
 SoCs
Date: Fri, 25 Nov 2016 14:57:56 +0100
Message-ID: <9569aaca-5748-e82d-20e1-ed846fb762f6@gmail.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
 <CACPK8Xc7Dy=4oaZ_+j3hCEkMY+sqZ_-QkCQ9okmUoOjTpuZvvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xc7Dy=4oaZ_+j3hCEkMY+sqZ_-QkCQ9okmUoOjTpuZvvA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/21/2016 05:45 AM, Joel Stanley wrote:
> Hello Marek,

Hi!

> Thank you for the review. I have answered a few of your questions;
> I'll leave the rest to Cedric.
> 
> On Mon, Nov 21, 2016 at 8:13 AM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>> index 4a682ee0f632..96148600fdab 100644
>>> --- a/drivers/mtd/spi-nor/Kconfig
>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>> @@ -76,4 +76,16 @@ config SPI_NXP_SPIFI
>>>         Flash. Enable this option if you have a device with a SPIFI
>>>         controller and want to access the Flash as a mtd device.
>>>
>>> +config ASPEED_FLASH_SPI
>>
>> Should be SPI_ASPEED , see the other controllers and keep the list sorted.
> 
> Perhaps SPI_NOR_ASPEED so it's clear it's not a driver for a generic SPI bus?

But it's not a driver for SPI-NOR only either, it seems it's a driver
for multiple distinct devices.

>>> +     tristate "Aspeed flash controllers in SPI mode"
>>> +     depends on HAS_IOMEM && OF
>>> +     depends on ARCH_ASPEED || COMPILE_TEST
>>> +     # IO_SPACE_LIMIT must be equivalent to (~0UL)
>>> +     depends on !NEED_MACH_IO_H
>>
>> Why?
>>
>>> +     help
>>> +       This enables support for the New Static Memory Controller
>>> +       (FMC) in the Aspeed SoCs (AST2400 and AST2500) when attached
>>> +       to SPI nor chips, and support for the SPI Memory controller
>>> +       (SPI) for the BIOS.
>>
>> I think there is a naming chaos between FMC, SMC (as in Static MC) and
>> SMC (as in SPI MC).
> 
> Yes, you're spot on. This naming chaos comes form the vendor's documentation.
> 
> I think we could re-work this sentence to make it clearer.

Please do before someone's head explodes from this :)

>>> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
>>> +                                 size_t len)
>>> +{
>>
>> What if start of buf is unaligned ?
>>
>>> +     if ((((unsigned long)src | (unsigned long)buf | len) & 3) == 0) {
>>
>> Uh, should use boolean OR, not bitwise or. Also, if you're testing
>> pointer for NULL, do if (!ptr) .
>>
>> if (!src || !buf || !len)
>>    return;
> 
> That's a different test. We're testing here that the buffers are
> aligned to see if we can do a word-at-a-time copy.
> 
> If not, it falls through to do a byte-at-a-time copy. I think this
> covers your first question about buf being unaligned.

Ah, I see, thanks for clarifying. Comment in the code would be helpful
for why what you're doing is OK. And I think you want to cast to
uintptr_t instead to make this work on 64bit.

> Cedric, perhaps you could create a macro called IS_ALLIGNED to make it
> clear what this is doing?

Yup, thanks!

>>
>> while (...)
>>
>>> +             while (len > 3) {
>>> +                     *(u32 *)buf = readl(src);
>>> +                     buf += 4;
>>> +                     src += 4;
>>> +                     len -= 4;
>>> +             }
>>> +     }
>>> +
>>> +     while (len--) {
>>> +             *(u8 *)buf = readb(src);
>>> +             buf += 1;
>>> +             src += 1;
>>> +     }
>>> +     return 0;
>>> +}
>>> +/*
>>> + * SPI Flash Configuration Register (AST2400 SPI)
>>> + */
>>> +#define CONFIG_REG                   0x0
>>> +#define    CONFIG_ENABLE_CE_INACTIVE     BIT(1)
>>> +#define    CONFIG_WRITE                          BIT(0)
>>
>> #define[space]FOO[tab]BIT(bar)
> 
> These are bits within the CONFIG_REG. It follows the same style as
> other spi-nor drivers, eg. nxp-spifi.
> 
> I think it's somewhat clearer, but if you have a strong preference
> against then fair enough.

It triggers my OCD, but I think it's a matter of taste, so I don't care
that much.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
