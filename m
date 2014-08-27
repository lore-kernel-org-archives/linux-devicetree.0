From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] regulator: add driver for Ricoh RN5T618 regulators
Date: Wed, 27 Aug 2014 08:25:25 +0100
Message-ID: <20140827072525.GR17528@sirena.org.uk>
References: <1409091237-16722-1-git-send-email-b.galvani@gmail.com>
 <1409091237-16722-3-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u1od66ChgEppm9WP"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409091237-16722-3-git-send-email-b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--u1od66ChgEppm9WP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 27, 2014 at 12:13:55AM +0200, Beniamino Galvani wrote:
> This driver supports the 3 DCDC and 7 LDO regulators available on
> Ricoh RN5T618 PMIC.

>  drivers/regulator/rn5t618-regulator.c |  143 +++++++++++++++++++++++++++++++++
>  include/linux/mfd/rn5t618.h           |   14 ++++

This is fine but I can't apply it since you're patching the MFD header
which you added in the first patch.  It'd be better to include those
changes in the first patch, making the second patch independant.

--u1od66ChgEppm9WP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/YfhAAoJELSic+t+oim9VUMQAJ5PilvsShTs6PycuR9zTE8V
cD/MTuo0RGBCyn00HMiE61CfZiwPZaQtzzKOS/52eU65uc/gfZDXLkqVF4niUUOm
zARbBwdBlHnIx48rHs2g/gwg6A7zQG6Wud+m+0OsDnSPwy2z5mjwRckx/P/pZAin
VJaU2BlRBjIyvzyTJd21CsENAC3Z2mVWP5Xd0sCcoGlGZzSqNGvhxBp2jsMeJ+hQ
YoEIbrMwKt6d0Wl7H7KslY5YWRDZ+aGIgMaYAa5fNrWA8dBg/fGjPUkrVUNVyMVx
5GPknhnBqngl1GR7mnRwAuZZ9Ndu3EDBVcVNMDawtmLHA0l42xJqyAMqlbgn+u5n
xbmN/aSv4MLgTixAX44T+LvX3vvptBgaFFhFUoAeeULOvym0xozXO8R/C+cj/8we
Cf3Rj8bnQV03T3WH41++D7po6C8tMSyQl5C8z2oES3abZzy80HVYnW5BzXab1PnR
hfLSp7W/KDLyObFXf33aOh/W4rmywPJc58I3M0T2P84rzCYtWFWh8eTuv4zuS1KH
hzVDq2/pSTUJu4IA5yJPKz5E6Q6hshDeJCVYb6mAXk59zqgAF4dnXue5HyngjvcV
z3xvZr+T65DwTDHY38jPXVIuIo8lOl7QZN1XYtu+ku5iTiHb3glMRT0MnOh2OwXK
zY33P6OWWM0MNhrRCylE
=pe5C
-----END PGP SIGNATURE-----

--u1od66ChgEppm9WP--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
