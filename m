From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: ACPI vs DT at runtime
Date: Thu, 21 Nov 2013 18:53:18 +0000
Message-ID: <20131121185318.GG8120@sirena.org.uk>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <20131115175241.GB27174@quad.lixom.net>
 <20131119113015.GH5914@e106331-lin.cambridge.arm.com>
 <20131121162944.F087FC406A3@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131121162944.F087FC406A3-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 21, 2013 at 04:29:44PM +0000, Grant Likely wrote:

> We are pushing a lot of boundaries and doing things on ACPI that have
> never been done before. SPI, GPIOs, Clocks, Regulators, composite
> devices, key-value properties. All brand new territory, and the Linux
> world is driving a lot of it.

Indeed, and at a subsystem and platform independent driver level we do
have the x86 embedded platforms working with ACPI right now so Linux is
going to need to cope with some of this regardless of what people end up
doing for ARM servers - Intel are sending me patches for ACPI support in
ASoC for example.

> Personally, I think the issue of ACPI support should be taken on a
> patch-by-patch basis. A lot of the things that need to be done are quite
> discrete and fairly well contained. If the patches don't look that way
> then push back on them. For the parts that look ready, go ahead and
> merge it. Push back on the ones that don't.

+1.

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjlabAAoJELSic+t+oim9y98P/3ULYqBPIn1nM+h3jXBpQ8yE
+qX7Sawi4P3/55PcKrIDMsyCm2oK0r6emr0cqZnLg8cdmov7i2lZOR9dfho4GJ6q
P8BLqOmbllvGu/+cteeQuHGDyeNrKFv+Lct+KOihZBeVLl7AnWI6UYDvP6OQ0tJk
lsKbCds+0pOdpcjMJbjgBSrYCOsAJ1Udagkqk2QGB+eDr101ApeabS9gCUCrEqw5
nrH4VTJ0l/ueQnF7fA0vbVP3hyFN0keyvGAhPsirj1pnx1WzkqAU4py5EcjIlau3
/UWKYVIQDYl/+y3/dOGhA99i4yA80hT/Y3dKYrRDRjcINZSwTynbptDdpEBfK6Nq
1XIT85RiKjFzSTBHyOUWnr5R5cOMLwklIgjvnGNrZiXe3jpUFnOnY1QbQC8F3JSv
lBDkKXrGn2DaWoMqzyP+i/X4Yq96Hiql+frK/ZrzCaaMogpiCd4+N6rocy1f6NXn
hVfYTuQl0BkJqoUcnQrnKl9RTIWFEmQr/vxWHPzgR20SNJIiOrtP+p5vmOehi2R9
evpl6oG5g/hSlXtcvTMEGtPt6ZIIvow4UxwCQO2t0jeAkJCw/Z/6rUVsstrxA+nT
YZbskcs7nZhF3D5NHLlfwH9Xh80LTYtV72yGHVeG/NL8/17UkhO+bCwCboYsR3yJ
k0xzGGuDuh1FsQagXqXL
=BHWR
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
