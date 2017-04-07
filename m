From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH 2/3] of/fdt: introduce of_scan_flat_dt_subnodes and of_get_flat_dt_phandle
Date: Fri, 07 Apr 2017 16:40:54 +1000
Message-ID: <87tw60hg95.fsf@concordia.ellerman.id.au>
References: <20170405123706.6081-1-npiggin@gmail.com> <20170405123706.6081-3-npiggin@gmail.com> <CAL_JsqK4zbACwWVb-rsrvBb4hjBCexrqKRKrzSiZrZH5w=bKqQ@mail.gmail.com> <20170406003251.533e2845@roar.ozlabs.ibm.com> <CAL_JsqLEvjb8S-+-JEa4ALHeCWHiR1A_4ur9kd3pBRJaFYWVKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLEvjb8S-+-JEa4ALHeCWHiR1A_4ur9kd3pBRJaFYWVKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Wed, Apr 5, 2017 at 9:32 AM, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, 5 Apr 2017 08:35:06 -0500
>> Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>>> On Wed, Apr 5, 2017 at 7:37 AM, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> > Introduce primitives for FDT parsing. These will be used for powerpc
>>> > cpufeatures node scanning, which has quite complex structure but should
>>> > be processed early.
>>>
>>> Have you looked at unflattening the FDT earlier?
>>
>> Hi, thanks for taking a look. Did you mean to trim the cc list?
>
> Ugg, no. I've added everyone back.
>
>> It may be possible but I'd like to avoid it if we can. There might
>> turn out to be some errata or feature that requires early setup. And
>> the current cpu feature parsing code does it with flat dt.
>
> Well, I'd like to avoid expanding usage of flat DT parsing in the
> kernel. But you could just put this function into arch/powerpc and I'd
> never see it, but I like that even less. Mainly, I just wanted to
> raise the point.
>
> Your argument works until you need that setup in assembly code, then
> you are in the situation that you need to either handle the setup in
> bootloader/firmware or have an simple way to determine that condition.

Where Nick does this FDT parsing is literally the first C code that runs
in the kernel. The MMU is off, we don't even know how much memory we
have, or where it is.

So it's basically impossible to do the unflattening earlier. What we
could do is move the CPU feature setup *later*.

As Ben & Nick said that would be a pretty intrusive change, and
definitely not something we want to do now.

What we could probably do is split some of the flat tree parsing, so
that we discover memory, even just some of it, then unflatten, and then
do more setup using the unflattened tree.

But that will require a lot of delicate work. So we'd definitely like to
do that separately from this series.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
