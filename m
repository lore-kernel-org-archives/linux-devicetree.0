From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] reset: Exclusive resets must be dedicated to a
 single hardware block
Date: Mon, 08 Oct 2018 14:57:17 +0200
Message-ID: <1539003437.11512.20.camel@pengutronix.de>
References: <20180927180038.24599-1-geert+renesas@glider.be>
         <1538648094.14153.8.camel@pengutronix.de>
         <CAMuHMdV_qb8qDFJ1VT6FYYkHK73tjbp2hOUShaOEhezPWg+VDg@mail.gmail.com>
         <CAMuHMdUC3dGRnMCsX3HjmGgb0-vLSNXKXRiiAS+TzW72_uM+LQ@mail.gmail.com>
         <1538752564.3545.37.camel@pengutronix.de>
         <CAMuHMdXFbYkD_Lou0wW__0-8ZPj3cKuJ6it_0hpPwzNU0Zeq3g@mail.gmail.com>
         <1538996273.11512.13.camel@pengutronix.de>
         <CAMuHMdV3yt7S9sKgEuy7vJsCqSCfm8caNSNLwLVX4H8pNxpOzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV3yt7S9sKgEuy7vJsCqSCfm8caNSNLwLVX4H8pNxpOzA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Auger Eric <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2018-10-08 at 13:47 +0200, Geert Uytterhoeven wrote:
> Hi Philipp,
> 
> On Mon, Oct 8, 2018 at 12:57 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > On Mon, 2018-10-08 at 11:59 +0200, Geert Uytterhoeven wrote:
> > > On Fri, Oct 5, 2018 at 5:16 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > > > On Fri, 2018-10-05 at 14:31 +0200, Geert Uytterhoeven wrote:
> > > > [...]
> > > > > > > > +                     eq = (args2.np == args.np &&
> > > > > > > > +                           args2.args_count == args.args_count &&
> > > > > > > > +                           !memcmp(args2.args, args.args,
> > > > > > > > +                                   args.args_count * sizeof(args.args[0])));
> > > > > > 
> > > > > > As there's at least one other function in -next that compares of_phandle_args,
> > > > > > I will add a helper of_phandle_args_eq().
> > > > > > 
> > > > > > > > +                     of_node_put(args2.np);
> > > > > > > > +                     if (eq)
> > > > > > > 
> > > > > > > Emitting a loud warning here could be very helpful if it contains
> > > > > > > both the reset controller node and the reset index, as well as the
> > > > > 
> > > > > Actually on DT-based systems, the index is a driver-specific
> > > > > implementation detail, and may differ from the actual reset specifier in DT.
> > > > > E.g. on R-Car systems, DT uses a human-readable representation matching
> > > > > the datasheet, while internally, the driver uses a packed representation.
> > > > > Hence printing the index may confuse the user.
> > > > > 
> > > > > For lookup-based systems, this is different.
> > > > 
> > > > Correct. I'm so used to #reset-cells = <1>, it's hard to remember the
> > > > exceptions. So let's not try to print indices or args.
> > > > 
> > > > > > > consumer nodes: node and node2.
> > > > > > 
> > > > > > Indeed, will do, also for lookup resets.
> > > > > > 
> > > > > > We already have of_print_phandle_args(), but that is a bit inflexible.
> > > > > > Adding support for "%pOFa" looks like the modern thing to do.
> > > > > 
> > > > > Scrap that: of_phandle_args is not derived from a device_node, so %pOFa
> > > > > is not appropriate (and would crash instead of fall back to a pointer before
> > > > > %pOFa support is implemented). And without more users, it doesn't make much
> > > > > sense to go for a new type (e.g. "%pOA")...
> > > > > 
> > > > > Actually, printing the full reset specifier is not needed. A message like
> > > > > 
> > > > >     /soc/pwm@e6e31000 and /soc/pwm@e6e30000 share a reset on
> > > > > /soc/clock-controller@e6150000
> > > > > 
> > > > > should give sufficient clue to the user.
> > > > 
> > > > Yes. You could also pass con_id into __of_reset_is_exclusive and print
> > > > that. It would be nice to indicate which consumer requested exclusive
> > > > access.
> > > 
> > > con_id is used for lookup-based resets only?
> > > 
> > > But the value passed there is the "id" parameter of
> > > reset_control_get_exclusive().
> > 
> > Sorry, I did mean the id parameter in the __of_reset_control_get case.
> 
> OK.
> 
> > > However, that is not the consumer name,
> > 
> > It is the name of the reset signal from point of view of the consumer.
> > It specifies, via its position in the reset-names property, which of
> > potentially multiple reset phandles in the resets property is the one
> > causing the conflict.
> > 
> > > and usually NULL.
> > 
> > In which case the resets property usually only contains one phandle, so
> > it is not needed to determine the conflicting reset control.
> 
> For a device-specific driver knowing about all resets, that is indeed the case.
> For the generic case (e.g. my vfio-platform use case), it just wants to reset
> the device, and thus passes NULL.

I fear in general, you can't know how to reset arbitrary hardware just
from the "resets" property.
Imagine a hypothetical device with two resets A and B that deadlocks
if reset B is deasserted too early in a time window after reset A is
deasserted.

> Perhaps I should use devm_reset_control_array_get_exclusive() instead of
> reset_control_get_exclusive(), to assert all resets?

The safe thing to do would be to let vfio-platfrom handle devices only
if they have no more than one reset.

> However, that makes the detection of shared resets more tricky, as it needs
> to consider all combinations. Currently e.g.
>     resets = <&rst1> <&rst2>;
> and
>     resets = <&rst2> <&rst1>;
> is not detected as reset sharing...
> 
> As device_reset() also uses the first reset only, I'll keep it that way...

Yes, device_reset() has the same issue.

regards
Philipp
