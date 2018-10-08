From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] reset: Exclusive resets must be dedicated to a single
 hardware block
Date: Mon, 8 Oct 2018 11:59:42 +0200
Message-ID: <CAMuHMdXFbYkD_Lou0wW__0-8ZPj3cKuJ6it_0hpPwzNU0Zeq3g@mail.gmail.com>
References: <20180927180038.24599-1-geert+renesas@glider.be>
 <1538648094.14153.8.camel@pengutronix.de> <CAMuHMdV_qb8qDFJ1VT6FYYkHK73tjbp2hOUShaOEhezPWg+VDg@mail.gmail.com>
 <CAMuHMdUC3dGRnMCsX3HjmGgb0-vLSNXKXRiiAS+TzW72_uM+LQ@mail.gmail.com> <1538752564.3545.37.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538752564.3545.37.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Auger Eric <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Fri, Oct 5, 2018 at 5:16 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Fri, 2018-10-05 at 14:31 +0200, Geert Uytterhoeven wrote:
> [...]
> > > > > +                     eq = (args2.np == args.np &&
> > > > > +                           args2.args_count == args.args_count &&
> > > > > +                           !memcmp(args2.args, args.args,
> > > > > +                                   args.args_count * sizeof(args.args[0])));
> > >
> > > As there's at least one other function in -next that compares of_phandle_args,
> > > I will add a helper of_phandle_args_eq().
> > >
> > > > > +                     of_node_put(args2.np);
> > > > > +                     if (eq)
> > > >
> > > > Emitting a loud warning here could be very helpful if it contains
> > > > both the reset controller node and the reset index, as well as the
> >
> > Actually on DT-based systems, the index is a driver-specific
> > implementation detail, and may differ from the actual reset specifier in DT.
> > E.g. on R-Car systems, DT uses a human-readable representation matching
> > the datasheet, while internally, the driver uses a packed representation.
> > Hence printing the index may confuse the user.
> >
> > For lookup-based systems, this is different.
>
> Correct. I'm so used to #reset-cells = <1>, it's hard to remember the
> exceptions. So let's not try to print indices or args.
>
> > > > consumer nodes: node and node2.
> > >
> > > Indeed, will do, also for lookup resets.
> > >
> > > We already have of_print_phandle_args(), but that is a bit inflexible.
> > > Adding support for "%pOFa" looks like the modern thing to do.
> >
> > Scrap that: of_phandle_args is not derived from a device_node, so %pOFa
> > is not appropriate (and would crash instead of fall back to a pointer before
> > %pOFa support is implemented). And without more users, it doesn't make much
> > sense to go for a new type (e.g. "%pOA")...
> >
> > Actually, printing the full reset specifier is not needed. A message like
> >
> >     /soc/pwm@e6e31000 and /soc/pwm@e6e30000 share a reset on
> > /soc/clock-controller@e6150000
> >
> > should give sufficient clue to the user.
>
> Yes. You could also pass con_id into __of_reset_is_exclusive and print
> that. It would be nice to indicate which consumer requested exclusive
> access.

con_id is used for lookup-based resets only?

But the value passed there is the "id" parameter of
reset_control_get_exclusive().  However, that is not the consumer name,
and usually NULL.

I'm afraid the only way to know the consumer is to print a backtrace with
WARN()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
