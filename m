From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 12/12] ARM: dts: sun6i: hummingbird: Add basic support
 for the WiFi module
Date: Mon, 23 Mar 2015 15:16:29 -0700
Message-ID: <20150323221629.GG15676@lukather>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-13-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425988764-23618-13-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 07:59:23PM +0800, Chen-Yu Tsai wrote:
> The Hummingbird A31 has an AMPAK AP6210 WiFi+Bluetooth module. The
> WiFi part is a BCM43362 IC connected to MMC1 in the A31 SoC via SDIO.
> The IC also takes a power enable signal via GPIO.
>=20
> The WiFi module supports out-of-band interrupt signaling via GPIO,
> but this is not supported in this patch.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVEJC9AAoJEBx+YmzsjxAgJIUQAJuvW13KJeXu4w/uCoI7Cie2
zhhk7GwlH0ykHuifdrwcIFc/VHOBXxPxmdRe8WEwV2MWuNMvjEASOAhgMbmzT3Wy
+tvaFMuThHW0eQv/G6NXh9BIt79I0toXjKHti0GjfRNmJCpRYLQGCVIZdiZ0K3s2
E4XlWCY1yi2SihBIb1eSgu/RYNhCaJkIjBny5P77uY9JFAffS7sXvxztiGEQQG6o
hgWNY2TxwNQVkIBujn3FtrGks89U9k/ssn9//5EDeYvB2Cz1/n2Q4uUwntO4XJ0s
1/5MVsTG4elq+C4DfpGqCookBRZRwSqEoILsaxI+MZNy6CgCt5okSeky9u3HZ6rO
J4+ggSPhhux0wAvuEROrqBQKbKc724CIRktw7kjxBhKGlXol7yF8OxX8fho/pbx9
U4kXso83U3uwcBD8bNSgqhxzB2SpSh4J3NbTZHrFobB3sbu4dkmaljgWQSrQyP7F
wM3XH3yPYy6iXfdi6Ip6RosUamdFK1IgUSTCmTrHHbbQgNU46XoPmj4qQDohF5r1
MB4dYCNbhk+7O8xvSr/QAfWS/pnvK4BXHYjDIzOsMtu3ST9cYUIgPWZP13hwLAbC
ABQS8Lm9WX1uNcdXeZQcLN/Zvz/4JIjiyQdW/to828T/O7zlvKA+BVZmei9inXlC
ky6h8JPFEEi2kk56ptWe
=oFhe
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
