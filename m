From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Sat, 5 Nov 2016 22:27:49 +0100
Message-ID: <20161105212748.vtdprlxxismy5xmk@perseus.defre.kleine-koenig.org>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <20161105212326.GC1216@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dqbnplv4mpch5vch"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161105212326.GC1216-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Martin Strba??ka <martin.strbacka-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dqbnplv4mpch5vch
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

On Sat, Nov 05, 2016 at 10:23:26PM +0100, Andrew Lunn wrote:
> > Still missing is support for the switch.
>=20
> Is it a Marvell Switch? armada-370-rd.dts would be a good start for
> the old binding? vf610-zii-dev-rev-b.dts uses the new binding.

Yeah, a 88E6176. I already try to understand vf610-zii-dev-rev-b.dts. Do
you know if this driver works for the 88E6176?

> > SFP is untested as is UART1.
>=20
> UART would be unusual. They are normally i2c.

I wanted to say: SFP is untested, and UART1 is untested too. Yes, SFP is
connected via i2c.

> > Do I need to "register" turris in vendor-prefixes.txt for that?
>=20
> Yes please.

OK, will wait for Martin to comment what we want there. cznic or turris.

Thanks
Uwe

--dqbnplv4mpch5vch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCgAGBQJYHk7RAAoJEMH8FHityuwJoS4H/0OzyMdZguTJ2rW/PJSC7kpX
vkkaoqdXYvfCEFYQJVlW6EmbKxBGWAbIdHN97GTQrF23OmtTvkClZF0tZOYNGen0
zQO6zyHEDvIWH2mb2CCdsqCheJmzcai7LKv25yfKWMNatTL43wrNe6Fp8hrLUjac
F1WOTRl+StoN7wnmQ3LOjPGgCqPhybYawZtVyt+CSr/E9ZvTw0by7m8Mba2jeYTn
iCpN2r//IZRbYlbXSbuLzZAFL7K1FyaE+5ccbGcpjU+MO6uzCk1D9GI0+uIMkHoS
hBdbovujmtL7fKFtKbVdpiCoAEgN7Qd1AL8ZOtC8cdHu5aRROK0z2TKJ/6ZWvD0=
=gIBb
-----END PGP SIGNATURE-----

--dqbnplv4mpch5vch--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
