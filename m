From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/1] regulator: max8973: add support for junction thermal
 warning
Date: Wed, 6 Jan 2016 12:37:35 +0000
Message-ID: <20160106123735.GX6588@sirena.org.uk>
References: <1452060922-24426-1-git-send-email-ldewangan@nvidia.com>
 <20160106121857.GW6588@sirena.org.uk>
 <568D064A.8080609@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QHp3Wr1K3N9pKO2V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <568D064A.8080609@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--QHp3Wr1K3N9pKO2V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 06, 2016 at 05:49:22PM +0530, Laxman Dewangan wrote:
> On Wednesday 06 January 2016 05:48 PM, Mark Brown wrote:
> >* PGP Signed by an unknown key

> >On Wed, Jan 06, 2016 at 11:45:22AM +0530, Laxman Dewangan wrote:

> >>  Enhanced transient response (ETR) will affect the configuration of CKADV.
> >>+-maxim,junction-temp-warning: Junction temp warning on which device generates
> >>+		warning interrupts.
> >This needs to specify what the values are - it looks like it's raw
> >register values but I'd have expected from this that it'd be an actual
> >temperature.

> I tried to roundoff to the next higher threshold when supported value (120
> or 140 degC) is not provided in driver. But it is fine to me to specify the
> possible value setting here and DT binding doc. Will do on next patch.

I don't really mind which you use so long as the documentation is clear.

> >>+-interrupt-flags: Interrupt flags for registering interrupt which can not be
> >>+		passed via interrupt properties.

> >Why is this being specified and what are the values?  Most devices don't
> >have this...

> I have two different design with this device:
> In both design, I have main PMIC like MAX77620 and two MAX77621.

> In one of design, interrupt from MAX77620, and alert from both MAX77621
> shorted and going to Arm GIC controller. On this case, I need to register
> the interrupt as SHARED interrupt. This property can not be passed via
> "interrupt" properties from DT.
> That's why this flag is added to support this.

If the driver supports shared interrupts it should just register as a
shared interrupt all the time, there is nothing about shared interrupts
which requires that the pin actually be shared.

> Now, by default, if I register the interrupt as SHARED in driver then it
> failed on second design as GPIO does not offer to register as SHARED
> interrupt.

What makes you say that this would fail?

--QHp3Wr1K3N9pKO2V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWjQqPAAoJECTWi3JdVIfQMGcH/2vo/GLOKWqOwfZejECnEvbY
UCc9V/0XXfqHvJwIC1TjsIs4YAWN+jTI+I39bSdb+tR6BhsB+xYdUu3QDTyUrr4I
TLyCQ1840Fj9c03G0+wTrOcU7oAOX8dTSJGNo7X/9+2qd2yy7ilxDEh2fSLhPLYn
okL+itQ3kUkCfLSk9EwVeMvdRb2pjosG9UoV4GURepulKxGSOLVP7AEyBNCQKX28
bZ64rosBjE9uOXGCpj2KGQA+Ru7DYDuCmO6KjQ9BXw0R7xkUspAa/9JE0sxApv+h
qBel6lGiNgrr7JwqV6V5tWZ5X8HXlDHE17FTHUrOQ/lmK53dZpY06m/+jQUUXbA=
=9ewV
-----END PGP SIGNATURE-----

--QHp3Wr1K3N9pKO2V--
