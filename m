From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] regulator: max8973: add DT parsing of platform
 specific parameter
Date: Mon, 20 Apr 2015 22:19:07 +0100
Message-ID: <20150420211907.GP14892@sirena.org.uk>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
 <1429534457-15515-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i7KxW38SoMauyveo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429534457-15515-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--i7KxW38SoMauyveo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 06:24:17PM +0530, Laxman Dewangan wrote:

> +Optional properties:
> +
> +-maxim,externally-enable: boolean, externally control the regulator output
> +		enable/disable.

I'd have expected this to be enabled if a GPIO is provided to do the
control rather than having a specific property for it.

> +-maxim,enable-falling-slew-rate: boolean, enable falling slew rate.
> +-maxim,enable-active-discharge: boolean: enable active discharge.
> +-maxim,enable-frequency-shift: boolean, enable 9% frequency shift.
> +-maxim,enable-bias-control: boolean, enable bias control. By enabling this
> +		startup delay can be reduce to 20us from 220us.

It looks like we should be implementing the set_ramp_delay() operation
here?

--i7KxW38SoMauyveo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVNW1KAAoJECTWi3JdVIfQ41EH/0J25mYNS2GrDCQj7xGuhWDk
ExSWKkOpq4UIftf4HVwLchT/JOZlTBKp5NExDHGKgXuatcjz/jz8CjNnVd45DHsv
b1DQdXl9rPKEzTedXcLAhTSQ1LYOTzrdi/BFoQOm/vGExf1l2nD7h5aAFpT5Qzua
kTawWWq+lzaKry/7EFFXtWLpWUpRusKPXtCS4BxLHcgktCfv2Ku8jD72z3TrfvGf
cjhzDzOndfqdS1O7gt9wVzGB2MB9+XR5WLhqkkjFu3ZYpOtwTJmSJXD7MaRw7GyW
5KzErgx8KdVSDxMFBG4SbMJo0YJk2B95Fszgj47ug2s/Jnb7oFjI4q6gZM3CDTs=
=Sy4+
-----END PGP SIGNATURE-----

--i7KxW38SoMauyveo--
