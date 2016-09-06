From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Wed, 7 Sep 2016 00:38:06 +0100
Message-ID: <20160906233806.GZ3950@sirena.org.uk>
References: <20160906210125.GE79728@google.com>
 <20160906224054.GX3950@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R4k76f8oNWH5pGim"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160906224054.GX3950-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--R4k76f8oNWH5pGim
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 06, 2016 at 11:40:54PM +0100, Mark Brown wrote:
> On Tue, Sep 06, 2016 at 02:01:25PM -0700, Matthias Kaehlcke wrote:
> > The new op is analogous to set_voltage_time_sel. It can be used by
> > regulators that don't have a table of discrete voltages. The function

> I've only got patch 1 in this series, what's going on here?

Actually it turns out I have at least three copies of this, one copy of
what's hopefully the reset of the series and none of them are threaded
together :(  You probably want to take a look at your patch sending
setup...

--R4k76f8oNWH5pGim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCAAGBQJXz1NbAAoJECTWi3JdVIfQAcUH/RPzoNwWudVi697VB49zW1sw
yC7MvW7MsfoEb2UIEqWJAKcZvimlYdcwi1BeZzDsJ/Ej1Dbo/HVgnZzM7CZ0LAgZ
K7Obb8AJWXyDEYUjVDa8WozjzUS3u6CUAfuttP4qP1uFsCGPzQ9FpOBzUnUROHtW
tA6TYwP1/XQYQbaE84q8MIESnMbZ8pcS+JyDSboyUjV/jnpPSVwqhsJaqTlMHLtq
Vi4uDfnMy8r1nbxD2kePNw58tqVVJQxNhooLzjmYYji7cD6MZNwzQbxJlDz87mtL
xtxkz+6otsblQmTW7j7TErNyAGuw/gmOC+x9XairWiat8ThMgohcjMdlKB7zQhU=
=TvXT
-----END PGP SIGNATURE-----

--R4k76f8oNWH5pGim--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
