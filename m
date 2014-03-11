From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ARM: dts: add bcm590xx pmu support and enable for
 bcm28155-ap
Date: Tue, 11 Mar 2014 11:50:54 -0400
Message-ID: <20140311155054.GL25092@beef>
References: <1392765432-9111-1-git-send-email-mporter@linaro.org>
 <1392765432-9111-6-git-send-email-mporter@linaro.org>
 <20140219044458.GA2669@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140219044458.GA2669-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2014 at 01:44:58PM +0900, Mark Brown wrote:
> On Tue, Feb 18, 2014 at 06:17:12PM -0500, Matt Porter wrote:
>=20
> > +			csr_reg: regulator@13 {
> > +				reg =3D <13>;
> > +				regulator-compatible =3D "csr";
> > +				regulator-min-microvolt =3D <860000>;
> > +				regulator-max-microvolt =3D <1440000>;
> > +			};
>=20

> You should not be setting voltage ranges like this in a .dtsi - you've
> no idea if these voltage ranges are in fact valid for any given board so
> they can't be set safely.  In general I would not expect to see any
> configuration at all for regulators in an include file for the chip.

Agreed. I moved all constraints where they belong in the board-specific
dts.

Thanks,
Matt

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTHzDeAAoJEOfTILNwq7R4JsIQANKk2E4HGfKUKJw5A3Z7NnbD
lXt5wGzbGgqyQOKv2oMDu5GB+Eeq48j2c4CHvzVUc/t3xo89CJ/OegCVwRZe+gQ7
LweWGNwrwiuXeiaDQmn4pS6+T4ag1icNVx3LM8/4eKpgfJdzVs3eaKFv0FjxTKEg
zNt6FhwbSIGagLCBybMLz9Sp2Z09eAB7/D9n3s5ZtR04qyb0XO+LaT+hwktCoG5D
rwq1OWW1ypKBZjGMMuiqoY1RR5UcvPLKaZdD5SYBvbumyjPhIUoPuEbnJYs5wTKJ
54hZRHmPAdKkMddBivCorztYino5JsBfAdurLobgYWZqc5D3LfLxUeOYKGkYj0M+
q9FYSmP1+shH1jd9pVt5e30wkfwu1Y+CC7sR/xyTw+aNkB3eGQtka9Us13UWoQ1y
a6O2ib5Ck3fProQMVjVIbLxQABsFokEXG+X7MzqTsQ/1+FdGmCfPjzrWjiQGacFv
y2WMksFJDALjTv8oJ3ddzxqk3SCgHa2GzcSTFsiq1fVNDzqevz1ETXGZwof5+YXP
+dntZidIKrySOg/l1U8vyiSzLsvLp35HeaaHj1UdeSpJ0y9j7TDwZXQQBuSo0upZ
H5H5HrOeJUh+Y0QhYhuPYcPo6daxT03IwAQ40dFfrlGEl5WdUlhKY65RsTy2cw67
TQvjHQf8WACr31MxmQVU
=RGda
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
