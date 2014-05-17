From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] ARM: sun6i: Switch to enable-method for SMP
Date: Sat, 17 May 2014 18:42:35 +0200
Message-ID: <20140517164235.GM29258@lukather>
References: <1397847713-28418-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DMotDPdpQlD4ewOK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397847713-28418-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--DMotDPdpQlD4ewOK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2014 at 09:01:48PM +0200, Maxime Ripard wrote:
> The recent introduction of CPU_METHOD_OF_DECLARE allowed to deprecate
> one more fiel of the struct machine_desc.
>=20
> Switch to it for the Allwinner A31 SoC.

Merged the whole series.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DMotDPdpQlD4ewOK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTd5F6AAoJEBx+YmzsjxAgsnAP/35yZ+wVqJKh5eiuCqzaakVA
dPzmBDIkpHTdcJU+mRkwSup/3p/jgXRJdxOgaLiuCrSvjlEThFNXqEA26+lKjUuX
rnZ8j+hLf5tl8vtqdTjG3TK8kjkAWGq2K5O+rGQvhMFDOEeE404+1YrAyqBf7esM
fbW7bHQ0aie+9wf1SKSeg29t7I2p3thOZLLwKk6p2P0OUoNaGvbBQ2h1jM5KCNJ8
FKLulTWL0nDcYDB7HCdPlb8rUPQu7IFFzcDnnCBHeeEaks/UyVmG6XPaDtkh08aX
yY+svZrI8AuCJRRth2dQf2Zo1LywC2QFczd27R2fHN8bHcuBGWDHsxiwCKuOOOTN
S5McSy+0IguUWSvsuMKqS2kz5QS0eiktt78t59ptRNEJbrhHk9m/fuSLF84kF4vG
C8hGK0XYz5YkaIg3c99p5jGv39RwLRje3J5zz8s7Dpr5tCOQWgp1Eaz+cUj1zSFU
emAMzXOmib9YpoAjxXFGna5tn6TE2597GBU8yBHCC8clYcrKwAsqQovZl9ZsXZHZ
RcD6p0EJ329zljHuaDjxq9h8UtIRD9fh3tczOD+s8+KlBMwBH+PhPtVXETIJFdtZ
QFDnXvdJpRGSZwltcR07cDrxZzWktQV8MiixUAyhX2/5L7v1nnmVr0tn4SdUN6H6
ttgqt83besZYMyiLq7R/
=V/ZL
-----END PGP SIGNATURE-----

--DMotDPdpQlD4ewOK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
