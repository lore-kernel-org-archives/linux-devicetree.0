From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH] driver core: make deferring probe forever optional
Date: Sat, 5 May 2018 10:25:13 +0900
Message-ID: <20180505012513.GJ13402@sirena.org.uk>
References: <20180501213114.20183-1-robh@kernel.org>
 <f808a652-2454-941c-2fd1-60776fb353f6@arm.com>
 <CAL_JsqJvMyrKS4LsRC6fDus24Yg8U+VcrbNNvxtOXmKbrc8RAA@mail.gmail.com>
 <74d495d8-04e2-fb7d-7d07-0905fbc8a6cf@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74d495d8-04e2-fb7d-7d07-0905fbc8a6cf@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, boot-architecture@lists.linaro.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Alexander Graf <agraf@suse.de>, Grant Likely <grant.likely@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 02, 2018 at 07:49:57PM +0100, Robin Murphy wrote:

> I guess there's also the possibility that a single driver may want multiple
> behaviours, if e.g. if SoC variants A and B have some identical peripherals
> but slightly different pinctrl/IOMMU/etc. hardware such that A has workable
> default behaviour and can be treated as optional, whereas B absolutely must
> be controlled by the kernel for the consumers to function properly, and they
> *should* defer forever otherwise. I think that would pretty much demand some
> sort of explicitly-curated white/blacklist setup at the subsystem or driver
> level.

Different board variants, and possibly even different bootloaders might
also be an issue here - a vendor bootloader might do pinmuxing that an
upstream bootloader doesn't for example.  In some cases the pinmuxing
even depends on the boot method with things only getting configured if
the bootloader wanted to use them.

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlrtB/gACgkQJNaLcl1U
h9D36gf+NGCs2L2oQLDrkfirjYtQCzWyoyDF5AUTuptG2p4w8gOd01NKW+x3vm8j
FM8pDZBJ07oKXWAolGFS/qfEjrhsr652zHV+z5YsWrBVGNIWMXHcIRetvgsYCtAR
ZAV8Pa9Va/JP2OlErC4AxhZCyTs3NScwC7g0BqU7bPpSZiTjJNKYuGa+jBXVyJzz
0NDuU+bIoHup9Cq+NC3CTisxyZ0Oz5lp7gOxrdWGKjNay29+tiaOUZKC0U4iGq5f
TYfXBqUnWWuUkauJdSKK0NvlVdX2gN4cWstepfOlcYYOLqq2XAZp08zRWWOGZHGp
rfd1TTUV7q+ADx05Jjx/U35/P0OUXA==
=JAMb
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--
