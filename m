Return-Path: <stephen.boyd@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <stephen.boyd@linaro.org>
In-Reply-To: <20160829134511.GC2166@littlecatz>
References: <577ACE0D.9050700@gmail.com> <20160718142037.GS16769@voom.fritz.box>
 <CAL_JsqLkMA1VHfHpP4oCWtONWq5GeyS731r8PjjeL_DZ4u1Z_g@mail.gmail.com>
 <20160722042556.GL15941@voom.fritz.box>
 <147217552167.17958.11590706771471540284@sboyd-linaro>
 <20160829134511.GC2166@littlecatz>
Message-ID: <147252286938.20899.1763773530822329216@sboyd-linaro>
Subject: Re: DT connectors, thoughts
Date: Mon, 29 Aug 2016 19:07:49 -0700
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Mark Rutland <mark.rutland@arm.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-ID: <devicetree@vger.kernel.org>

Quoting David Gibson (2016-08-29 06:45:11)
> On Thu, Aug 25, 2016 at 06:38:41PM -0700, Stephen Boyd wrote:
> > Quoting David Gibson (2016-07-21 21:25:56)
> > > On Thu, Jul 21, 2016 at 02:15:57PM -0500, Rob Herring wrote:
> > > > On Mon, Jul 18, 2016 at 9:20 AM, David Gibson
> > > > <david@gibson.dropbear.id.au> wrote:
> > > > =

> > > > I understand how you are using i2c alias, but not the intc. It would
> > > > help if the same names were not used in multiple places unless they
> > > > are the same thing.
> > > =

> > > Yes, sorry.  We have both the /soc/intc node which is the base board's
> > > master interrupt controller.  Then we have the connector local 'intc'
> > > alias which describes the local interrupt space for just the
> > > connector.
> > > =

> > > > What does using aliases here buy us vs. just properties with a
> > > > phandle?
> > > =

> > > Um.. I'm not sure what you mean.
> > =

> > I think Rob means drop the aliases node and just have:
> =

> Oh, ok.  The reason for the aliases node is that putting the aliases
> (or whatever you want to call them) in the top level connector node
> limits what potential extensions we can make to the connector format.
> The aliases can essentially have any property name, so they could
> collide with additional "metadata" properties we might want to add.

Agreed. Putting them into a subnode will prevent any collisions, but
what sorts of collisions would there even be? Presumably the one making
up the connector binding will be choosing the phandles they want to
export with specific properties, and during that time they can also
choose to have other properties that don't conflict?

> =

> > =

> > How would we support an expansion board that goes onto two
> > sockets/connectors provided by the baseboard when the connectors
> > "export" the same phandle aliases? From what I can tell with this design
> > we'll be unable to describe a device on the expansion board that is
> > wired to properties provided by the two connectors.
> =

> Ok, so there are two parts to this.
> =

> 1) Allowing a plugin to use multiple connectors.
> =

> I thought a bit about this case, but didn't address it for
> simplicity.  That would require a different syntax, so we can rethink
> this if it's a use case we think we need.

Yes it would be nice to design for this case as well.

> =

> 2) Dealing with alias collisions between connector types
> =

> This one is fairly straightforward to handle.  By default, we'll use
> labels from connectors we plug into "as is".  However, we can add a
> syntax that allows us to locally rename labels from a connector (for
> those familiar with Python, think "import foo from bar as baz").
> =

> =

> So, combining those thoughts together, I'm thinking dtc format for
> something connecting to two different widget sockets (pretty much the
> worst case) would look something like:
> =

> /plugin/ foo,widget-socket {
> };
> =

> /plugin/ foo,widget-socket {
>         realias {
>                 i2c-b =3D "i2c";
>                 intc-b =3D "intc";
>                 mmio-b =3D "mmio";
>         };
> };
> =

> &i2c {
>         .. devices on the i2c from the first plug ..
> };
> =

> &i2c-b {
>         .. devices on the i2c from the second plug ..
> };
> =

> Obviously we'd also need to devise an encoding for this to compile
> into, since the one I proposed previously won't work in this case.
> =


I suppose we can distribute the realias nodes when we compile the plugin
into overlay fragments. The socket matching is a little vague though.
How would we know which socket to apply to when we have two identical
looking sockets? I'm thinking we could put some of that information into
the fragment itself.

/{
	compatible =3D "foo,whirlgig-widget";

	fragment@0 { /* corresponds to i2c in example above */
		target-socket =3D "foo,widget-socket-a";
		target-alias =3D "i2c";
		__overlay__ {
			....
		};
	};

	fragment@1 { /* corresponds to i2c-b in example above */
		target-socket =3D "foo,widget-socket-b";
		target-alias =3D "i2c";
		__overlay__ {
			...
		};
	};
};

If we have two identical connectors maybe we'll have to enforce that the
connectors have some more specific unique compatible string so that we
can match up the right socket. But I don't see how we can require that
the overlays know this detail if they only care about one socket and
could go into either one of them. In that case we should have the loader
ask the user which socket they connected this extension board to?

I was also thinking it would be better to leave the gpio-map and
interrupt-map properties at the connector level. For example:

	widget1 {
		compatible =3D "foo,widget-socket";
		interrupt-map-mask =3D <0xffffffff>;
		interrupt-map =3D <0 &intc 7 0>,
				<1 &intc 8 0>;
	};

and then we could put a label on the plugin/expansion syntax so we can
reference the connector as a whole:

	/plugin/ connector: foo,widget-socket {
		compatible =3D "foo,whirlgig-widget";
	};

	&i2c {
		device@40 {
			interrupt-parent =3D <&connector>;
			interrupts =3D <1>;
		};
	};

I also thought about making another alias inside the connector node to
point to itself, but that fails when you get into the situation of two
connectors and collisions, unless you rename them of course. It felt
better to leave that choice to the overlay though.

In conclusion, I see a few topics/patterns emerging:

1) Expose phandles through the connectors in some way that allows us to
   limit what the plugin/expansion boards can modify or use

2) Have some flexible syntax to remap cell sizes from the baseboard
   through the connector to provide a consistent connector size (i.e.
   remap interrupts and gpios from multiple sources, etc. into a fixed
   number of cells)

3) Allow plugin/expansion boards to use multiple connectors from the
   baseboard in a consistent way

4) Attempt to maintain almost all of the current overlay syntax with
   syntactic sugar

5) Connectors on expansion boards should be supported

Is there anything else we should add to this list?
