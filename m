Return-Path: <stephen.boyd@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <stephen.boyd@linaro.org>
In-Reply-To: <20160830235523.GC1753@littlecatz>
References: <577ACE0D.9050700@gmail.com> <20160718142037.GS16769@voom.fritz.box>
 <CAL_JsqLkMA1VHfHpP4oCWtONWq5GeyS731r8PjjeL_DZ4u1Z_g@mail.gmail.com>
 <20160722042556.GL15941@voom.fritz.box>
 <147217552167.17958.11590706771471540284@sboyd-linaro>
 <20160829134511.GC2166@littlecatz>
 <147252286938.20899.1763773530822329216@sboyd-linaro>
 <20160830235523.GC1753@littlecatz>
Message-ID: <147329189889.27412.12053595745294007737@sboyd-linaro>
Subject: Re: DT connectors, thoughts
Date: Wed, 07 Sep 2016 16:44:58 -0700
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <mark.rutland@arm.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Quoting David Gibson (2016-08-30 16:55:23)
> On Mon, Aug 29, 2016 at 07:07:49PM -0700, Stephen Boyd wrote:
> > Quoting David Gibson (2016-08-29 06:45:11)
> > > So, combining those thoughts together, I'm thinking dtc format for
> > > something connecting to two different widget sockets (pretty much the
> > > worst case) would look something like:
> > > =

> > > /plugin/ foo,widget-socket {
> > > };
> > > =

> > > /plugin/ foo,widget-socket {
> > >         realias {
> > >                 i2c-b =3D "i2c";
> > >                 intc-b =3D "intc";
> > >                 mmio-b =3D "mmio";
> > >         };
> > > };
> > > =

> > > &i2c {
> > >         .. devices on the i2c from the first plug ..
> > > };
> > > =

> > > &i2c-b {
> > >         .. devices on the i2c from the second plug ..
> > > };
> > > =

> > > Obviously we'd also need to devise an encoding for this to compile
> > > into, since the one I proposed previously won't work in this case.
> > > =

> > =

> > I suppose we can distribute the realias nodes when we compile the plugin
> > into overlay fragments. The socket matching is a little vague though.
> > How would we know which socket to apply to when we have two identical
> > looking sockets? I'm thinking we could put some of that information into
> > the fragment itself.
> =

> So, my assumption in this example was that the plugin could plug into
> *any* two widget sockets.  If it needs to connect to specific ones,
> then pretty much by definition, the sockets aren't really of
> indistinguishable type.

Ah ok. It wasn't clear on how we target where the extension board
connects into the full tree. It sounds like the decision of where to
plug in the extension board falls to the overlay manager then?

> =

> > =

> > /{
> >       compatible =3D "foo,whirlgig-widget";
> > =

> >       fragment@0 { /* corresponds to i2c in example above */
> >               target-socket =3D "foo,widget-socket-a";
> >               target-alias =3D "i2c";
> >               __overlay__ {
> >                       ....
> >               };
> >       };
> > =

> >       fragment@1 { /* corresponds to i2c-b in example above */
> >               target-socket =3D "foo,widget-socket-b";
> >               target-alias =3D "i2c";
> >               __overlay__ {
> >                       ...
> >               };
> >       };
> > };
> =

> We don't need any new construct here.  In this case the sockets aren't
> 100% compatible, which we can notate with
>         compatible =3D "widget-socket-a", "widget-socket";
> In the base board.
> =

> Devices which can plug into any widget socket will use target-socket =3D
> "widget-socket", those which require a specific one (including
> requiring both) can specifically list "widget-socket-a" and/or
> "widget-socket-b".

Agreed. How do we express the realias node in the overlay format though?
I was trying to come up with some way to make that work by
redistributing the alias to the fragments but that doesn't work so well.

> =

> > If we have two identical connectors maybe we'll have to enforce that the
> > connectors have some more specific unique compatible string so that we
> > can match up the right socket. But I don't see how we can require that
> > the overlays know this detail if they only care about one socket and
> > could go into either one of them. In that case we should have the loader
> > ask the user which socket they connected this extension board to?
> > =

> > I was also thinking it would be better to leave the gpio-map and
> > interrupt-map properties at the connector level. For example:
> > =

> >       widget1 {
> >               compatible =3D "foo,widget-socket";
> >               interrupt-map-mask =3D <0xffffffff>;
> >               interrupt-map =3D <0 &intc 7 0>,
> >                               <1 &intc 8 0>;
> >       };
> =

> That could work - but we should (and implicitly, do) support either
> way.  Using subnodes might be useful for particularly complex irq or
> gpio mappings.

Sounds good.

> =

> > and then we could put a label on the plugin/expansion syntax so we can
> > reference the connector as a whole:
> > =

> >       /plugin/ connector: foo,widget-socket {
> >               compatible =3D "foo,whirlgig-widget";
> >       };
> > =

> >       &i2c {
> >               device@40 {
> >                       interrupt-parent =3D <&connector>;
> >                       interrupts =3D <1>;
> >               };
> >       };
> > =

> > I also thought about making another alias inside the connector node to
> > point to itself, but that fails when you get into the situation of two
> > connectors and collisions, unless you rename them of course. It felt
> > better to leave that choice to the overlay though.
> > =

> > In conclusion, I see a few topics/patterns emerging:
> > =

> > 1) Expose phandles through the connectors in some way that allows us to
> >    limit what the plugin/expansion boards can modify or use
> =

> Yes, I definitely think we want that.
> =

> > 2) Have some flexible syntax to remap cell sizes from the baseboard
> >    through the connector to provide a consistent connector size (i.e.
> >    remap interrupts and gpios from multiple sources, etc. into a fixed
> >    number of cells)
> =

> I don't think we need any new constructs here.  If there are
> mismatches we can put dummy bridges with appropriate ranges properties
> on one side or the other.
> =

> The only thing I see that might want some help is that the connector
> type should certainly imply a specific set of cell widths for all the
> included buses.  So possibly we should supply some stuff to help
> enforce that.

I'm specifically thinking that anything that has a #<name>-cells
associated with it (#gpio-cells, #clock-cells, #power-domain-cells,
etc.) would need to have an associated <name>-map property and
associated parsing code so that we can make a consistent cell width for
the connector. If we have existing ways to make this work, e.g.
interrupt-map or ranges, then we don't need.

> =

> > 3) Allow plugin/expansion boards to use multiple connectors from the
> >    baseboard in a consistent way
> =

> Seems reasonable.
> =

> > 4) Attempt to maintain almost all of the current overlay syntax with
> >    syntactic sugar
> =

> I'm not really sure what you mean by that.
> =


I mean that we're not really trying to change the general structure of
the DT overlay syntax. At least from what I can tell we're planning to
convert this /plugin/ format into a DT overlay that gets compiled into
binary all inside DTC.
