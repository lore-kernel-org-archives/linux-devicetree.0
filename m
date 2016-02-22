From: vinayak menon <vinayakm.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: alloc anywhere from memblock if range not specified
Date: Mon, 22 Feb 2016 19:18:17 +0530
Message-ID: <CAOaiJ-mFxLt7G=mrJfk5mScbP8BYv4ATyEpU6SDnE4gDFUM-+w@mail.gmail.com>
References: <1454337867-5111-1-git-send-email-vinmenon@codeaurora.org>
	<56C6D21A.2050100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C6D21A.2050100-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Vinayak Menon <vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 19, 2016 at 1:58 PM, Marek Szyprowski
<m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hello,
>
> On 2016-02-01 15:44, Vinayak Menon wrote:
>>
>> early_init_dt_alloc_reserved_memory_arch passes end as 0 to
>> __memblock_alloc_base, when limits are not specified. But
>> __memblock_alloc_base takes end value of 0 as MEMBLOCK_ALLOC_ACCESSIBLE
>> and limits the end to memblock.current_limit. This results in regions
>> never being placed in HIGHMEM area, for e.g. CMA.
>> Let __memblock_alloc_base allocate from anywhere in memory if limits are
>> not specified.
>>
>> Signed-off-by: Vinayak Menon <vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>
>
> Acked-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> You may need to resend it lkml to let someone to pick it for merging.
> devicetree ml is mainly for discussing the bindings.
>

Thanks. I will resend it to lkml.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
