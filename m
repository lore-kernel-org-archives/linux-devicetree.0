From: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: Generic DT binding for IPIs
Date: Fri, 11 Dec 2015 10:47:57 +0000
Message-ID: <566AA9DD.6040404@imgtec.com>
References: <561E2BE6.2090807@imgtec.com> <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net> <56684877.3020708@imgtec.com>
 <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
 <56695201.2070807@imgtec.com> <20151211003902.GE20139@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151211003902.GE20139-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lisa Parratt <Lisa.Parratt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/11/2015 12:39 AM, David Gibson wrote:
> On Thu, Dec 10, 2015 at 10:20:49AM +0000, Qais Yousef wrote:
>>
>> The IPIs have two properties that are different from a regular interrupts:
>>
>>      1. An IPI is not only received, it could also be sent.
> Any interrupt is sent by the device, received by an interrupt
> controller, so this isn't really anything fundamentally different.

No they're not fundamentally different. It's just the way they're 
created and used.

>>      2. The IPI is dynamic. There's an actual allocation from a pool of
>> available
>>          IPIs happening when we ask for one to be reserved.
> It's not really clear to me what that means, and why it requires any
> particular different information in the device tree.

Maybe it would help to look at the new IPI reservation API?

     https://lkml.org/lkml/2015/12/8/249

>> The difference might be borderline..
>>
>> Do you have any rough idea on what a possible extension could look like?
>> Reusing means writing less code, which is always better of course :)
>>
>> By the way, on MIPS GIC, we can use interrupts property to describe an IPI
>> the host system will receive. But to send one to the coprocessor, we need to
>> define an outgoing IPI.
> Ah, ok, so is what you're trying to describe here (from the host OS
> and CPU point of view) a purely outgoing signal to the coproc?

Yes.

>> In this case, the firmware will be hardcoded to send an interrupt to a
>> specific hwirq, so one can then describe it in DT as a regular interrupt to
>> the host system. Hardcoding is not ideal and less portable though.
> Or is the signal that goes to the coproc then somehow being translated
> into a host interrupt?  If that's so you should be able to represent
> the coproc as an interrupt controller or interrupt nexus.
>

I'm not sure I understood you completely but no, there's no translation 
happening. When the IPI is allocated it would be routed
to the coproc. When the host wants to send a signal, it'll use the 
allocated hwirq value (indirectly via the virq) to write to a register, 
which will cause an interrupt to be generated at the coproc.


>>>>       };
>>>>
>>>>       coproc2 {
>>>>               ipi-refs = <&coproc1 "in">, <&coproc1 "coproc2data">, <&coproc1
>>>> "corpoc2ctrl">;
>>> This isn't actually parseable. You need a known length of cells after a phandle.
>>>
>> To clarify, what you're saying we can't pass strings, right?
> So, I'm not entirely sure what point Rob was making.  The above
> certainly isn't valid dts syntax - strings can't appear within
> the < > construct.  But if you make the obvious fix to:
>      ipi-refs = <&coproc1>, "in", <&coproc1>, "coproc2data";
>
> then it's certainly a parseable property format.  It's kind of clunky
> mixing integers and strings that way, but it's possible and there are
> existing bindings using properties in a similar format.
>

Ah OK thanks! I think this form would be handy to get the refs even if 
we end up reusing the interrupts property to allocate an IPI.

So if reusing the interrupts property is the right thing to do, do you 
(or anyone else) have a rough idea how this should look like?

Thanks,
Qais
