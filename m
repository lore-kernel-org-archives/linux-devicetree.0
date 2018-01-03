From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCHv1 1/6] net: dsa: Support internal phy on 'cpu' port
Date: Wed, 3 Jan 2018 16:07:04 +0100
Message-ID: <20180103150704.jmrsauyhw3htf4my@earth.universe>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
 <20180103122609.5482-2-sebastian.reichel@collabora.co.uk>
 <20180103132128.GI15036@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yrkvtfmhvyj2maox"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180103132128.GI15036-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yrkvtfmhvyj2maox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, Jan 03, 2018 at 02:21:28PM +0100, Andrew Lunn wrote:
> On Wed, Jan 03, 2018 at 01:26:04PM +0100, Sebastian Reichel wrote:
> > This adds support for enabling the internal phy for a 'cpu' port.
> > It has been tested on GE B850v3 and B650v3, which have a built-in
> > MV88E6240 switch connected to a PCIe based network card. Without
> > this patch the link does not come up and no traffic can be routed
> > through the switch.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> > ---
> >  net/dsa/port.c | 26 ++++++++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/net/dsa/port.c b/net/dsa/port.c
> > index bb4be2679904..f99c1d34416c 100644
> > --- a/net/dsa/port.c
> > +++ b/net/dsa/port.c
> > @@ -282,6 +282,10 @@ int dsa_port_fixed_link_register_of(struct dsa_por=
t *dp)
> >  	int mode;
> >  	int err;
> > =20
> > +	mode =3D of_get_phy_mode(dn);
> > +	if (mode < 0)
> > +		mode =3D PHY_INTERFACE_MODE_NA;
> > +
> >  	if (of_phy_is_fixed_link(dn)) {
> >  		err =3D of_phy_register_fixed_link(dn);
> >  		if (err) {
> > @@ -292,10 +296,6 @@ int dsa_port_fixed_link_register_of(struct dsa_por=
t *dp)
> >  		}
> > =20
> >  		phydev =3D of_phy_find_device(dn);
> > -
> > -		mode =3D of_get_phy_mode(dn);
> > -		if (mode < 0)
> > -			mode =3D PHY_INTERFACE_MODE_NA;
> >  		phydev->interface =3D mode;
> > =20
> >  		genphy_config_init(phydev);
> > @@ -305,6 +305,24 @@ int dsa_port_fixed_link_register_of(struct dsa_por=
t *dp)
> >  			ds->ops->adjust_link(ds, port, phydev);
> > =20
> >  		put_device(&phydev->mdio.dev);
> > +	} else if (mode =3D=3D PHY_INTERFACE_MODE_INTERNAL ||
> > +		   mode =3D=3D PHY_INTERFACE_MODE_NA) {
>=20
> Hi Sebastian
>=20
> I understand what you are trying to do, i've got boards which also
> have back-to-back PHYs for the CPU port. These boards however have the
> strapping correct, so nothing needs doing in software.

What I have is a PCIe intel network card with phy, that is wired to a
mv88e6240 switch. The network card is exposed as normal network device,
so phy is enabled when the interface is brought up. The 'cpu' port
for mv88e6240 has an integrated phy, that needs to be enabled.

Your boards must be different, since mv88e6xxx is being reset during
probe(). So even if the 'cpu' phy was enabled before driver probe(),
it would be disabled afterwards.

> But the way you are doing it is wrong. PHY_INTERFACE_MODE_NA means
> something else has already setup the interface mode, leave it alone.

Ok, I assumed, that PHY_INTERFACE_MODE_NA means "no explicit
configuration found, use implicit configuration". E.g. for
mv88e6xxx the downstream ports are not configured in DT, but
their PHY is enabled.

> PHY_INTERFACE_MODE_INTERNAL means there is some other sort of bus
> between the MAC and the PHY than the normal MII.
>=20
> What you want to say is that there is a PHY on this port, and that you
> want to configure it to a given fixed configuration, probably 1000
> Full, with auto-neg turned off. This is something completely different
> to a fixed phy, which is used when there is no PHY at all.

That's why I put the new code into

if (of_phy_is_fixed_link(...)) {
    <<< old code >>>
} else {
    <<< new code >>>
}

I agree, that the function name dsa_port_fixed_link_register_of() is
a bit confusing with the added code. I actually added this to
dsa_cpu_dsa_setup() and with the rebase to current master it ended
up there.

> What state is the PHY in, if you don't have this patch? Is it powered
> down?

The phy is part of mv88e6240, which is being reset during probe.
So the phy is powered down and DSA is not functional except for
phy information of downstream ports. The PCIe network interface
does not detect a carrier.

-- Sebastian

--yrkvtfmhvyj2maox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlpM8ZUACgkQ2O7X88g7
+pr0KA/9HMqE9FxlW3x08nF3AaBKwVMqUhQCozcIdOQobmP1Rku7drLYugqpCk21
iXSfswo0pOq6Y3cpYdn1NxKV5fTV6z5+YO0s58qATUVTP4iYWRJz3kqRqM7UHmim
Ur2zT0Vmv3dl40rWno2Dy6V5HH6EgxrZKD3oz88CdKK8MKB7Q2OE38+qF/tQywNU
0rueNVzMuolMZxqlENMFittBtIij9LO0uIMgWS094CFGioJMaZhbSAm+uPTR1zj+
pGpuJ1RrIs0KLFD4y0rSe+AS20PFVC5/13d/6ipwHPtNmKTXBNW6QIEMPibOCQZe
OCGvlFJE01HEtGLtCSl5Kr3d8ZqXbva3CyCG4Lg9gV9Ab1MhoOylYcahGZ3ynesA
jePG4eZpL8I8ndm9o7KWrOjY8jhj4FiUGjzmcF1RuR24QczdjAtWkwjZtrPydXp5
e9rVd8JyI6RNZTw026b4oeaQR4zsj7nFW4PYpTOy8s4AM1BcEBQvI5Gmx+oQQJua
IKbYcpWEpK7JsDANngV/eoqmgWGeVGypxajKaDTt9x9OkLxjchgO4xY9eKWtDbh8
WD55sO79HTd18KDRIEprUnt3gstZvugjTyIGt3nA0y5vsUnSWBCpjTy5hcsjOlRg
1h0Q6Bu4+rdmYDWfxnQVwLcnNRtYQ41SVovebHDhNfM+otqpabA=
=QeSc
-----END PGP SIGNATURE-----

--yrkvtfmhvyj2maox--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
