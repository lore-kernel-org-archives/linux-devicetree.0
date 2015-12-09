From: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: Generic DT binding for IPIs
Date: Wed, 9 Dec 2015 15:27:51 +0000
Message-ID: <56684877.3020708@imgtec.com>
References: <561E2BE6.2090807@imgtec.com> <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151022115551.GI3953-fahSIxCzskDQ+YiMSub0/l6hYfS7NtTn@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lisa Parratt <Lisa.Parratt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/22/2015 12:55 PM, Jason Cooper wrote:
> On Thu, Oct 22, 2015 at 11:44:16AM +0100, Qais Yousef wrote:
>> Is there anything more I can do to get more attention about this? I
>> think Marc's suggestion is more generic and future proof, if I send
>> RFC patches for that would this be better?
> Please do.

Unfortunately I haven't had a chance to get around writing the patches yet.
I came up with a different description though that I thought maybe worth sharing
to see if there's any opinion about it before the actual work being done.

To summarise, the problem I am trying to solve is that we have a type of
coprocessors which share the interrupt controller with Linux, hence the IPI
mechanism this controller uses. I've been working with Thomas on implementing
a generic API to allocate IPIs for coprocesors and a way for drivers to send
these IPIs [1].

To complement this new API, we need a mechanism to describe this in
device tree so a driver that wants to allocate an IPI can have this done
automatically for it like we handle interrupts.

What I have in mind is:

      coproc {
              ipi-parent = <&gic>;

              ipis = <CPU_VALUE IPI_SPEC>;
              ipi-names = "in";
      };

This will allocate an IPI to go to cpu @CPU_VALUE passing @IPI_SPEC as
parameters to the controller. Which means we need a new ipi-cells to
define how many cells are in ipis property. Note the new ipi-parent too.

I think this is better than interrupt-sink and interrupt-source [2] as we
give the driver the flexibility to give a meaning to what this IPI is.
One thing I found confusing about interrupt-source and interrupt-sink is
from what perspective are we viewing that, host system or firmware..

ipis property also is similar to interrupts, so using it would be easier
(I think).

If we have 2 coprocessors that want to communicate using IPIs that are
managed by the host we use ipi-refs property to refer to IPIs defined in
another node.

      coproc1 {
              ipis = <CPU1>, <CPU2>, <CPU2>;
              ipi-names = "in", "coproc2data", "coproc2ctrl";
      };

      coproc2 {
              ipi-refs = <&coproc1 "in">, <&coproc1 "coproc2data">, <&coproc1 "corpoc2ctrl">;
              ipi-refs-names = "tocorproc1", "indata", "inctrl";
      };

This will cause 3 IPIs to be allocated. One is going to CPU1 and two are
going to CPU2. ipi-names should be similar to how interrupt-names work.

A node can possibly both allocate IPIs and reference other allocated ones.

Thoughts?

Thanks,
Qais

[1]https://lkml.org/lkml/2015/12/8/243
[2]https://lkml.org/lkml/2015/10/14/211


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
