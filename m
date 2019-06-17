From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
Date: Mon, 17 Jun 2019 17:03:58 +0100
Message-ID: <20190617160358.GC5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
 <20190617150502.GU5316@sirena.org.uk>
 <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l8YfOjwMha7d9KWK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--l8YfOjwMha7d9KWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2019 at 09:17:21AM -0600, Jeffrey Hugo wrote:
> On Mon, Jun 17, 2019 at 9:05 AM Mark Brown <broonie@kernel.org> wrote:

> > > +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> > > +                                           unsigned selector)
> > > +{

> > > +     mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;

> > This could just be a set_voltage_sel(), no need for it to be a
> > set_voltage() operation....

> This is a set_voltage_sel() in spmi_ftsmps426_ops.  Is the issue because this
> function is "spmi_regulator_ftsmps426_set_voltage" and not
> "spmi_regulator_ftsmps426_set_voltage_sel"?

Well, that's certainly confusing naming and there's some confusion in
the code about what a selector is - it's supposed to be a raw register
value so if you're having to convert it into a voltage something is
going wrong.  Just implement a set_voltage() operation?

> We already have code in the driver to convert a selector to the
> voltage.  Why duplicate
> that inline in spmi_regulator_ftsmps426_set_voltage?

Either work with selectors or work with voltages, don't mix and match
the two.

> > > +     switch (mode) {
> > > +     case REGULATOR_MODE_NORMAL:
> > > +             val = SPMI_FTSMPS426_MODE_HPM_MASK;
> > > +             break;
> > > +     case REGULATOR_MODE_FAST:
> > > +             val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> > > +             break;
> > > +     default:
> > > +             val = SPMI_FTSMPS426_MODE_LPM_MASK;
> > > +             break;
> > > +     }

> > This should validate, it shouldn't just translate invalid values into
> > valid ones.

> Validate what?  The other defines are REGULATOR_MODE_IDLE
> and REGULATOR_MODE_STANDBY which correspond to the LPM
> mode.  Or are you suggesting that regulator framework is going to pass
> REGULATOR_MODE_INVALID to this operation?

You should be validating that the argument passed in is one that the
driver understands, your assumption will break if we add any new modes
and in any case there should be a 1:1 mapping between hardware and API
modes so you shouldn't be translating two different API modes into the
same hardware mode.

--l8YfOjwMha7d9KWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Hue0ACgkQJNaLcl1U
h9BokQf/fWdp7er8/W74adT1KeOqQi4nPS93SO7dWKuu7q1YNud8ppBRNgmG3djL
xaZh1dTIqVx2GICGfhZA3uEYPTsgPfNiM0ENiApp8OqfxX8VE5J6Ww01ikPQq08J
Hgwb5piOsDD1uQWUr07Y7R3eoZeKmFCWBRAxUSdNSFBdbQy/v1Of2Yl98/ghbP7Z
c8Au/mllEECB2Ew4rFXJXse1R19p0feZxxw2DQUPPB+AQ46TstNc487vUoSKNxJp
8D2BxD5Ph+8wT9lHUimBTNyNhBtRo8wiO0yXOe7xWR8w3rJxMUGe1jNJqFO4olqf
KFAvYXEW+12HBtSq7ZaqNi5iCB/XJg==
=GX4O
-----END PGP SIGNATURE-----

--l8YfOjwMha7d9KWK--
