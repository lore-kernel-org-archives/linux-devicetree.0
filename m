From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Add bindings for basic reset controller
Date: Mon, 3 Jul 2017 16:21:29 +0930
Message-ID: <CACPK8Xd86gAtR5sLb1LAy49Rc-dw4mAnZtk9_vwYvBe+Qefa1Q@mail.gmail.com>
References: <20170530060851.29923-1-joel@jms.id.au> <20170530060851.29923-2-joel@jms.id.au>
 <20170607204916.n3wh3fkwbfctdv6s@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607204916.n3wh3fkwbfctdv6s@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 8, 2017 at 6:19 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, May 30, 2017 at 03:38:50PM +0930, Joel Stanley wrote:
>> This adds the bindings documentation for a basic single-register reset
>> controller.
>>
>> The bindings describe a single 32-bit register that contains up to 32
>> reset lines, each deasserted by clearing the appropriate bit in the
>> register. Optionally a property can be provided that changes this
>> behaviour to assert on clear.
>>
>
> I think this is a good idea for kernel code, but not for bindings. We
> don't really want per register bindings.
>
> The problem with any generic/simple/basic binding is they always start
> that way. Then we add one property at a time not in any well planned
> way. I can easily come up with additions. For example, what about
> self-clearing reset bits. Or 2 bits per reset. Or multiple resets that
> have to be controlled together. 8 or 16-bit registers.

Thanks for the explanation. I will send a v3 with aspeed specific bindings.

How should I handle the driver? Were you suggesting I keep it generic,
but with my aspeed compatible?

Cheers,

Joel

>
> IRQs and GPIOs could also be described in some cases with just groups of
> 32-bit registers for set,clear,status,mask,etc., but we don't do that in
> bindings for the same reasons.
>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
