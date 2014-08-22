From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Allow mem_reserve of memory with a base address of zero
Date: Thu, 21 Aug 2014 22:26:14 -0500
Message-ID: <CAL_JsqLHyhWj4k1cNxaoidYL0Eic5Km00pNSZSkW1MEJ+OttzA@mail.gmail.com>
References: <1407357004-31713-1-git-send-email-alcooperx@gmail.com>
 <CAL_Jsq+=EZu6_Dy59sAEE0B5T_uS1vA5YQQmKAe9vj0VOHVyCQ@mail.gmail.com>
 <20140812164813.6B202C405D3@trevor.secretlab.ca> <53EA48AB.4030902@codeaurora.org>
 <CAOGqxeWqkHJtm1y1HxnnhcFNb3WdVPNnTT0hjtjJzEjNZ2icjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOGqxeWqkHJtm1y1HxnnhcFNb3WdVPNnTT0hjtjJzEjNZ2icjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 19, 2014 at 1:54 PM, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I guess another way to look at this is, why disallow reserving memory
> at location 0?

Please don't top post in replies to the list.

This absolutely should be fixed and I will apply. The /memreserve/ tag
already supports this as I reserve address 0 on the platform I
maintain and the new reserved regions should support the same. I'm
only questioning the reasoning for this case. With the limitations in
dma masks, there's not an easy way to fix this just for OHCI.

Rob

>
> Al
>
> On Tue, Aug 12, 2014 at 1:02 PM, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> On 8/12/2014 9:48 AM, Grant Likely wrote:
>>> On Wed, 6 Aug 2014 17:02:44 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> On Wed, Aug 6, 2014 at 3:30 PM, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> __reserved_mem_reserve_reg() won't reserve memory if the base address
>>>>> is zero. This change removes the check for a base address of zero and
>>>>> allows it to be reserved.
>>>>>
>>>>> Allowing the first 4K of memory to be reserved will help solve a
>>>>> problem on some ARM systems where the the first 16K of memory is
>>>>> unused and becomes allocable memory. This will prevent this memory
>>>>> from being used for DMA by drivers like the USB OHCI driver which
>>>>> consider a physical address of zero to be illegal.
>>>>
>>>> OHCI driver or hardware? I agree with the change, but really think
>>>> this should be fixed in the driver in the former case or a property of
>>>> the OHCI node in the latter.
>>>
>>> I'm not hard and fast on that. I don't think it is unreasonable to
>>> reserve the base of memory as the platform level if there is a bug
>>> causing DMA to fail at that address.
>>>
>>> If this is a common problem (and not merely a few boards) then I agree.
>>> Fixing it this way is just asking for the same problem to show up again
>>> and again on new boards that haven't explicitly reserved the memory.
>>>
>>> g.
>>>
>>
>> Reserving memory at physical address 0 has been semi-common on our boards
>> for many issues. Sometimes it's been for temporary debugging purposes
>> to catch an unknown driver corrupting physical address 0. Sometimes it has
>> been a permanent fix to a hardware limitation.
>>
>> Thanks,
>> Laura
>>
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>> hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
