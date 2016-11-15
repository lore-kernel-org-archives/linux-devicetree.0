From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: dts: sun7i: BPI-M1+ USB support
Date: Tue, 15 Nov 2016 18:42:37 +0100
Message-ID: <20161115174237.ootkbvtfumt6mqy7@lukather>
References: <20161115135106.438-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f4s3yow4m6tpairx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161115135106.438-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--f4s3yow4m6tpairx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 15, 2016 at 09:51:03PM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
>=20
> These are the remaining patches of my BPI-M1+ fixes series from July.
>=20
> Changes since v1:
>=20
>   - Split out USB PHY enable patch.
>=20
>   - Dropped custom OPP table. Tested the A20 default one with
>     cpufreq-ljt-stress-test and it seemed stable.
>=20
>   - Dropped voltage range for cpu supply regulator to normal 1.0V ~ 1.4V.
>=20
>   - Dropped pinmux setting for OTG ID pin.

Applied all three, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--f4s3yow4m6tpairx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYK0kFAAoJEBx+YmzsjxAgXc4P/RDxqzxdyMmWv0yv33HVOR4d
QSZinHeZwbE1e1iEPQvUxSANufOvkGg9Vs38jXzG0Po8XhgTiVNxKv9sEKZzoujw
yoSlAjFnRR6oxG2BmOv9War+fpbg2k9jQTYCNI+aHTlMK2AjKAoGQXaQY11/lBcW
RC/JnGRMFzlMjTGvNeajnuUpUBRsqtBwGzIOekVCJ1evviijOwrM2c94wasOGu59
uVSTIWOXRtGsaY8TUZqakTRjg7C1xruwR+V6uOMS6cVsK/6BrLEryFQhGsxi63KU
7MlOh50IuTp8/SCgMyLRbv2TNA4h91YVsBWWRvHWBUKaeZZ3n5Ynyw/IAnyVOo8y
QnHlCIS4p4EvZsYpP4Z6vzCuXd32r/jmZjCgWPZ3XjQdp6pijPeaoal3ZYZOhcsZ
NkI1fLbnl4/Qknxgcd06ggavocXMCs0WHqnW203r0cUA8BSTPEGN9Mbk0VumnNJn
xH4KJGCDuJ1rJc99K0HSwUHkTxLpKrRG6n6xZrpM2pLCIW0vVfegAQYEViDUosAr
dAhNyzsROWTdNdV6Yvy1SGquNXr9p3j+D4dzFa6ofRHgYPVU/M3HUSYbUUkPgDl/
0czfc+r+KwpeU1JodKYqlMLb5r3n7RZr9vPm+jU+cCFykf2TeBpz2J0apfd8+P0A
aBvoXOwc1Bv2QjgkryTP
=gtQV
-----END PGP SIGNATURE-----

--f4s3yow4m6tpairx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
