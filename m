From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 05/11] dt-bindings: net: sun4i-emac: Convert the
 binding to a schemas
Date: Thu, 13 Jun 2019 11:32:30 -0600
Message-ID: <CAL_Jsq+KwH-j8f+r+fWhMuqJPWcHdBQau+nUz3NRAXYTpsyuvg@mail.gmail.com>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <d198d29119b37b2fdb700d8992b31963e98b6693.1560158667.git-series.maxime.ripard@bootlin.com>
 <20190610143139.GG28724@lunn.ch> <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
 <20190611145856.ua2ggkn6ccww6vpp@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190611145856.ua2ggkn6ccww6vpp@flea>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 7:25 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> On Mon, Jun 10, 2019 at 12:59:29PM -0600, Rob Herring wrote:
> > On Mon, Jun 10, 2019 at 8:31 AM Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - interrupts
> > > > +  - clocks
> > > > +  - phy
> > > > +  - allwinner,sram
> > >
> > > Quoting ethernet.txt:
> > >
> > > - phy: the same as "phy-handle" property, not recommended for new bindings.
> > >
> > > - phy-handle: phandle, specifies a reference to a node representing a PHY
> > >   device; this property is described in the Devicetree Specification and so
> > >   preferred;
> > >
> > > Can this be expressed in Yaml? Accept phy, but give a warning. Accept
> > > phy-handle without a warning? Enforce that one or the other is
> > > present?
> >
> > The common schema could have 'phy: false'. This works as long as we've
> > updated (or plan to) all the dts files to use phy-handle. The issue is
> > how far back do you need kernels to work with newer dtbs.
>
> I guess another question being raised by this is how hard do we want
> to be a deprecating things, and should the DT validation be a tool to
> enforce that validation.
>
> For example, you've used in you GPIO meta-schema false for anything
> ending with -gpio, since it's deprecated. This means that we can't
> convert any binding using a deprecated property without introducing a
> build error in the schemas, which in turn means that you'll have a lot
> of friction to support schemas, since you would have to convert your
> driver to support the new way of doing things, before being able to
> have a schema for your binding.

I've err'ed on the stricter side. We may need to back off on some
things to get to warning free builds. Really, I'd like to have levels
to separate checks for existing bindings, new bindings, and pedantic
checks.

For '-gpio', we may be okay because the suffix is handled in the GPIO
core. It should be safe to update the binding to use the preferred
form.

> And then, we need to agree on how to express the deprecation. I guess
> we could allow the deprecated keyword that will be there in the
> draft-8, instead of ad-hoc solutions?

Oh, nice! I hadn't seen that. Seems like we should use that. We can
start even without draft-8 support because unknown keywords are
ignored (though we probably have to add it to our meta-schema). Then
at some point we can add a 'disallow deprecated' flag to the tool.

Rob
