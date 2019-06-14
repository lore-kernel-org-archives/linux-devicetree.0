From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: net: sun4i-emac: Convert the
 binding to a schemas
Date: Fri, 14 Jun 2019 16:59:02 +0200
Message-ID: <20190614145902.vjytw74bs5roh2f2@flea>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <d198d29119b37b2fdb700d8992b31963e98b6693.1560158667.git-series.maxime.ripard@bootlin.com>
 <20190610143139.GG28724@lunn.ch>
 <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
 <20190611145856.ua2ggkn6ccww6vpp@flea>
 <CAL_Jsq+KwH-j8f+r+fWhMuqJPWcHdBQau+nUz3NRAXYTpsyuvg@mail.gmail.com>
 <20190614095048.j2xwdsucucbakkl2@flea>
 <CAL_Jsq+=yh3WhTg=1G02LUHGLHts6mECR9BQ+n7qHAihFViAxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wmxpz6l3hrzuotke"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+=yh3WhTg=1G02LUHGLHts6mECR9BQ+n7qHAihFViAxA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org


--wmxpz6l3hrzuotke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Jun 14, 2019 at 07:37:49AM -0600, Rob Herring wrote:
> > > For '-gpio', we may be okay because the suffix is handled in the GPIO
> > > core. It should be safe to update the binding to use the preferred
> > > form.
> >
> > It might require a bit of work though in drivers, since the fallback
> > is only handled if you're using the gpiod API, and not the legacy one.
> >
> > > > And then, we need to agree on how to express the deprecation. I guess
> > > > we could allow the deprecated keyword that will be there in the
> > > > draft-8, instead of ad-hoc solutions?
> > >
> > > Oh, nice! I hadn't seen that. Seems like we should use that. We can
> > > start even without draft-8 support because unknown keywords are
> > > ignored (though we probably have to add it to our meta-schema). Then
> > > at some point we can add a 'disallow deprecated' flag to the tool.
> >
> > So, in the generic ethernet binding, we would have:
> >
> > properties:
> >   phy-handle:
> >     $ref: /schemas/types.yaml#definitions/phandle
> >     description:
> >       Specifies a reference to a node representing a PHY device.
> >
> >   phy:
> >     $ref: "#/properties/phy-handle"
> >     deprecated: true
> >
> >   phy-device:
> >     $ref: "#/properties/phy-handle"
> >     deprecated: true
> >
> > Does that sound good?
>
> Yes.

Great, I'll post that.

> > Now, how do we handle the case above, in the device specific binding?
> > We just require the non-deprecated one, or the three?
>
> Wouldn't that just depend if all the instances of the device specific
> binding have been updated?

You mean in the DTS?

It shouldn't matter, we'll want to have a warning anyway. But yeah,
I'll update them too.

Maxme
--wmxpz6l3hrzuotke--
