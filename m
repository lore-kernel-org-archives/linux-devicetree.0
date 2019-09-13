From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: crypto: Add DT bindings documentation
 for sun8i-ce Crypto Engine
Date: Fri, 13 Sep 2019 14:11:24 +0200
Message-ID: <20190913121124.clfi46vcnrxhzmwh@localhost.localdomain>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-4-clabbe.montjoie@gmail.com>
 <20190907040116.lib532o2eqt4qnvv@flea>
 <20190911183158.GA8264@Red>
 <20190912093737.s6iu63sdncij2qib@localhost.localdomain>
 <CAGb2v678WGQm5PNy8GhOTpz+fYeLP3k0dnR0F00yyZpSRcA4yA@mail.gmail.com>
 <20190912203301.is4ubixhk64dl5t7@localhost.localdomain>
 <CAGb2v646YkM93BAo=hrpL+tgDU-JJ49-uMCMGECUbouoJrpg=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mxfblhwyykii33ch"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v646YkM93BAo=hrpL+tgDU-JJ49-uMCMGECUbouoJrpg=w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, David Miller <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-crypto@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org


--mxfblhwyykii33ch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2019 at 09:37:17PM +0100, Chen-Yu Tsai wrote:
> On Thu, Sep 12, 2019 at 9:33 PM Maxime Ripard <mripard@kernel.org> wrote:
> > On Thu, Sep 12, 2019 at 09:26:27PM +0100, Chen-Yu Tsai wrote:
> > > > >
> > > > >   clock-names:
> > > > >     items:
> > > > >       - const: ahb
> > > > >       - const: mod
> > > > >       - const: mbus
> > > >
> > > > And here as well
> > > >
> > > > Something I missed earlier though was that we've tried to unify as
> > > > much as possible the ahb / apb / axi clocks around the bus name, it
> > > > would be great if you could do it.
> > >
> > > I think we also want to standardize "mbus" as "dram"?
> >
> > Do we? The only user so far seems to be sun9i-de, while mbus has more
> > users. I don't really care though, both mbus and dram are pretty
> > generic to me. What makes you prefer dram over mbus?
>=20
> Argh... it's actually "ram" we use the most. Both "dram" and "mbus"
> have only one instance each.

Let's use ram then :)

Maxime

--mxfblhwyykii33ch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXXuHbAAKCRDj7w1vZxhR
xazRAP9q4WVrPnh+fZ02hS/8DFlnUg4ZEiOZEKaupnYTZODnDgEA3aUQ5mkgXMdG
FzX2x3Ap9qkbqSmmGBRWN/QtgReLcg0=
=KM0B
-----END PGP SIGNATURE-----

--mxfblhwyykii33ch--
