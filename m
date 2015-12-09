From: Rob Herring <robh+dt@kernel.org>
Subject: Re: Generic DT binding for IPIs
Date: Wed, 9 Dec 2015 10:50:35 -0600
Message-ID: <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
References: <561E2BE6.2090807@imgtec.com> <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net> <56684877.3020708@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56684877.3020708@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qais Yousef <qais.yousef@imgtec.com>
Cc: "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lisa Parratt <Lisa.Parratt@imgtec.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 9, 2015 at 9:27 AM, Qais Yousef <qais.yousef@imgtec.com> wrote:
> Hi,
>
> On 10/22/2015 12:55 PM, Jason Cooper wrote:
>>
>> On Thu, Oct 22, 2015 at 11:44:16AM +0100, Qais Yousef wrote:
>>>
>>> Is there anything more I can do to get more attention about this? I
>>> think Marc's suggestion is more generic and future proof, if I send
>>> RFC patches for that would this be better?
>>
>> Please do.
>
>
> Unfortunately I haven't had a chance to get around writing the patches yet.
> I came up with a different description though that I thought maybe worth
> sharing
> to see if there's any opinion about it before the actual work being done.

I've not given this too much thought, but here's my initial thoughts.

>
> To summarise, the problem I am trying to solve is that we have a type of
> coprocessors which share the interrupt controller with Linux, hence the IPI
> mechanism this controller uses. I've been working with Thomas on
> implementing
> a generic API to allocate IPIs for coprocesors and a way for drivers to send
> these IPIs [1].
>
> To complement this new API, we need a mechanism to describe this in
> device tree so a driver that wants to allocate an IPI can have this done
> automatically for it like we handle interrupts.
>
> What I have in mind is:
>
>      coproc {
>              ipi-parent = <&gic>;
>
>              ipis = <CPU_VALUE IPI_SPEC>;
>              ipi-names = "in";
>      };
>
> This will allocate an IPI to go to cpu @CPU_VALUE passing @IPI_SPEC as
> parameters to the controller. Which means we need a new ipi-cells to
> define how many cells are in ipis property. Note the new ipi-parent too.

These are still interrupts, so I'd prefer to use or extend the
interrupt binding if possible.

> I think this is better than interrupt-sink and interrupt-source [2] as we
> give the driver the flexibility to give a meaning to what this IPI is.
> One thing I found confusing about interrupt-source and interrupt-sink is
> from what perspective are we viewing that, host system or firmware..

DT is usually from host perspective. But I agree, the naming was still
confusing to me.

> ipis property also is similar to interrupts, so using it would be easier
> (I think).
>
> If we have 2 coprocessors that want to communicate using IPIs that are
> managed by the host we use ipi-refs property to refer to IPIs defined in
> another node.
>
>      coproc1 {
>              ipis = <CPU1>, <CPU2>, <CPU2>;

Don't you need to specify a certain IPI number in addition to which
cpu is the target?

I'm thinking the cpu target could be part of the interrupts property
flags field or something.

>              ipi-names = "in", "coproc2data", "coproc2ctrl";

-names should be optional in general. So define something that works
without them.

>      };
>
>      coproc2 {
>              ipi-refs = <&coproc1 "in">, <&coproc1 "coproc2data">, <&coproc1
> "corpoc2ctrl">;

This isn't actually parseable. You need a known length of cells after a phandle.

Rob
