From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] clk: sunxi: Make the mod0 clk driver also a platform
 driver
Date: Tue, 6 Jan 2015 10:31:59 +0100
Message-ID: <20150106093159.GE7853@lukather>
References: <1419071809-22457-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1419071809-22457-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2014 at 11:36:49AM +0100, Hans de Goede wrote:
> With the prcm in sun6i (and some later SoCs) some mod0 clocks are instant=
iated
> through the mfd framework, and as such do not work with of_clk_declare, s=
ince
> they do not have registers assigned to them yet at of_clk_declare init ti=
me.
>=20
> Silence the error on not finding registers in the of_clk_declare mod0 clk
> setup method, and also register mod0-clk support as a platform driver to =
work
> properly with mfd instantiated mod0 clocks.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUq6uPAAoJEBx+YmzsjxAgIF0P/1yhkNopsPsSsVod+sNe4ib8
KuEV67sIRfxAFz5oW9i9oJUnJNDU/rMZ5YhzT5mOK1HbEJ5LD48I2BvKd3HS6Pl3
GDzbwBKFaChIiFunZtEmOa1iu4vxzZl/pVNep5uSrycS1T/6iy5Pjd032Qoy6Ol9
ZCaLYR9yN9/ISmyrIzkdtD+KEnKxw8FVK/72qXLIjQeea/aBO/5wOlY31POZY2LN
NEsZa0nujKii3aoY+iOCjWSyoJgA6HRg5ULVKxUFnlzwhmYcuIeSu/qkHYFBTzwj
5OTVwKAcSEkjlap8Qe7qHtvxzelm2DtoRzNGne3xfhXXzxn3LekqaeUYwzjZ9dE2
U79Ls3xaEpLe3VPxu3x5QxLCLEW9H64f85xAYR1ArZvE4KSb+Z992L12iXgXVJxt
krEMJi47P4IpJgfJVM6AnZfg3fwfSrFMHNgJF8s6U7f5fcCv22mTxia8ncobk6gA
GG6lwRfTjwEt5UlnGKY4mLNxAoQFo6fe4ioR647YtsX34Vij7bNqsVhCv3p8QJKl
WRqGNqXwSFx5d0CYeO+LFd7eSNslGky5RLSACrnAkJVd/pOiAy0hTkVEboQuYPMF
nrutqPvfYyZcQT30aPvkEt7H2NBgyQiao0hgWSlTxA1oXAecavUXx8Jdbf5yki89
p8aRWy+KG/f7Vium0cEL
=lFBF
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
