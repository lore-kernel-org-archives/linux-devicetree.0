From: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: Allow mem_reserve of memory with a base address of
 zero
Date: Tue, 12 Aug 2014 10:02:35 -0700
Message-ID: <53EA48AB.4030902@codeaurora.org>
References: <1407357004-31713-1-git-send-email-alcooperx@gmail.com>	<CAL_Jsq+=EZu6_Dy59sAEE0B5T_uS1vA5YQQmKAe9vj0VOHVyCQ@mail.gmail.com> <20140812164813.6B202C405D3@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140812164813.6B202C405D3-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 8/12/2014 9:48 AM, Grant Likely wrote:
> On Wed, 6 Aug 2014 17:02:44 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Aug 6, 2014 at 3:30 PM, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> __reserved_mem_reserve_reg() won't reserve memory if the base address
>>> is zero. This change removes the check for a base address of zero and
>>> allows it to be reserved.
>>>
>>> Allowing the first 4K of memory to be reserved will help solve a
>>> problem on some ARM systems where the the first 16K of memory is
>>> unused and becomes allocable memory. This will prevent this memory
>>> from being used for DMA by drivers like the USB OHCI driver which
>>> consider a physical address of zero to be illegal.
>>
>> OHCI driver or hardware? I agree with the change, but really think
>> this should be fixed in the driver in the former case or a property of
>> the OHCI node in the latter.
> 
> I'm not hard and fast on that. I don't think it is unreasonable to
> reserve the base of memory as the platform level if there is a bug
> causing DMA to fail at that address.
> 
> If this is a common problem (and not merely a few boards) then I agree.
> Fixing it this way is just asking for the same problem to show up again
> and again on new boards that haven't explicitly reserved the memory.
> 
> g.
> 

Reserving memory at physical address 0 has been semi-common on our boards
for many issues. Sometimes it's been for temporary debugging purposes
to catch an unknown driver corrupting physical address 0. Sometimes it has
been a permanent fix to a hardware limitation.

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
