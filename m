From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCHv3 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Tue, 16 Jan 2018 11:27:20 +0100
Message-ID: <20180116102720.fmory3ppmf5eomk3@earth.universe>
References: <20180115193722.10241-1-sebastian.reichel@collabora.co.uk>
 <20180115193722.10241-2-sebastian.reichel@collabora.co.uk>
 <20180115225718.GA4927@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sqa273g6cykhysjv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180115225718.GA4927-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sqa273g6cykhysjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 15, 2018 at 11:57:18PM +0100, Andrew Lunn wrote:
> >  int dsa_port_fixed_link_register_of(struct dsa_port *dp)
> >  {
> >  	struct device_node *dn =3D dp->dn;
> > @@ -305,6 +354,10 @@ int dsa_port_fixed_link_register_of(struct dsa_por=
t *dp)
> >  			ds->ops->adjust_link(ds, port, phydev);
> > =20
> >  		put_device(&phydev->mdio.dev);
> > +	} else {
> > +		err =3D dsa_port_setup_phy_of(dp, true);
> > +		if (err)
> > +			return err;
>=20
> Hi Sebastian
>=20
> First off, i tend to agree with Florian. I'm not sure how reliable
> this is. There is normally a state machine moving the PHY between
> different states. But in order to do that, i think you need a netdev.
> Have you tried multiple down/up of the other MAC/PHY? Does it always
> work?

I tested multiple down/up transitions and everything works as
expected.

> But, at the moment, we don't have much better.
>=20
> What i don't like is having this code inside
> dsa_port_fixed_link_register_of(). This has nothing to do with a fixed
> link. Please export functions from port.c and call them directly from
> dsa_port_setup() and dsa_port_teardown().

I just sent PATCHv4 implementing this change.

-- Sebastian

--sqa273g6cykhysjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlpd04YACgkQ2O7X88g7
+pqPAA//XhqModlkeI+LH2fDa+ivI+Ws064fM6T3bcY8v7RmFdlAGswo+82iIzbw
yuWquv07gcIjsoFesBizAF9dW8Z7unMaY9riGYl7SDMmB2mXZ/ernrgZIqj8KKwI
KY0WnoxSS45zblyBNA+753bKRzimiubHGzgoDuMphSM5bE7eXFm3bDsQxgfG5Iac
nadminFcvLWMXdnPicrBpOmdKAicPwKlJ5F9r2Meq9y8GobsrAbygIYs0SKSbN4R
UXp8xbLvJes/FqC6CCZ7XA5fpWfNkGhVO5AaBAmYAEi1WqFsenfLYWAnOOR2P+xj
Z9wzJbP0dXI2JLfEhaJ6C9XbXtsYjkLJplL9hlvqavwawia+yvWXugTCckVWDeTR
GE9E6oz8MPw1C5P2hjg1hCbHqnjsUWNyM5WVQfXzZh5bAPkRu4ZAL1Oiysb4nsmx
Evgv+gGkzIbhDbKRPhwSbvqg15AGnOQDeqVJHHzFTqsYI9VwlvZbqP0oeSfhOQp5
699iZtHfDaRp4yKrBcpZPXh+RO09QD5o52Wd5a0Y8zAp3iVTcx8s5T2MnezT+F+m
qIvFamcMIUrXK5ijQvg1ocWABWQTM8Uk9s+pORVv02UVEcLy77w4ivnmI1O2X6zZ
qaplEnKLRkwBx5p4eexf2LQ215KR73+TtfMnjTNuFm1DEIEaMYw=
=K/Wj
-----END PGP SIGNATURE-----

--sqa273g6cykhysjv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
