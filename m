From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4] ARM: dts: sun8i: Add dts file for Olimex A33-OLinuXino
Date: Wed, 27 Jul 2016 08:21:46 +0200
Message-ID: <20160727062146.GA6560@lukather>
References: <1469450243-19138-1-git-send-email-stefan.mavrodiev@gmail.com>
 <20160726153352.GH7190@lukather>
 <30014119.IrjfP0xFry@linux-cigu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <30014119.IrjfP0xFry@linux-cigu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 08:12:29AM +0300, stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > > +&reg_dcdc1 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt =3D <3300000>;
> > > +	regulator-max-microvolt =3D <3300000>;
> > > +	regulator-name =3D "vcc-dsi";
> > > +};
> >=20
> > What is it used for? Is it really necessary to keep it on at all time?
>=20
> I think so.
> This is the supply for the MMC.

Then it's poorly named, and you should tie it to the MMC, and remove
the always-on if it's only used by the mmc. always-on is supposed to
be for regulators that shouldn't but turned off for the system to stay
running. Some MMC regulator doesn't fit that description.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmFL6AAoJEBx+YmzsjxAg6GQQAI4E0SKghzwx+NVVnIcdSuzw
xROXvsRSUYrHgjKMSUG7fvGXkRGbbOtPWx3Q/OluqW7Il2aipta+gPu1lrZlg70/
DvakhWm/ct5/feMFWrrqTzo7MqGjvxja+Uil0oLDvoKdfOnoI/CBiYTOcQZteoCy
MvAQe5suve5lkris+LUMoThJQ0Co0HzCSmtBHP5wWp9lmjsE6Ltqy6CKTv5Zi04H
g/2AGQqSzNL9RBMBmQvk7gfhlHELBOgmoTiSkBP3Bhx/JwlFYGhu90kASMK2FGbI
IKB907DljBxRAynv7I/diImT1k+p8JmtHAZ1D6vlA55+n2K28JY+P8ZhxDMoo4/s
zDVO3EIFhtGTdAEUAdRzBygwYrWajewL3M/u6ewRflc1zMw+XBasGhFPWrBh1mzF
BB/+ga5G5fp05J22ksOTr37o6KlVR62RL1f57Gj+feLeXvaMN5dXTEpJMa8utMlf
eUGYoUL+E2XGil8Lc3JBrGGhbDw82vwZwmKW7KVFCdXy4gMURq0xGlRUonKJE2oS
a/MCRtdvshrZLCqQTKrNAH4u+tQFoUoZEip1P4CWuIqjVicskZSZPyF04eot2beO
jSRSnKegH3Wbxe/4PLupANA1vHwnb0SaljtpaXX8q9zw/f9a01yjLxxw1oY4bAzx
oEF7lidrUAbVw84bSMYM
=588J
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
