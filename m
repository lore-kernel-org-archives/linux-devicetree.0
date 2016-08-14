From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] powerpc: populate the default bus with machine_arch_initcall
Date: Sun, 14 Aug 2016 17:42:43 -0500
Message-ID: <CAL_Jsq+JLvThaz3ZTy80yVW23waPjqfw_JC-EJF-QuCk21=eJQ@mail.gmail.com>
References: <1470913781-9204-1-git-send-email-haokexin@gmail.com>
 <87k2fmtxbv.fsf@concordia.ellerman.id.au> <20160812054934.GJ17275@pek-khao-d1>
 <CAL_Jsq+_K-uU7bFkSm-tq-Q0DPhQt4j=f84OzQSCJFEC29O-8A@mail.gmail.com> <1471209670.12231.60.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471209670.12231.60.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 14, 2016 at 4:21 PM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Fri, 2016-08-12 at 14:30 -0500, Rob Herring wrote:
>>
>> > With the commit 44a7185c2ae6 ("of/platform: Add common method to
>> > populate default bus"), a default function is introduced to
>> > populate
>> > the default bus and this function is invoked at the
>> > arch_initcall_sync
>> > level. But a lot of ppc boards use machine_device_initcall() to
>> > populate the default bus. This means that the default populate
>> > function
>> > has higher priority and would override the arch specific population
>> > of
>> > the bus. The side effect is that some arch specific bus are not
>> > probed,
>> > then cause various malfunction due to the miss of some devices.
>> > Since
>> > it is very possible to introduce bugs if we simply change the
>> > initcall
>> > level for all these boards(about 30+). This just disable this
>> > default
>> > function for all the ppc boards.
>> >
>> > Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  drivers/of/platform.c | 2 ++
>> >  1 file changed, 2 insertions(+)
>>
>> I've applied this one.
>
> Not fan of the hard #ifdef at all... it will make it hard to convert
> platforms one by one. Why not an arch_want_default_of_probe() or
> something like this which we can then plumb into ppc_md. ?

Yeah, I'm not either really. I didn't propose using IS_ENABLED here
either as it does add a needless initcall.

Do you have any idea which platforms are not broken and could be
switched over now. If not, I think we should just leave as is for 4.8
and make it per platform selectable for 4.9.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
