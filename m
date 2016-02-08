From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: add the Alpine v2 EVP
Date: Mon, 8 Feb 2016 12:00:36 +0100
Message-ID: <20160208110036.GC4117@kwain>
References: <1454922699-16785-1-git-send-email-antoine.tenart@free-electrons.com>
 <1454922699-16785-3-git-send-email-antoine.tenart@free-electrons.com>
 <20160208105104.GA12991@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160208105104.GA12991@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, tsahee-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rshitrit-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Barak Wasserstrom <barak-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Feb 08, 2016 at 10:51:05AM +0000, Mark Rutland wrote:
>=20
> > +	chosen {
> > +		stdout-path =3D "console0:115200n8";
> > +	};
>=20
> There is no console0 alias, so this cannot work.
>=20
> Did you mean serial0?

Oops... Yes, I meant serial0. I'll fix this.

> [...]
>=20
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1;
> > +		serial2 =3D &uart2;
> > +		serial3 =3D &uart3;
> > +	};
>=20
> [...]
>=20
> > +	psci {
> > +		compatible =3D "arm,psci-0.2", "arm,psci";
> > +		method =3D "smc";
> > +		cpu_on =3D <0x84000003>;
> > +	};
>=20
> If you have PSCI 0.2, the cpu_on ID (and all other mandatory function
> IDs) are implicit.
>=20
> If you want to have "arm,psci" as a fallback, then please add the IDs
> for functions mandatory in PSCI 0.2 which existed in the "arm,psci"
> binding. Otherwise, drop "arm,psci" from the compatible list, along
> with the cpu_on function ID.

OK. I'll make some tests and update.

Thanks or the review!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWuHVTAAoJEFxNi8it27zYlJMP+wWbE2Jt0hnRdRw4p+TyHzXJ
Y0PYzPhAV43lTc4huENGi5VurXsvFAXh+eraNfGZoEI/wpRljH/kP6iWjRH2H+xD
S4Qj+W8fZCIxKU39t+QOjCsJahLk+xQ4mzmqGYOZitsQi3U8iUae/FW4HxiXPT2L
b6c3I87amc2NcZMNneGHAo2mqUi0412rPCnO09NpbULorMoG+MYsuA8FYotaBXyK
MEAcftiHO2xeolM4AAtF23LQaKwriTvEEsRkt+db8c8tpoHWLQs06Yu/9vG3z/iS
ORVzaDGSj0vDnQrPuaa1KRqjMWTsF/pq7r6qfxhUkbKI0YumLqTNigAytS+DM9B7
P609W7Rws8ngnNOxT8lNDyfSQ9X3xeprH7KeqGFLFP0CcEC9NXEjTSvopH8TApXI
0fH4/BWnOlb8O9Un90IfVBpPzJS67/mYbUJq72d1B/UVJaaXFYcE2DP8Rw5AqqsV
5MkFInqGx++nQ0KzsNlZmPB8pKHXILn15kVErVcZTbSerplQHoej5L3nhs1E32UL
guM5PGz3JSdJs8R51+bCQGGw+0jYprMyOlU0yf05AU/YWCC61gE+xlqVV5uZZu/R
lVAeoQI2F9YgprwZpewI3GIJNKI+YasQEYoKjdHSnOaaJzYWtv5LrZcdNEXf7yQ3
+JXkJhKUP+oNG4ACadmd
=92dd
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
