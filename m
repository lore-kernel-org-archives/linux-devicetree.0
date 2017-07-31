From: Alexandru Gagniuc <alex.g-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/5] mtd: spi-nor: Add driver for Adaptrum Anarion QSPI
 controller
Date: Mon, 31 Jul 2017 15:59:17 -0700
Message-ID: <054534f2-deed-a339-f82a-e3eba569b029@adaptrum.com>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-5-alex.g@adaptrum.com>
 <135fdf95-1029-2d34-2802-1283a73588e5@gmail.com>
 <83a4e27a-b96c-0558-fbb5-10e64f9bf59b@adaptrum.com>
 <e7c916c4-7b0a-1f76-b91f-5befeb24faf5@gmail.com>
 <e1390c36-086b-aeba-848c-f45dcb88b5ce@adaptrum.com>
 <1da97744-bc02-420e-d4e9-5ebf331475e8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1da97744-bc02-420e-d4e9-5ebf331475e8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/31/2017 03:43 PM, Marek Vasut wrote:
> On 08/01/2017 12:20 AM, Alexandru Gagniuc wrote:
>> On 07/31/2017 02:33 PM, Marek Vasut wrote:
>>> On 07/31/2017 07:17 PM, Alexandru Gagniuc wrote:
>>>>>> +struct anarion_qspi {
>>>>>> +    struct        spi_nor nor;
>>>>>> +    struct        device *dev;
>>>>>> +    uintptr_t    regbase;
>>>>>
>>>>> Should be void __iomem * I guess ?
>>>>
>>>> I chose uintptr_t as opposed to void *, because arithmetic on void * is
>>>> not valid in C. What is the right answer hen, without risking undefined
>>>> behavior?
>>>
>>> What sort of arithmetic ? It's perfectly valid in general ...
>>
>> ISO/IEC 9899:201x, Section 6.5.6, constraint(2) is not met when the one
>> of the operands to addition is a void pointer.
>> Section 6.2.5 (19) defines void to be an incomplete type.
>
> Is that something new in C 201x draft ?

C99 had similar restrictions.

> Anyway, this would mean half of the drivers are broken, so I'm not convinced.

They are. Feel free to send me a private email if you want to discuss 
this further.

Alex

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
