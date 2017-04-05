From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] of/fdt: introduce of_scan_flat_dt_subnodes and of_get_flat_dt_phandle
Date: Wed, 5 Apr 2017 10:58:23 -0500
Message-ID: <CAL_JsqLEvjb8S-+-JEa4ALHeCWHiR1A_4ur9kd3pBRJaFYWVKw@mail.gmail.com>
References: <20170405123706.6081-1-npiggin@gmail.com> <20170405123706.6081-3-npiggin@gmail.com>
 <CAL_JsqK4zbACwWVb-rsrvBb4hjBCexrqKRKrzSiZrZH5w=bKqQ@mail.gmail.com> <20170406003251.533e2845@roar.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170406003251.533e2845-a5aMA/AkCkgK5Ils6ZIQy0EOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 5, 2017 at 9:32 AM, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, 5 Apr 2017 08:35:06 -0500
> Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> On Wed, Apr 5, 2017 at 7:37 AM, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Introduce primitives for FDT parsing. These will be used for powerpc
>> > cpufeatures node scanning, which has quite complex structure but should
>> > be processed early.
>>
>> Have you looked at unflattening the FDT earlier?
>
> Hi, thanks for taking a look. Did you mean to trim the cc list?

Ugg, no. I've added everyone back.

> It may be possible but I'd like to avoid it if we can. There might
> turn out to be some errata or feature that requires early setup. And
> the current cpu feature parsing code does it with flat dt.

Well, I'd like to avoid expanding usage of flat DT parsing in the
kernel. But you could just put this function into arch/powerpc and I'd
never see it, but I like that even less. Mainly, I just wanted to
raise the point.

Your argument works until you need that setup in assembly code, then
you are in the situation that you need to either handle the setup in
bootloader/firmware or have an simple way to determine that condition.

Rob

>
>> > Signed-off-by: Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  drivers/of/fdt.c       | 39 +++++++++++++++++++++++++++++++++++++++
>> >  include/linux/of_fdt.h |  6 ++++++
>> >  2 files changed, 45 insertions(+)
>> >
>> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> > index e5ce4b59e162..a45854fe5156 100644
>> > --- a/drivers/of/fdt.c
>> > +++ b/drivers/of/fdt.c
>> > @@ -754,6 +754,37 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
>> >  }
>> >
>> >  /**
>> > + * of_scan_flat_dt_subnodes - scan sub-nodes of a node call callback on each.
>> > + * @it: callback function
>> > + * @data: context data pointer
>> > + *
>> > + * This function is used to scan sub-nodes of a node.
>> > + */
>> > +int __init of_scan_flat_dt_subnodes(unsigned long node,
>> > +                                   int (*it)(unsigned long node,
>> > +                                             const char *uname,
>> > +                                             void *data),
>> > +                                   void *data)
>> > +{
>> > +       const void *blob = initial_boot_params;
>> > +       const char *pathp;
>> > +       int offset, rc = 0;
>> > +
>> > +       offset = node;
>> > +        for (offset = fdt_first_subnode(blob, offset);
>> > +             offset >= 0 && !rc;
>> > +             offset = fdt_next_subnode(blob, offset)) {
>>
>> fdt_for_each_subnode()
>
> Got it.
>
>>
>> > +
>> > +               pathp = fdt_get_name(blob, offset, NULL);
>> > +               if (*pathp == '/')
>> > +                       pathp = kbasename(pathp);
>>
>> Seems a bit odd that you parse the name in this function. Perhaps the
>> caller should do that, or if you want subnodes matching a certain
>> name, then do the matching here. But you didn't copy me on the rest of
>> the series, so I don't know how you are using this.
>
> Hmm, it was a while since writing that part. I guess I just copied
> of_scan_flat_dt interface.
>
> Caller is in this patch:
>
> https://patchwork.ozlabs.org/patch/747262/
>
> I'll include you in subsequent post if you prefer.
>
> Thanks,
> Nick
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
