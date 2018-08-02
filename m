Return-Path: <SRS0=Mhmi=KR=sirena.org.uk=broonie@kernel.org>
Date: Thu, 2 Aug 2018 12:45:53 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] spi: pl022: Add OF binding to disable DMA usage
Message-ID: <20180802114553.GK9117@sirena.org.uk>
References: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
 <20180725170644.GE6315@sirena.org.uk>
 <150e4a91-e607-ee7c-20bc-9ed81019f1da@nokia.com>
 <20180801103949.GE5509@sirena.org.uk>
 <a63a2c81-e624-9a7c-172d-c26159696fae@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwbb4r/vLufKlfJs"
Content-Disposition: inline
In-Reply-To: <a63a2c81-e624-9a7c-172d-c26159696fae@nokia.com>
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--rwbb4r/vLufKlfJs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 01, 2018 at 12:47:01PM +0200, Alexander Sverdlin wrote:
> On 01/08/18 12:39, Mark Brown wrote:

> > I'm not 100% clear I follow what you mean by bus scan here but I *think*
> > that sounds about right.  The channel request/release could be factored
> > out into helper functions to minimize duplication.

> Rob has an opinion that the driver should only claim the channels explicitly
> specified in DT. This sounds about right, but this would be behavioral change.
> What do you think?

If it results in platforms that previously used DMA not using DMA that
doesn't seem like a good idea.  I'd have thought that if we didn't have
DMA configured we'd already not be able to request a channel TBH.

--rwbb4r/vLufKlfJs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlti7vEACgkQJNaLcl1U
h9CDwwf+Lfu/ss/MVmxLfIaBismkxnVGehLaBPKsBX6W6YPxBqEgMvgEpZqaOKqV
mn4nf5iaOsSHNOGwy4T5T3m074JnUj48bpIyjnBjdBceF/WvWsBQyrx2FxwG50+y
u5CqfY35lqPcV5sXN0pyOcy3fLBjtACsSOwnW7XGDVbrVFiQbDuMNorYTHiNixwx
PrzkZTXdmSOc3WaFX9KL3hzKJQ/g/GMsAhINvEine0VkGJrerQkkLRLVKyY91lXJ
y6Jv5tNv0Ho8M4qYvxvfoDbrDOP6KXj37Br1JZqBEME/idh22+0j/1EqMYXiPQzU
aIs9BMQtn0KlXmgK6nTwHRw5xdSfnA==
=ikhM
-----END PGP SIGNATURE-----

--rwbb4r/vLufKlfJs--
