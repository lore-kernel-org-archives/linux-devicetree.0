From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC v4 1/2] reset: Add support for dedicated reset controls
Date: Wed, 19 Sep 2018 17:24:25 +0200
Message-ID: <CAMuHMdWSO6JcBRmmpwCPz0u-85ZC3ffZkNbdd8DjokJT2opAtw@mail.gmail.com>
References: <20180917163955.19023-1-geert+renesas@glider.be>
 <20180917163955.19023-2-geert+renesas@glider.be> <1537369098.6816.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537369098.6816.6.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Auger Eric <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

CC Mark & Rob (DT)

On Wed, Sep 19, 2018 at 4:58 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mon, 2018-09-17 at 18:39 +0200, Geert Uytterhoeven wrote:
> > In some SoCs multiple hardware blocks may share a reset control.
> > The existing reset control API for shared resets will only assert such a
> > reset when the drivers for all hardware blocks agree.
> > The existing exclusive reset control API still allows to assert such a
> > reset, but that impacts all other hardware blocks sharing the reset.
>
> I consider requesting exclusive access to a shared reset line a misuse
> of the API. Are there such cases? Can they be fixed?

I guess there are plenty.  Whether a line is shared or dedicated depends
on SoC integration.

The issue is that a driver requesting exclusive access has no way to know
if the reset line is dedicated to its device or not.  If no other
driver requested
the reset control (most drivers don't use reset controls), it will succeed.

> > Sometimes a driver needs to reset a specific hardware block, and be 100%
> > sure it has no impact on other hardware blocks.  This is e.g. the case
> > for virtualization with device pass-through, where the host wants to
> > reset any exported device before and after exporting it for use by the
> > guest, for isolation.
> >
> > Hence a new flag for dedicated resets is added to the internal methods,
> > with a new public reset_control_get_dedicated() method, to obtain an
> > exclusive handle to a reset that is dedicated to one specific hardware
> > block.
>
> I'm not sure a new flag is necessary, this is what exclusive resets
> should be.

So perhaps the check should be done for the existing exclusive resets
instead, without adding a new flag?

> Also I fear there will be confusion about the difference between
> exclusive (refering to the reset control) and dedicated (refering to
> the reset line) reset controls.

Indeed, exclusive has multiple meanings here:
  1. Exclusive vs. shared access to the reset control,
  2. Reset line is dedicated to a single device, or shared with multiple
     devices.

If we can simplify (exclusive == dedicated, 1.shared == 2.shared), life
can become simpler.

> >   - I think __device_reset() should call __reset_control_get() with
> >     dedicated=true.  However, that will impact existing users,
>
> Which ones? And how?

I didn't actually check which drivers.
If a reset is not dedicated, device_reset{,_optional}() will suddenly
start to fail if
a reset turns out to be not dedicated.
Well, currently the device will be reset multiple times, so people would
already have noticed...

> >   - Should a different error than -EINVAL be returned on failure?
> > ---
> >  drivers/reset/core.c  | 76 ++++++++++++++++++++++++++++++++++++++-----
> >  include/linux/reset.h | 60 ++++++++++++++++++++++------------
> >  2 files changed, 107 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 225e34c56b94a2e3..5bc4eeca70c0fcc2 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -459,9 +459,38 @@ static void __reset_control_put_internal(struct reset_control *rstc)
> >       kref_put(&rstc->refcnt, __reset_control_release);
> >  }
> >
> > +static bool __of_reset_is_dedicated(const struct device_node *node,
> > +                                 const struct of_phandle_args args)
> > +{
> > +     struct of_phandle_args args2;
> > +     struct device_node *node2;
> > +     int index, ret;
> > +
> > +     for_each_node_with_property(node2, "resets") {
> > +             if (node == node2)
> > +                     continue;
> > +
> > +             for (index = 0; ; index++) {
> > +                     ret = of_parse_phandle_with_args(node2, "resets",
> > +                                                      "#reset-cells", index,
> > +                                                      &args2);
> > +                     if (ret)
> > +                             break;
> > +
> > +                     if (args2.np == args.np &&
> > +                         args2.args_count == args.args_count &&
> > +                         !memcmp(args2.args, args.args,
> > +                                 args.args_count * sizeof(args.args[0])))
> > +                             return false;
> > +             }
> > +     }
> > +
> > +     return true;
> > +}
>
> I want to hear the device tree maintainers' opinion about this.
> I'd very much like to have such a check for exclusive resets, but my
> understanding is that we are not allowed to make the assumption that
> other nodes' "reset" properties follow the common reset signal device
> tree bindings.
>
> Maybe this is something that should be checked in a device tree
> validation step?

We already have SoCs where reset lines are shared among multiple on-chip
devices. So dtc validation won't work, and a runtime check is needed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
