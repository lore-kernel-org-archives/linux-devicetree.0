From: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: Generic DT binding for IPIs
Date: Thu, 10 Dec 2015 10:20:49 +0000
Message-ID: <56695201.2070807@imgtec.com>
References: <561E2BE6.2090807@imgtec.com> <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net> <56684877.3020708@imgtec.com>
 <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lisa Parratt <Lisa.Parratt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/09/2015 04:50 PM, Rob Herring wrote:
> On Wed, Dec 9, 2015 at 9:27 AM, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>
>> What I have in mind is:
>>
>>       coproc {
>>               ipi-parent = <&gic>;
>>
>>               ipis = <CPU_VALUE IPI_SPEC>;
>>               ipi-names = "in";
>>       };
>>
>> This will allocate an IPI to go to cpu @CPU_VALUE passing @IPI_SPEC as
>> parameters to the controller. Which means we need a new ipi-cells to
>> define how many cells are in ipis property. Note the new ipi-parent too.
> These are still interrupts, so I'd prefer to use or extend the
> interrupt binding if possible.

The IPIs have two properties that are different from a regular interrupts:

     1. An IPI is not only received, it could also be sent.
     2. The IPI is dynamic. There's an actual allocation from a pool of 
available
         IPIs happening when we ask for one to be reserved.

The difference might be borderline..

Do you have any rough idea on what a possible extension could look like? 
Reusing means writing less code, which is always better of course :)

By the way, on MIPS GIC, we can use interrupts property to describe an 
IPI the host system will receive. But to send one to the coprocessor, we 
need to define an outgoing IPI.

In this case, the firmware will be hardcoded to send an interrupt to a 
specific hwirq, so one can then describe it in DT as a regular interrupt 
to the host system. Hardcoding is not ideal and less portable though.

>> ipis property also is similar to interrupts, so using it would be easier
>> (I think).
>>
>> If we have 2 coprocessors that want to communicate using IPIs that are
>> managed by the host we use ipi-refs property to refer to IPIs defined in
>> another node.
>>
>>       coproc1 {
>>               ipis = <CPU1>, <CPU2>, <CPU2>;
> Don't you need to specify a certain IPI number in addition to which
> cpu is the target?

No. The way IPI reserving works is we just need to specify the target 
CPU(s).

>
> I'm thinking the cpu target could be part of the interrupts property
> flags field or something.

I'll look more at this option.

>
>>               ipi-names = "in", "coproc2data", "coproc2ctrl";
> -names should be optional in general. So define something that works
> without them.

If it's not specified, then the driver can get the definition by index 
and it would have to define the order it expects the IPIs in the binding?

>>       };
>>
>>       coproc2 {
>>               ipi-refs = <&coproc1 "in">, <&coproc1 "coproc2data">, <&coproc1
>> "corpoc2ctrl">;
> This isn't actually parseable. You need a known length of cells after a phandle.
>

To clarify, what you're saying we can't pass strings, right?

Thanks for your comments!

Thanks,
Qais
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
