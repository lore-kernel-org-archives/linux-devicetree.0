From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Fix Makefile target for
 sun4i-a10-itead-iteaduino-plus
Date: Thu, 3 Sep 2015 23:57:29 +0200
Message-ID: <20150903215729.GH31584@lukather>
References: <20150902201812.GC464@hansolo.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150902201812.GC464-dHPIJuKSOV0f7BdofF/totBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Josh

On Wed, Sep 02, 2015 at 04:18:12PM -0400, Josh Boyer wrote:
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Bcc:=20
> Subject: [PATCH] ARM: dts: Fix Makefile target for sun4i-a10-itead-iteadu=
ino-plus
> Reply-To:=20

Hmmm, something went wrong with your mail header.

> ommit 79ae3e66f8d (ARM: dts: sun4i: Add Iteaduino Plus A10) added a new

Missing opening "C"

> make target for the sun4i-a10-itead-iteaduino-plus dts file, but mistaken=
ly
> used .dts instead of the correct .dtb suffix.  This resulted in a build e=
rror
> like:
>=20
> 	scripts/Makefile.dtbinst:42: target 'sun4i-a10-itead-iteaduino-plus.dts'=
 doesn't match the target pattern
>=20
> when doing a make dtbs_install.
>=20
> Fix it to use the proper file name.
>=20
> Signed-off-by: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>

Apart from that, it looks fine, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV6MJJAAoJEBx+YmzsjxAggZ0QAMEF2xBm1ah38+Ng8kg5C4Pd
XtrTqo4oJYkJlh0dYvItZK3eDlHIKrtsRPZhqDiY0ZXEuNnKjv+fzIErv9eCIp1p
vkSEE5VpZzptoRpIPzHdhVXb0FStDKwibXmKFawRk3TU7KPoMpXWcgkEZu1F4gWd
HZskKa4wj397jhs4c8FpNuw4ewAUBfWUAV/8xJX79SrU0e6ET7REk+BVHhzZmJQp
+Hs4ODsg8Qis6EBBEZqhnLHKftIqTzbP3aqzNjeh8/EcP6p/TwFwJzGwErobRSk0
LCXfxK+Mr7OGQnTxoycZoRq7vbISyVLtsdmNJ/3PWiQSUplBpgz79oEgqKbE/sCE
anF+P2KTSvCC5+t267DIaLKmjkEJBd8Va6Ci9DICaQYQhF8gfm2V3FjIxTHocJKB
OxxWamv9LYvTXb206ApQi0UmF0D/a5U75thCZYJjK81WeftNxMQUeCBTD6lnj6dO
NhByB3wT0+w4Q5tp0hAuAKoxI7QrorUye7exZFmL9mxhVap4wUI0yKWKONHLrwve
rzFItZMIxuGa37TfORuii7/5XwVJo5BCU8zSQU24FeROruUMNvbKIcnRlZUpbwaU
OBmfdC3ViIJcMda0gC8MDtbAVXI8oABKnLFwzErWzDyDIDg3wz0sHZ8hyPc+gKHh
UuF9J6eGIfq70yLJ+Ssf
=MY6m
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
