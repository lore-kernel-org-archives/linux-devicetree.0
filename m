From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: net: sun4i-emac: Convert the
 binding to a schemas
Date: Tue, 11 Jun 2019 16:58:56 +0200
Message-ID: <20190611145856.ua2ggkn6ccww6vpp@flea>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <d198d29119b37b2fdb700d8992b31963e98b6693.1560158667.git-series.maxime.ripard@bootlin.com>
 <20190610143139.GG28724@lunn.ch>
 <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2313426000568281042=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>, netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============2313426000568281042==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="akgu3rpnhcjfd75m"
Content-Disposition: inline


--akgu3rpnhcjfd75m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Mon, Jun 10, 2019 at 12:59:29PM -0600, Rob Herring wrote:
> On Mon, Jun 10, 2019 at 8:31 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - phy
> > > +  - allwinner,sram
> >
> > Quoting ethernet.txt:
> >
> > - phy: the same as "phy-handle" property, not recommended for new bindings.
> >
> > - phy-handle: phandle, specifies a reference to a node representing a PHY
> >   device; this property is described in the Devicetree Specification and so
> >   preferred;
> >
> > Can this be expressed in Yaml? Accept phy, but give a warning. Accept
> > phy-handle without a warning? Enforce that one or the other is
> > present?
>
> The common schema could have 'phy: false'. This works as long as we've
> updated (or plan to) all the dts files to use phy-handle. The issue is
> how far back do you need kernels to work with newer dtbs.

I guess another question being raised by this is how hard do we want
to be a deprecating things, and should the DT validation be a tool to
enforce that validation.

For example, you've used in you GPIO meta-schema false for anything
ending with -gpio, since it's deprecated. This means that we can't
convert any binding using a deprecated property without introducing a
build error in the schemas, which in turn means that you'll have a lot
of friction to support schemas, since you would have to convert your
driver to support the new way of doing things, before being able to
have a schema for your binding.

And then, we need to agree on how to express the deprecation. I guess
we could allow the deprecated keyword that will be there in the
draft-8, instead of ad-hoc solutions?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--akgu3rpnhcjfd75m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP/BsAAKCRDj7w1vZxhR
xU7tAQDcrE7AmbrNpKlW8XjNBwjZBTaNMJbwICwP0nzygayxHQD+MjHzz6TZnhQF
Qm1qbD7O25WDq9BPnYW8XMjLhY6IgQE=
=f1jE
-----END PGP SIGNATURE-----

--akgu3rpnhcjfd75m--


--===============2313426000568281042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2313426000568281042==--
