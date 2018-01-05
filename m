From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 1/5] bindings: regulator: added support for suspend
 states
Date: Fri, 5 Jan 2018 19:18:37 +0000
Message-ID: <20180105191837.GI9076@sirena.org.uk>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
 <1515050568-23876-2-git-send-email-zhang.chunyan@linaro.org>
 <20180105185328.zmt33idv2cqled62@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TA4f0niHM6tHt3xR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180105185328.zmt33idv2cqled62@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Chunyan Zhang <zhang.chunyan@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org


--TA4f0niHM6tHt3xR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2018 at 12:53:28PM -0600, Rob Herring wrote:
> On Thu, Jan 04, 2018 at 03:22:44PM +0800, Chunyan Zhang wrote:

> > +	- regulator-suspend-microvolt: the default voltage which regulator
> > +	  would be set in suspend. The voltage for suspend also can be
> > +	  adjusted among {regulator-suspend-min-microvolt,
> > +	  regulator-suspend-max-microvolt} by calling
> > +	  regulator_set_suspend_voltage(). This property is not deprecated,

> You mean "is deprecated", right?

I suspect "is now" but yeah.

> > +	- regulator-changeable-in-suspend: whether the default voltage and
> > +	  the regulator on/off in suspend can be changed in runtime.

> Is this not implied by having the constraints? Or the driver should know=
=20
> this. The simply means you have some 2nd bank of registers for settings=
=20
> while in suspend mode, right?

No, it means that the software has permission to use those changes to
those registers - we only want to be changing things if the user has
permission to change them since some systems will have specific
constraints, we don't know if it's safe without being explicitly told.
You're right that we could infer this from a range being provided
though, let's do that.

--TA4f0niHM6tHt3xR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpPz4wACgkQJNaLcl1U
h9Bw0Af8DE4uBWuWCGnJ/xfe248ZqZqGZdbawvrIN5wYkyG4cbJWms96q1dLdCF4
cW7eRhoKxVjbydF6uGxQ1ih5dlw2+wOxMP3OqeCfjY+y6uhNoNMu35M5ZCl+saFo
bLtlsvV2ZkF7HzPTMuuGyE8xbuJiqT5t852dd55juBh3xV3GuHKE8Rzm2ft82Xkk
oqTMV8ctynFIEgydpXAJskduEXTxvjkEF1EOO1QD3b9TnIzNl3L/+p7V1DxxbFfH
qbxUjMe0ZYtreiCm+FUBZzvSBStR76PerqF4nHs86gxoBSvEJOGl0T/PiI9h2+zv
5/Av6JXaxgNso8TA6EIsblfQURFpWA==
=ScHH
-----END PGP SIGNATURE-----

--TA4f0niHM6tHt3xR--
