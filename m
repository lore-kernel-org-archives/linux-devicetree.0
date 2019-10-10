From: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
Date: Thu, 10 Oct 2019 14:51:34 +0100
Message-ID: <20191010135134.GR2036@sirena.org.uk>
References: <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
 <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
 <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
 <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
 <20191010120337.GB31391@ediswmail.ad.cirrus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/o1eWYFqMAfOorY1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191010120337.GB31391@ediswmail.ad.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, spapothi@codeaurora.org
List-Id: devicetree@vger.kernel.org


--/o1eWYFqMAfOorY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 10, 2019 at 12:03:37PM +0000, Charles Keepax wrote:

> Usually aux devices are used for things like analog amplifiers that
> clearly don't have a digital interface, thus it really makes no sense
> to have a DAI link connecting them. So I guess my question here
> would be what is the thinking on making the "smart amplifier" dailess?
> It feels like having a CODEC to CODEC DAI between the CODEC and
> the AMP would be a more obvious way to connect the two devices
> and would presumably avoid the issues being discussed around the
> patch.

Or is this a device where for some reason (consistency?) there
really is no DAI and someone has decided to make an analogue
amplifier with a soundwire control interface?

--/o1eWYFqMAfOorY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fN2MACgkQJNaLcl1U
h9BJVQf/VmhKdvjGO+iSItUddcgbReAtHb/ahdMnhBgNm54DlfDRuvW2kr32nZDa
6nV6JI0UShGgIrN50nZeXoOTJqJudBkKPeN3bA4qdH09K/3KoUUccKcWFF9XGUNi
C/Ej7gQs/QrIvb2Cs4khYDg3TTzBRQYZgS59UYO0cr/5wQml5uMYCRjwbPTQGkGE
Z12uk1POwiqB7/+PtYf7Il4yn+ijyQlVF51ZUGIRGMDGWQMHqXwGg/pc9VX6bAM1
SJ2IDQ6L+pMpu7Jwyq9ymbTRf94gt+yfjLbLR5lUzX1mAC8CSy9CeSb+d7c3jx61
m3I30E3ocl8sxR6JHqmUUqrsbEB9hg==
=QvNW
-----END PGP SIGNATURE-----

--/o1eWYFqMAfOorY1--
