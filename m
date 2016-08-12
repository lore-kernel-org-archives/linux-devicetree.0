From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] powerpc: populate the default bus with machine_arch_initcall
Date: Fri, 12 Aug 2016 14:30:04 -0500
Message-ID: <CAL_Jsq+_K-uU7bFkSm-tq-Q0DPhQt4j=f84OzQSCJFEC29O-8A@mail.gmail.com>
References: <1470913781-9204-1-git-send-email-haokexin@gmail.com>
 <87k2fmtxbv.fsf@concordia.ellerman.id.au> <20160812054934.GJ17275@pek-khao-d1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160812054934.GJ17275@pek-khao-d1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 12, 2016 at 12:49 AM, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Aug 12, 2016 at 02:39:32PM +1000, Michael Ellerman wrote:
>> Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

[...]

>> Every one of those initcall changes could be introducing a bug, by
>> changing the order vs other init calls.
>>
>> Can we just go back to the old behaviour on ppc?
>
> Sure. How about this one?
>
> From 4362b4cdd8a6198df4cc46c628473f0d44e03fa8 Mon Sep 17 00:00:00 2001
> From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Fri, 12 Aug 2016 13:30:03 +0800
> Subject: [PATCH v2] of/platform: disable the
>  of_platform_default_populate_init() for all the ppc boards
>
> With the commit 44a7185c2ae6 ("of/platform: Add common method to
> populate default bus"), a default function is introduced to populate
> the default bus and this function is invoked at the arch_initcall_sync
> level. But a lot of ppc boards use machine_device_initcall() to
> populate the default bus. This means that the default populate function
> has higher priority and would override the arch specific population of
> the bus. The side effect is that some arch specific bus are not probed,
> then cause various malfunction due to the miss of some devices. Since
> it is very possible to introduce bugs if we simply change the initcall
> level for all these boards(about 30+). This just disable this default
> function for all the ppc boards.
>
> Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/platform.c | 2 ++
>  1 file changed, 2 insertions(+)

I've applied this one.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
