From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: orange-pi-zero: enable SPI NOR
Date: Wed, 24 May 2017 08:35:36 +0200
Message-ID: <20170524063536.lotdwmkecenywwmi@flea.home>
References: <20170519213550.8434-1-geomatsi@gmail.com>
 <20170519213550.8434-3-geomatsi@gmail.com>
 <20170522092900.7v2mg5zkbt6eclhr@flea.lan>
 <20170522203012.k2f2kizp5jkiliq7@speedy.hunter>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="l5wvrovc3g6mtkdm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170522203012.k2f2kizp5jkiliq7-tVm4GcgtBpsfMUw/CLfKLg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l5wvrovc3g6mtkdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Mon, May 22, 2017 at 11:30:12PM +0300, Sergey Matyukevich wrote:
> > > For more information see:
> > > - http://linux-sunxi.org/Orange_Pi_Zero#SPI_NOR_flash
> >=20
> > Same remark here than on the first patch
>=20
> Ok, I will provide a more detailed commit message
> w/o external references.
>=20
> > > +&spi0 {
> > > +	status =3D "okay";
> > > +
> > > +	flash@0 {
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <1>;
> > > +		compatible =3D "mxicy,mx25l1606e", "winbond,w25q128";
> > > +		reg =3D <0>;
> > > +		spi-max-frequency =3D <40000000>;
> >=20
> > How do the other OPi Zero that doesn't have that SPI flash behave?
>
> Hmmm. Good point. According to linux-sunxi.org docs SPI NOR flash
> was optional in the first production batch in Dec 2016. In later
> batches flash chip was pre-populated. However there are should
> be quite a few boards around which do not have flash.
>=20
> Does it make sense to set status to 'disabled' by default adding
> appropriate comment in the commit message ?

If it's just that the driver fails to probe, we can live with that I
guess. If not, then yes, that's a solution too.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--l5wvrovc3g6mtkdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJSm4AAoJEBx+YmzsjxAgcy4P/3ba7jH+SC0jL37Rh5Suv82y
tdGHLfqwTAV3i8cTcIRjG2z7BM/E/0EnnA27V638hADaxbsssT5UhrfcYXbMHLG4
jdkxncRuzEIAAcy/nZ8IEsydwk0oL1rsjcJ1VFwO5ZgknjO3yxitcusmQ2I0tW96
kHDmv09b5TbhybohclqwxPJI0LrDr8sHpaCydgXYJFdUA4cWVVtWf/CVggMq3feN
AUN0kBwz8yImMIt/d7UMa+ljjx33gnhw3HU+2RZVuiHHA2dIM70UCn+KU1aqHQ8r
IRQ0yIIUjDG7KUR3snkPSijbfi+VM/f8i0LUg8n58K13fb+48cuQES4kHbZznZmq
qCgxav0hho45JRlmO6tCchc5MZaPpOrzH1dA1rIsK5B2DOtaeNgciBZcA+TX2no2
eIACHjTKDo/bnOiKqamNhgeEMqcs5WZovlolU4vPjeGqkvTju8hVRgnqspJEPiDW
6K/7NY/Kgl9/ACV4ukx+d9Z0zhs5BZTqkaAvky/n1MbIYW/9JtTwZx0prxzuxQAq
MwjDu9qlySHbzF7hj/Z3ERjPYdyGy9UpefdhkPO5l51c64ZmuiGTgwqKzIHL2PgY
gB6X32t2LG4GITEEufUg4Ni9mEgKZOeWS6Z8IuAiAIq7qhJGVws8I3E4wlIs3q8a
KJwodIAjGXiHq74vzHVs
=L9XA
-----END PGP SIGNATURE-----

--l5wvrovc3g6mtkdm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
