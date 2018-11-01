From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Thu, 1 Nov 2018 12:04:33 +0000
Message-ID: <20181101120433.GC6425@sirena.org.uk>
References: <20181025074459.GF4939@dell>
 <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025114205.GC4870@dell>
 <33ea391c-aa6e-2709-6faf-4905e84229e4@opensource.cirrus.com>
 <20181026080051.GK4870@dell>
 <20181026203223.GC27137@sirena.org.uk>
 <20181029110439.GS4870@dell>
 <20181101102828.GM16508@imbe.wolfsonmicro.main>
 <71938ce2-00da-8ee0-c010-58c2670ee327@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71938ce2-00da-8ee0-c010-58c2670ee327@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 01, 2018 at 11:40:01AM +0000, Richard Fitzgerald wrote:
> On 01/11/18 10:28, Charles Keepax wrote:

> > So pulling this out from earlier discussions in this thread,
> > it seems I can happily move all the child device registration
> > into device tree. I will also try this for the next version of
> > the patch, unless anyone wants to object? But it does change
> > the DT binding quite a lot as the individual sub drivers now
> > each require their own node rather than one single unified
> > Lochnagar node.

> We went through this discussion with the Madera MFD patches. I had
> originally implemented it using DT to register the child drivers and
> it was nice in some ways each driver having its own node. But Mark
> and Rob didn't like it so I went back to non-DT child registration with
> all sharing the parent MFD node. It would be nice if we could stick to
> one way of doing it so that Cirrus drivers don't flip-flop between
> different styles of DT binding.

The basic concern I have is encoding the current Linux idea of how to
split the subfunctions up into drivers into an ABI - the clocks in CODEC
drivers is the obvious example, they might want to be in the clock API
in future.  If there's a very direct mapping onto individual hardware
blocks that worries me a lot less since it's more obviously reflecting
how the hardware is designed.

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlva69EACgkQJNaLcl1U
h9CNKQf+IE/F7jz5M6NjKEd2X3SqqJcqEP1+CXLXM3Ny1yMI272FpSrV6BiQczlY
Xjy0PP+Y+YsAHtyfaybjuf1s5E8iq8SN5XJk5Tw1pobUGjIKAnESL/0h3bf+jHtM
xXAxmCfZP8QjJ/Gy42AgUf7+UWjycAmBlwqecvsViEUWRVctxsGYRh7ZrYrs7kEz
/pjPMF2QG8mMkqSVGvMQuPtQrKL3Thd/IMlzUmMCF8hpKKjEYe6Yj3mKvOD4X7lx
dnxvYEnH5tlkHiaVQ7K3JIJKTftVPwxdXiTDj0RePWR9mMdbKXe6kn8f272Yyer2
fkAY/Ak3PYDPAH7NkXmYVp2xz1naAg==
=l5Yg
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
