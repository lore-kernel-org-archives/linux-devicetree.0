From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC v4 1/2] reset: Add support for dedicated reset controls
Date: Thu, 20 Sep 2018 11:37:52 +0200
Message-ID: <CAMuHMdUaXjvOOAYTxTJ+ZzJn359CFYHsGKYoKf4ZkU_Goyen6g@mail.gmail.com>
References: <20180917163955.19023-1-geert+renesas@glider.be>
 <20180917163955.19023-2-geert+renesas@glider.be> <1537369098.6816.6.camel@pengutronix.de>
 <CAMuHMdWSO6JcBRmmpwCPz0u-85ZC3ffZkNbdd8DjokJT2opAtw@mail.gmail.com> <1537435641.4156.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537435641.4156.1.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Auger Eric <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, KVM list <kvm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Philip,

On Thu, Sep 20, 2018 at 11:27 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Wed, 2018-09-19 at 17:24 +0200, Geert Uytterhoeven wrote:
> > On Wed, Sep 19, 2018 at 4:58 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> [...]
> > > I consider requesting exclusive access to a shared reset line a misuse
> > > of the API. Are there such cases? Can they be fixed?
> >
> > I guess there are plenty.
>
> I did a cursory search for drivers that request exclusive reset controls
> for resets that have multiple phandle references in the corresponding
> DT. So far I have found none.

OK.

> > Whether a line is shared or dedicated depends on SoC integration.
> >
> > The issue is that a driver requesting exclusive access has no way to know
> > if the reset line is dedicated to its device or not. If no other
> > driver requested the reset control (most drivers don't use reset
> > controls), it will succeed.
>
> True. It would be great to have a way to make sure an exclusive request
> for a shared reset line never succeeds.
>
> > > > Sometimes a driver needs to reset a specific hardware block, and be 100%
> > > > sure it has no impact on other hardware blocks.  This is e.g. the case
> > > > for virtualization with device pass-through, where the host wants to
> > > > reset any exported device before and after exporting it for use by the
> > > > guest, for isolation.
> > > >
> > > > Hence a new flag for dedicated resets is added to the internal methods,
> > > > with a new public reset_control_get_dedicated() method, to obtain an
> > > > exclusive handle to a reset that is dedicated to one specific hardware
> > > > block.
> > >
> > > I'm not sure a new flag is necessary, this is what exclusive resets
> > > should be.
> >
> > So perhaps the check should be done for the existing exclusive resets
> > instead, without adding a new flag?
>
> That would be my preference, if possible.

OK, will make it so.

> > > Also I fear there will be confusion about the difference between
> > > exclusive (refering to the reset control) and dedicated (refering to
> > > the reset line) reset controls.
> >
> > Indeed, exclusive has multiple meanings here:
> >   1. Exclusive vs. shared access to the reset control,
> >   2. Reset line is dedicated to a single device, or shared with multiple
> >      devices.
>
> 2. is the more important factor, and that's what I have in mind when
> talking about exclusive vs. shared resets. Admittedly, the kernel doc
> comments only mention 1.

OK. That did contribute to my confustion...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
