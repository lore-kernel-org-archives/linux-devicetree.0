From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: sun8i: a83t: device tree cleanup
Date: Mon, 1 May 2017 19:31:22 +0200
Message-ID: <20170501173122.z7cnefvkmruirevt@lukather>
References: <20170501031408.10469-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lyk2bbwu5qwejgu2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170501031408.10469-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lyk2bbwu5qwejgu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2017 at 11:14:06AM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
>=20
> Here's v2 of the A83T device tree cleanup patches. I dropped the change
> to the uart device node name for now.
>=20
> Also added a second patch changing the underscores in device node names
> I just added to hyphens. AFAIK that is the preferred naming scheme.
> Please squash it into "ARM: sun8i: a83t: Rename pinmux setting names".

Applied both, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lyk2bbwu5qwejgu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZB3DmAAoJEBx+YmzsjxAgiy4QALwGOu2a0ZUdHtMikvtepHK6
MId42R4EKB7NxCMJYxUDcojW+Gncc0MvDPmhVG8M2h4NS68zqgy9lD+xHT4VR4ht
Z7pYRUuCpgmzRwN6xFN5nbLh3nQH8SiIaO1wpOkxGldkW/wZ2MBqjtNKue52IpJ2
x90BATpgCMaWkexcSi/ZoBr+Wx8+ACt6KFv12UhVen1U6RP5gwyL3dPJ+wpM5ALK
VIL2NboJLDdlZOZkVcf+f/IAmPLeTseef7TB8UNL6grjOoQVaZqhlQoIf5DK+3oj
k16xexNmA/qWm7MiwbfrDUxxm8nTpHi62KC+2B8OUqpPvOvvgK71l3QhTD8EHfEZ
0gQhb7IPgbhyEFU5ZYcl/VICp2oYAvLfMOeUo2RYVE0swT2CvnIktEU4t43gH8hn
csK4Kkh+QY+dxlCHWmJMi30VUnpWKz03zBF7cCEoUdocaPN5yrZH0U8kkgpnMmUs
AfeANLIt8jRjibRIkr4RbNuP3b2HU61NTNkJ9H0LMw4jJMN0NH98LPyzQlLwcKqa
Gj9GSKqFriclYUZ1YTjhNH6CZEHSQRf77PUEWVYj+jLQh32+4S9PVwAycZqR0ICq
cu4dPCgVm80VdETSS4YJ/OtIT3grP+y3P73y5rtNartSwnMnPrPYQOjHBeyt9SzP
xgLX5ca0KyIZI4nZugt5
=0Nw6
-----END PGP SIGNATURE-----

--lyk2bbwu5qwejgu2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
