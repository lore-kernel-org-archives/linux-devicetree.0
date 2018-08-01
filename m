Return-Path: <SRS0=tWHS=KQ=sirena.org.uk=broonie@kernel.org>
Date: Wed, 1 Aug 2018 11:39:49 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] spi: pl022: Add OF binding to disable DMA usage
Message-ID: <20180801103949.GE5509@sirena.org.uk>
References: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
 <20180725170644.GE6315@sirena.org.uk>
 <150e4a91-e607-ee7c-20bc-9ed81019f1da@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Content-Disposition: inline
In-Reply-To: <150e4a91-e607-ee7c-20bc-9ed81019f1da@nokia.com>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 26, 2018 at 11:04:24AM +0200, Alexander Sverdlin wrote:
> On 25/07/18 19:06, Mark Brown wrote:

> > this or if we shouldn't instead be looking at improving the driver to
> > work better in systems with limited channels, for example by only
> > claiming the channels when it's active (since it can fall back to PIO if
> > it doesn't get them).  That might be too heavyweight though, possibly

> yes, this is an option as well, but at the time we need to take this decision
> the bus scan has not yet been performed. We could scan all the devices in
> the DT and check if any of them requires DMA. This would mean, that
> probe() of the PL022 driver will include similar code to the bus scan
> that anyway will happen later just to take the decision on DMA usage.

> But I'm fine with that. If this sounds better than new boolean DT binding,
> I'll send another patch.

I'm not 100% clear I follow what you mean by bus scan here but I *think*
that sounds about right.  The channel request/release could be factored
out into helper functions to minimize duplication.

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlthjfQACgkQJNaLcl1U
h9Cs3Af/Svb2xLnwyZWkAc/SdIwYy6CVbec1+ONDDwSF+JH8c+0VaskO6JLs95gA
i4w7tidTrWu2KA/0oRBR3h/m7Hgxv3u7dfjF2hS6M/b+z+sXdTn9GJ1nhfO8/FOk
3qEFlrkM4QcP6/1LX9FScnfW4qkSoVusxrmuWzKhAL69B5DPuV/jZojK1qE8eWby
US1ZlVKSQpV7oJo/Ua5W5VOJIBTu9Wl+/dp3+FOOzOALXodnbv/On00fMQVD71fF
1kMyBNQ2fRMlbXAkMasykLAs6PapyEKOi9MH2zkaUM9YW7SrKrV5vYgS5hGQRHSG
ClimEAHbHcp+3bSSffNTz+LLc2hGjg==
=5ska
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--
