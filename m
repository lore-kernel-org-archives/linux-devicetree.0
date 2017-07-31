From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] mtd: spi-nor: Add driver for Adaptrum Anarion QSPI
 controller
Date: Tue, 1 Aug 2017 00:43:41 +0200
Message-ID: <1da97744-bc02-420e-d4e9-5ebf331475e8@gmail.com>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-5-alex.g@adaptrum.com>
 <135fdf95-1029-2d34-2802-1283a73588e5@gmail.com>
 <83a4e27a-b96c-0558-fbb5-10e64f9bf59b@adaptrum.com>
 <e7c916c4-7b0a-1f76-b91f-5befeb24faf5@gmail.com>
 <e1390c36-086b-aeba-848c-f45dcb88b5ce@adaptrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e1390c36-086b-aeba-848c-f45dcb88b5ce-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandru Gagniuc <alex.g-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org>, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/01/2017 12:20 AM, Alexandru Gagniuc wrote:
> On 07/31/2017 02:33 PM, Marek Vasut wrote:
>> On 07/31/2017 07:17 PM, Alexandru Gagniuc wrote:
> 
> Hi Marek,
> 
> Thank you again for your feedback. I've applied a majority of your
> suggestions, and I am very happy with the result. I should have v2
> posted within a day or so.

No. You should have v2 out in about a week or so after people have time
to review v1 some more.

> [snip]
>>>>> +/*
>>>>> + * This mask does not match reality. Get over it:
>>>>
>>>> What is this about ?
>>>
>>> Each stage of the QSPI chain has two registers. The second register has
>>> a bitfield which takes in the length of the stage. For example, for
>>> DATA2, we can set the length up to 0x4000, but for ADDR2, we can only
>>> set a max of 4 bytes. I wrote this comment as a reminder to myself to be
>>> careful about using this mask. I'll rephrase the comment for [v2]
>>
>> Please do.
>>
> Staged for [PATCH v2]
> 
>>>>> + * DATA2:    0x3fff
>>>>> + * CMD2:    0x0003
>>>>> + * ADDR2:    0x0007
>>>>> + * PERF2:    0x0000
>>>>> + * HI_Z:    0x003f
>>>>> + * BCNT:    0x0007
>>>>> + */
>>>>> +#define CHAIN_LEN(x)        ((x - 1) & ASPI_DATA_LEN_MASK)

btw parenthesis around (x) missing, although this is like GEN_MASK() or
something here ...

>>>>> +struct anarion_qspi {
>>>>> +    struct        spi_nor nor;
>>>>> +    struct        device *dev;
>>>>> +    uintptr_t    regbase;
>>>>
>>>> Should be void __iomem * I guess ?
>>>
>>> I chose uintptr_t as opposed to void *, because arithmetic on void * is
>>> not valid in C. What is the right answer hen, without risking undefined
>>> behavior?
>>
>> What sort of arithmetic ? It's perfectly valid in general ...
> 
> ISO/IEC 9899:201x, Section 6.5.6, constraint(2) is not met when the one
> of the operands to addition is a void pointer.
> Section 6.2.5 (19) defines void to be an incomplete type.

Is that something new in C 201x draft ? Anyway, this would mean half of
the drivers are broken, so I'm not convinced.

> [snip]
> 
>>>> Is this stuff below something like ioread32_rep() ?
>>>>
>>>>> +    aspi_write_reg(aspi, ASPI_REG_BYTE_COUNT, sizeof(uint32_t));
>>>>> +    while (len >= 4) {
>>>>> +        data = aspi_read_reg(aspi, ASPI_REG_DATA1);
>>>>> +        memcpy(buf, &data, sizeof(data));
>>>>> +        buf += 4;
>>>>> +        len -= 4;
>>>>> +    }
>>>
>>> That is very similar to ioread32_rep, yes. I kept this as for the
>>> reasons outlined above, but changing this to _rep() seems innocent
>>> enough.
>>
>> What reason ?
> 
> Being able to share the code between the different codebases where it is
> used.

Yes, that argument isn't gonna work, it'd make things impossible to
maintain in the kernel.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
