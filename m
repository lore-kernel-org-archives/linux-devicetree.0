From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Thu, 31 Mar 2016 09:51:45 -0700
Message-ID: <20160331165145.GF2350@sirena.org.uk>
References: <56D5111E.6090606@nvidia.com>
 <20160302033833.GV18327@sirena.org.uk>
 <56D65F7E.3090907@nvidia.com>
 <20160302043506.GC18327@sirena.org.uk>
 <56E81103.8010903@nvidia.com>
 <CAJAp7OgUjN+Ymh+vM8g9Wex0JDRSOFkvpTKHm8fXYkDgTQ+0Tw@mail.gmail.com>
 <56ED0F58.7060005@nvidia.com>
 <56FBD4A3.7080208@nvidia.com>
 <20160330181623.GQ2350@sirena.org.uk>
 <56FCCC60.3080303@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6u7lpXof/8C/+w+8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56FCCC60.3080303@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn@kryo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gandhar Dighe <gdighe@nvidia.com>, Stuart Yates <syates@nvidia.com>
List-Id: devicetree@vger.kernel.org


--6u7lpXof/8C/+w+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 31, 2016 at 12:36:08PM +0530, Laxman Dewangan wrote:
> On Wednesday 30 March 2016 11:46 PM, Mark Brown wrote:

> >>Like to add property as "regulator-device-ramp-delay" which will be used for
> >>PMIC configuration and regulator-ramp-delay will be used for delay
> >>calculation. This is case when advertised ramp delay does not match with the
> >>platform measured ramp delay.

> >Why -device?

> This is device specific and just to differentiate with regulator-ramp-delay
> which is the platform specific.
> May be there is some other good name. I can think of other name as
> regulator-typical-ramp-delay, regulator-advertised-ramp-delay etc.

So there's already a property you want to set, why are you not trying to
set that property?

--6u7lpXof/8C/+w+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW/VWgAAoJECTWi3JdVIfQrYEH/3N4o/8S6vh/YkE8DWAX6tKp
NxK8RrxkwoltbFrVAIviSxZeXsZkDSHy1zpAzk9+9LXrAxYPBCxvS67N8i86etOV
uz0KLrk5auozBjaXc1vMK3aLdmc4qEiv6g8GXOO+58S4EvR2+dW6tapRJ4RuemEQ
IPvyWsWenPnaDWIZqAa6mncN5XiVbL9SVXUNwHw8T0Io+JN0xhoniC0YCZh7Sbrz
AqsgO7d6Btfqr3WC4bbIjl6oStNDXtxryZzpIf4AMBj7uT4agkA07viXybXIj+2S
EM/Dm2MBmO/gnQp31h8gGyBXKOB4SQCyWv8pZ+AVuOUndGF1Ie2L8KS3MoyXXX8=
=Cx4U
-----END PGP SIGNATURE-----

--6u7lpXof/8C/+w+8--
