Return-Path: <stephen.boyd@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <stephen.boyd@linaro.org>
In-Reply-To: <20160908002611.GA3883@voom.fritz.box>
References: <577ACE0D.9050700@gmail.com> <20160718142037.GS16769@voom.fritz.box>
 <CAL_JsqLkMA1VHfHpP4oCWtONWq5GeyS731r8PjjeL_DZ4u1Z_g@mail.gmail.com>
 <20160722042556.GL15941@voom.fritz.box>
 <147217552167.17958.11590706771471540284@sboyd-linaro>
 <20160829134511.GC2166@littlecatz>
 <147252286938.20899.1763773530822329216@sboyd-linaro>
 <20160830235523.GC1753@littlecatz>
 <147329189889.27412.12053595745294007737@sboyd-linaro>
 <20160908002611.GA3883@voom.fritz.box>
Message-ID: <147337818438.23899.8501369481182352188@sboyd-linaro>
Subject: Re: DT connectors, thoughts
Date: Thu, 08 Sep 2016 16:43:04 -0700
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <mark.rutland@arm.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Quoting David Gibson (2016-09-07 17:26:11)
> On Wed, Sep 07, 2016 at 04:44:58PM -0700, Stephen Boyd wrote:
> > Quoting David Gibson (2016-08-30 16:55:23)
> > > So, my assumption in this example was that the plugin could plug into
> > > *any* two widget sockets.  If it needs to connect to specific ones,
> > > then pretty much by definition, the sockets aren't really of
> > > indistinguishable type.
> > =

> > Ah ok. It wasn't clear on how we target where the extension board
> > connects into the full tree. It sounds like the decision of where to
> > plug in the extension board falls to the overlay manager then?
> =

> Yes.  The whole point of connectors is that they're interchangeable,
> so neither the "plug" side nor the "socket" side should specify which
> instance of the other part they're connected to.

Agreed. Another item in the list!

> =

> So to resolve the whole tree in this case, extra information would be
> needed.  Ideally it would come from probing (even something ad-hoc
> like an ID register), failing that it would need to be admin
> configured.

Sure.

> > =

> > Agreed. How do we express the realias node in the overlay format though?
> > I was trying to come up with some way to make that work by
> > redistributing the alias to the fragments but that doesn't work so
> > well.
> =

> So, I'm thinking of the overlay dt info in 3 pieces
> =

> 1) Global metadata
> =

>   Not much here yet, but it seems like it could be useful.
> =

> 2) Per-connector metadata
> =

>   This specifies what sort of "socket" each "plug" on the overlay
>   needs to connect to, and any other information we need that's
>   specific to a particular "plug"
> =

> 3) DT fragments
> =

>   The actual device info applied once we've resolved all the aliases
>   and whatnot.
> =

> The realias information would need to be in part (2)
> =

> How we encode those pieces into the final overlay dt is pretty close
> to an arbitrary choice.

Ok. Perhaps we could have a node in the root of the overlay for (2)
which we can use to lookup the aliases when resolving them.

/ {
	// Global metadata (1)
	compatible =3D "foo,whirlgig-widget";
	=

	// Per-connector metadata (2)
	socket_a: socket@0 {
		compatible =3D "foo,widget-socket";
	};

	socket_b: socket@1 {
		compatible =3D "foo,widget-socket";
		realias {
			i2c-b =3D "i2c";
			intc-b =3D "intc";
			mmio-b =3D "mmio";
		};
	};

	// Fragments (3)
	fragment@0 {
		target-alias =3D "i2c";
		__overlay__ {

		};
	};
};

Then when we resolve aliases we would look through the set of sockets
and look for realias nodes to figure out which node to target. It may
also be better if we have a sockets container node and a fragments
container node to partition the two things.

> > > =

> > > I don't think we need any new constructs here.  If there are
> > > mismatches we can put dummy bridges with appropriate ranges properties
> > > on one side or the other.
> > > =

> > > The only thing I see that might want some help is that the connector
> > > type should certainly imply a specific set of cell widths for all the
> > > included buses.  So possibly we should supply some stuff to help
> > > enforce that.
> > =

> > I'm specifically thinking that anything that has a #<name>-cells
> > associated with it (#gpio-cells, #clock-cells, #power-domain-cells,
> > etc.) would need to have an associated <name>-map property and
> > associated parsing code so that we can make a consistent cell width for
> > the connector. If we have existing ways to make this work, e.g.
> > interrupt-map or ranges, then we don't need.
> =

> Yes, I agree.  All the "interrupt tree like" things need interrupt
> tree like nexus nodes, with a map and map-mask.
> =

> However, we also need some way of ensuring that the #address-cells and
> #size-cells for any buses we expose match properly.
> =

> Or maybe we need to invent something like a cross between 'ranges' and
> 'interrupt-map' that can remap ranges on one address space to the
> address space attached to a different node.

Ok. I can't think of any use case for remapping reg properties across
connectors. At least, for plug in boards we typically pass through i2c,
spi, uart, usb, dsi, hdmi, mi2s, etc. and I don't think we're changing
the reg properties for the nodes we would be placing on those busses.
Maybe PCIe is one case where this would matter though? I haven't thought
of how to handle that.

> > > > 4) Attempt to maintain almost all of the current overlay syntax with
> > > >    syntactic sugar
> > > =

> > > I'm not really sure what you mean by that.
> > > =

> > =

> > I mean that we're not really trying to change the general structure of
> > the DT overlay syntax. At least from what I can tell we're planning to
> > convert this /plugin/ format into a DT overlay that gets compiled into
> > binary all inside DTC.
> =

> Roughly speaking, yes.  However I think we should take the opportunity
> to address design flaws in the current overlay encoding as they come
> up (e.g. the fact that it uses phandles which *always* have to be
> resolved - better to directly use an alias / symbol / label).
> =


Alright. I was hoping to do some quick prototyping without changing DTC
to handle a different overlay encoding but that doesn't sound possible.
