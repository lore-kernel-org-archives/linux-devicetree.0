From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH 2/3] regulator: Add support for stm32-vrefbuf
Date: Wed, 30 Aug 2017 16:02:49 +0100
Message-ID: <20170830150249.5sofmjz3n2skzucq@sirena.org.uk>
References: <1503925133-30722-1-git-send-email-fabrice.gasnier@st.com>
 <1503925133-30722-3-git-send-email-fabrice.gasnier@st.com>
 <20170829185719.h5fxvzmxbysyxwml@sirena.org.uk>
 <fd883990-cc87-f8cb-ebe7-5c4c4e51d6f6@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zpkap4nhc5pq2kma"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fd883990-cc87-f8cb-ebe7-5c4c4e51d6f6@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--zpkap4nhc5pq2kma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 30, 2017 at 11:11:24AM +0200, Fabrice Gasnier wrote:
> On 08/29/2017 08:57 PM, Mark Brown wrote:
> > On Mon, Aug 28, 2017 at 02:58:52PM +0200, Fabrice Gasnier wrote:

> >> +static int __init stm32_vrefbuf_init(void)
> >> +{
> >> +	return platform_driver_register(&stm32_vrefbuf_driver);
> >> +}
> >> +subsys_initcall(stm32_vrefbuf_init);

> > Why is this at subsys_initcall()?

> Several consumers depend on it when it's being used, among which: STM32
> internal ADC and DAC, but also external components. Purpose is to ensure
> it's ready before these drivers gets probed, instead of being deferred.
> Is it ok to keep it ?

No, that's not OK - just let deferred probe handle it.  The same thing
applies to all regulator usage.

--zpkap4nhc5pq2kma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlmm05QACgkQJNaLcl1U
h9Dkegf/X4UVydYZExk03RMx5W/svCpEBM/6fvoNdIOkKC4pG8z8tkq1gHDiqYye
MmVSv5uqhqwksmDXX1xTePU8ODstd03cMuRVG6ED+ivN3ZDSJI1JOw9+PjLaZgFZ
ngGUeir7mpkYyO9dYPNH5Swv/6mRZNypnIfw7ScmWKzQuEwGyL8vZ7Dqbz3GRuKo
5saHsDdw3YkHzs5U8FsScVdgjy1NpxrinIsv96/iZtU0Ef9TSQFIrH2VOIkiJ3FU
mTb+eWvH3H3Ewb5loOnnA5AwEguqpveV0TZenb88rW/L6VHr58+J+SryaxbTzcf9
+g6p6kQAFpLOZIurDHPSpI+hOgS3rg==
=35JI
-----END PGP SIGNATURE-----

--zpkap4nhc5pq2kma--
