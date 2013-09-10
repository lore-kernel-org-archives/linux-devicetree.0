From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: core: add support for configuring turn-on
 time through constraints
Date: Tue, 10 Sep 2013 18:38:30 +0100
Message-ID: <20130910173830.GA4708@sirena.org.uk>
References: <1378811888-2268-1-git-send-email-ldewangan@nvidia.com>
 <1378811888-2268-2-git-send-email-ldewangan@nvidia.com>
 <522F3691.3090805@wwwdotorg.org>
 <20130910165153.GQ29403@sirena.org.uk>
 <522F5815.4070109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <522F5815.4070109@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, rob.herring@calxeda.com, mark.rutland@arm.com, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
List-Id: devicetree@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2013 at 11:34:13AM -0600, Stephen Warren wrote:

> I notice there's a regulator-ramp-delay property, already documented
> right above this new property. Is this a conflicting usage of the same
> term, or should that existing property just be used in this case too?

That's for a ramp between two voltages rather than the on/off voltage,
though I had forgotten about it.  Hrm.  enable-ramp-delay?

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSL1kTAAoJELSic+t+oim9F20P/RQsFPc8QfWBF1GyDcunEZml
aDG3mHjMXWMdif+8UcX5srzOJzn2U2QNz1kBGjJXpOYRYPVx4alcVsC85uTNc5pg
FFOoMYhwsBgqH41kZnUREjn7dboXh36RXaK03tL8Wl0Xz5rkFcBEqzoRwH9r9dEl
FUD6yIFd05CqdmMOjPzp8bIVS7efIZUo+SeLWP384ufghTDQ/80nqGgBfbxDRuzS
aSfgK0Lvi82gK3wOniuKMf4ZZgiXQyL5Wda9RaPBC9xj7+Txt1WB1QKkWsUFBazJ
tOr3lhwO/757C91vdKMcMjiYD5/pREkcNDXoUiSmSik2iESOhanjvVEqBQghZ2po
CdUcHI24HkoWQmmpzS+BveCsW5nZzJrJuYEwrEcyhyu/gtdUeR3M8oPxmiq9AVcW
V1a9ineickyHpnaWuWIWRq1HUs6Akv0FODK5muq9hf+e6XklK8WlG0m+dGmzpR3S
3cCbono3CB55YhcR/kHiSM2CIyoxnpgIa1KfrReCmZYDmW3/cxIapBNC67CbxFPn
Izq6vKWdofYha6NCGpdNFA9R+7XRj9OKVYqV8LgAoIc9BHV2Cewg70alfh5KV8a+
OWUc1pxN20gt/nELy35nowDdscX8eTIr2/gQhrCLsZ3EOr/Roex1ucYUC03UIY7B
1/wZammci0QqqOsweqhR
=wKyn
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
