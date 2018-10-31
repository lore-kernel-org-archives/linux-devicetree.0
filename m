From: Rob Herring <robh@kernel.org>
Subject: Re: NXP P50XX/e5500 secondary CPUs not onlined with current mainline
 (was [PATCH 20/21] of: use for_each_of_cpu_node iterator)
Date: Wed, 31 Oct 2018 09:25:56 -0500
Message-ID: <CAL_Jsq+mZD5cgzOQoC0bd-Bi-1i=eK=Xa3hLNtZ2phR8=5dN5A@mail.gmail.com>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-21-robh@kernel.org>
 <87r2g6ffm8.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87r2g6ffm8.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, chzigotzky@xenosoft.de
List-Id: devicetree@vger.kernel.org

On Wed, Oct 31, 2018 at 7:46 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Rob,
>
> This change is breaking some powerpc machines, ...
>
> Rob Herring <robh@kernel.org> writes:
> > Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
> > has the side effect of defaulting to iterating using "cpu" node names in
> > preference to the deprecated (for FDT) device_type == "cpu".
> >
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please ack and I will take via the DT tree. This is dependent on the
> > first 2 patches.
> >
> >  drivers/of/base.c    |  2 +-
> >  drivers/of/of_numa.c | 15 ++-------------
> >  2 files changed, 3 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index 6389aeb2f48c..8285c07cab44 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -389,7 +389,7 @@ struct device_node *of_get_cpu_node(int cpu, unsigned int *thread)
> >  {
> >       struct device_node *cpun;
> >
> > -     for_each_node_by_type(cpun, "cpu") {
> > +     for_each_of_cpu_node(cpun) {
> >               if (arch_find_n_match_cpu_physical_id(cpun, cpu, thread))
> >                       return cpun;
> >       }
>
> Previously we just looked for any node with a type of "cpu", but now
> we're using for_each_of_cpu_node(), which does:
>
>         for (; next; next = next->sibling) {
>                 if (!(of_node_name_eq(next, "cpu") ||
>                       (next->type && !of_node_cmp(next->type, "cpu"))))
>                         continue;
>
>                 if (!__of_device_is_available(next))
>                         continue;
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>                 if (of_node_get(next))
>                         break;
>         }
>
>
> ie. the available check is new.
>
> On this machine the 2nd CPU is not marked as available:
>
>   root@p5020ds:/proc/device-tree/cpus/PowerPC,e5500@1# lsprop status
>   status           "disabled"
>
> This has the effect of preventing the SMP code from finding the 2nd CPU
> in order to bring it up (in smp_85xx_start_cpu()). And so only the boot
> CPU is onlined.
>
> The device tree is built from a dts:
>
>   arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi
>
> But we don't set the status in there, so presumably u-boot is changing
> the status during boot? (not a u-boot expert).

Ah, status for cpus is a bit different. For most nodes, it should be
equivalent to the node not being present, but for cpus it means
offline if disabled. Though ARM platforms have never used it in that
way.

> We could work around this in the platform code presumably, but I'm
> worried this might break other things as well. You didn't mention the
> addition of the available check in the change log so I wonder if it was
> deliberate or just seemed like a good idea?

Just seemed like a good idea...

I'll send a patch now dropping those 2 lines.

Rob
