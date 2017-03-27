From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] of: add stub for of_n_addr_cells
Date: Mon, 27 Mar 2017 09:31:09 +0200
Message-ID: <CAK8P3a1C=ffeg7CgmpgZauYiaUYL1vQNa=5yA7_Eefkc-bKLVQ@mail.gmail.com>
References: <20170324103940.30902-1-tobias.regnery@gmail.com>
 <CAK8P3a3ojRSpC3GVU6P05GEtj7AHxrYD_ZrAZaa68KT14H9Hew@mail.gmail.com> <20170327055454.c6kj4keeudqn4bps@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170327055454.c6kj4keeudqn4bps@builder>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Regnery <tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 7:54 AM, Tobias Regnery
<tobias.regnery-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 24.03.17, Arnd Bergmann wrote:

>> >
>> > +static inline int of_n_addr_cells(struct device_node *np)
>> > +{
>> > +       return 0;
>> > +}
>> > +
>>
>> This looks good, but we should also do the same thing for of_n_size_cells().
>>
>> I think I sent something like this a few years ago, but never resubmitted it
>> when it was ignored at first.
>>
>>         Arnd
>
> This seems sensible, I can send an updated patch with this change or I can
> send it as a separate patch, whatever the maintainers prefer.

I'd recommend sending an updated patch.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
