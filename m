From: Andrey Zhizhikin <andrey.z-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] uio: Introduce UIO driver dt-binding documentation
Date: Fri, 8 Dec 2017 13:52:13 +0100
Message-ID: <CAHtQpK5wPpJOni9PtNB47KCCvGf=aGkBjF7RvHWoF_Duvkri7w@mail.gmail.com>
References: <1512572140-48009-1-git-send-email-andrey.z@gmail.com>
 <1512658019-30279-1-git-send-email-andrey.z@gmail.com> <1512658019-30279-3-git-send-email-andrey.z@gmail.com>
 <20171207234230.k62qpsgabqueewwd@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207234230.k62qpsgabqueewwd@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

Thanks for your reply here!

>
> No. See prior discussions:
>
> https://lkml.org/lkml/2016/5/18/457
> https://lkml.org/lkml/2017/10/8/238

Just for my clarify; to understand how to move on with the patch:
Since UIO is not considered as a real HW and rather a aggregate, which
could be used for to wrap virtually any HW block - does that mean no
new dt-bindings would be accepted to it?

I agree it is really hard (and practically impossible) to create
compatible strings for all HW units potentially using UIO as a
container, therefore I can see clearly arguments here.

But if considered from a driver perspective: there is already DT
awareness in the UIO driver (specifically the pdrv-genirq), and we
have a "HW-like" functionality (irq handler, iomem and ioreg regions)
which could be covered by the DT bindings. What if those "generic"
properties that covers only those pieces of the UIO driver code could
be assigned corresponding dt-bindings? I believe it is not the best
and rather contradictory approach to not have any "compatible" string,
but as long as those driver parameters are covered by DT properties,
isn't it OK to have them?

I can assume a lot of people are using UIO in exactly this way:
defining a node in their DTS, assigning "compatible" via kernel
command line and having devnode instantiated. Why can't a possibility
be provided to them to have a generic description of how they can
configure, tweak and use their UIO drivers in the correct and
efficient way? This is especially true for people that are using FPGAs
and enveloping their Soft-IPs with UIO to have a generic
status/control capabilities. I cannot imagine how this tremendous
amount of variations could be easily accommodated inside UIO
compatible names...

Or am I completely missing a point here?

-- 
Regards,
Andrey.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
