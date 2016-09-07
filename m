From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
Date: Wed, 7 Sep 2016 14:52:15 +0300
Message-ID: <4eb0a339-e861-c2a9-dd94-94f6577ec25a@linaro.org>
References: <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160823173259.GA13327@rob-hp-laptop>
 <fbf25a9e-348b-9047-37ef-1b96808dea31@mm-sol.com>
 <20160825000521.GH15161@tuxbot>
 <3429173a-d55a-51e1-0973-7e5bd31be297@linaro.org>
 <20160826222345.GK15161@tuxbot>
 <5afd7f2f-ec1b-d2ce-b833-81df010e24de@linaro.org>
 <20160830171742.GN15161@tuxbot>
 <b7314a89-2215-4961-6e8a-be5ef536624a@linaro.org>
 <e312d810-3096-d32c-d546-c07e0265808e@samsung.com>
 <20160902201255.GZ15161@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160902201255.GZ15161@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 09/02/2016 11:12 PM, Bjorn Andersson wrote:
> On Fri 02 Sep 04:52 PDT 2016, Marek Szyprowski wrote:
> 
>> Hi,
>>
>>
>> On 2016-09-01 16:58, Stanimir Varbanov wrote:
>>> Hi,
>>>
>>> Cc: Marek
>>>
>>
>> ...
>>
>>>>>> But I presume we have the implementation issue of dma_alloc_coherent()
>>>>>> failing in either case with the 5MB size. I think we need to look into
>>>>> I'd be good to include Marek Szyprowski? At least he will know what
>>>>> design restrictions there are.
>>>>>
>>>> Please do. The more I look at this the more I think we must use the
>>>> existing infrastructure for allocating "dma memory". Getting
>>>> dma_alloc_coherent() supporting non-power-of-2 memory regions would
>>> Just to be precise it should be dma_alloc_from_coherent().
>>>
>>> Marek, what is your opinion on that, can we make dma_alloc_from_coherent
>>> able to allocate memory for sizes with bigger granularity.
>>>
>>> For your convenience here [1] is the mail thread.
>>
>> There should be no technical restrictions to add support for bigger
>> granularity than power-of-2. dma_alloc_from_coherent uses standard
>> bitmap based allocator, so it already support tracking allocations of
>> arbitrary size.
> 
> I believe we should be able to change the parameter of
> bitmap_{find_free,release,allocate}_region() to take a size rather than
> an order.
> 
> The mask used in __reg_op() is an unsigned long, that is stamped over
> the region to be masked or cleared, so there are some clear restrictions
> in what parameters we can pass there - without having to break this
> operation up in steps.
> 
> But if drive the offset by taking the next power-of-two of the size and
> then align the number of bits to min(count, BITS_PER_LONG) we should
> retain the performance characteristics and requirements of __reg_op().
> 
>> However for the small allocations (smaller than 64KiB?, 512KiB?) it
>> would make sense to keep nearest-power-of-2 round up to prevent memory
>> fragmentation.
> 
> But in our case each bit matches a single page, so by making sure the
> mask always fills the unsigned long in the larger cases we would end up
> with having to align things to 128kb (or 256kb if unsigned long is 64
> bit).
> 
> 
> Does this sound reasonable?

I haven't looked in bitmap details, but can't we reuse genalloc?

-- 
regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
