From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/8] ARM: sun8i: a33: Mali improvements
Date: Thu, 16 Feb 2017 19:45:24 +0100
Message-ID: <20170216184524.cxcy2ux37yrwutla@lukather>
References: <10fd28cb-269a-ec38-ecfb-b7c86be3e716@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1589264097=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <10fd28cb-269a-ec38-ecfb-b7c86be3e716@math.uni-bielefeld.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Mark Rutland <mark.rutland@arm.com>, thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org, wens@csie.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1589264097==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mwgnzn5pgd7q2te4"
Content-Disposition: inline


--mwgnzn5pgd7q2te4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 16, 2017 at 01:43:06PM +0100, Tobias Jakobi wrote:
> I was wondering about the following. Wasn't there some strict
> requirement about code going upstream, which also included that there
> was a full open-source driver stack for it?
>=20
> I don't see how this is the case for Mali, neither in the kernel, nor in
> userspace. I'm aware that the Mali kernel driver is open-source. But it
> is not upstream, maintained out of tree, and won't land upstream in its
> current form (no resemblence to a DRM driver at all). And let's not talk
> about the userspace part.
>=20
> So, why should this be here?

The device tree is a representation of the hardware itself. The state
of the driver support doesn't change the hardware you're running on,
just like your BIOS/UEFI on x86 won't change the device it reports to
Linux based on whether it has a driver for it.

So yes, unfortunately, we don't have a driver upstream at the
moment. But that doesn't prevent us from describing the hardware
accurately.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mwgnzn5pgd7q2te4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpfNEAAoJEBx+YmzsjxAgOqQP/0aWELdbKTPpplGHgwAUT0mf
zUVVBrPG9OLld83v9xl9rED7+0g+QNh9I34Sj+KVxMJZw0oe/pshzAbRQcuRBbZT
YNERyUbSIb8WDncboZVY1nSMmZp7HJENzvKwI7vYds1qy5nRRbXuSt8HHf1rCO6H
a6i/TkuPPJZXlK3pdNCoPQLDAZXQ7/6x9tyaQEnmyBH4Mjp7B9dbCT9Q6Lp0ASA7
Bg+oCnr/QBoSEdNpLY7hwqVtUgPpmxjdhFqiSo5w6bQr0NVlngtb6tZ1qJCtEXpa
BU+5l5Gbw9FQHbnMqut66q8ynsg4czpWTnY0sMclTEJVEiHdA7JJDUz+mIgMloyb
NItlJhrL0P+Z9rwnsY/EzL4A4I8VYwV5C6PBel9VZOCtsid8EaHeFgAGDXq2s2ZJ
xH85oOhvtcNGspAEU4kT7CPO0HYt3h2XVfR3m73U3+5rVzngnbinTevu7fINHesc
2q2VW6Hrt5XaooBV71tBguxMatoemueX95FTzx4bsEGNVHftM7hchuBWWkLK1H6E
taY0Bg9euE2r2WKmv5WXobRIktuu9Y5yKFJb2yHIdhp8csIEw+RgJfMPGAuHQKNu
4VSaOfnWFkiZAexSnCRoUSYL+RcOib1tH0jW7L76I6KZbfKp3BAljrjpQZeoATs7
VEW+VuPwXEW79Doegrux
=N7Gb
-----END PGP SIGNATURE-----

--mwgnzn5pgd7q2te4--

--===============1589264097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1589264097==--
