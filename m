Return-Path: <SRS0=Wg4v=JO=collabora.co.uk=sebastian.reichel@kernel.org>
Date: Thu, 28 Jun 2018 15:16:12 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v4 2/6] power: reset: qcom-pon: Add Qcom PON driver
Message-ID: <20180628131612.a64bo773h62wld47@earth.universe>
References: <20180627115301.21330-1-vkoul@kernel.org>
 <20180627115301.21330-3-vkoul@kernel.org>
 <20180628115905.mbmjxxtl2i4ldf3w@earth.universe>
 <20180628125958.GU22377@vkoul-mobl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hlkzfq3jub7ymy6p"
Content-Disposition: inline
In-Reply-To: <20180628125958.GU22377@vkoul-mobl>
To: Vinod <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--hlkzfq3jub7ymy6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 28, 2018 at 06:29:58PM +0530, Vinod wrote:
> On 28-06-18, 13:59, Sebastian Reichel wrote:
> > On Wed, Jun 27, 2018 at 05:22:57PM +0530, Vinod Koul wrote:
> > > Add support Qualcomm PM8xxx PON which is responsible for reboot
> > > mode support.
> > >=20
> > > Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  drivers/power/reset/Kconfig    |  8 ++++
> > >  drivers/power/reset/Makefile   |  1 +
> > >  drivers/power/reset/qcom-pon.c | 91 ++++++++++++++++++++++++++++++++=
++++++++++
> > >  3 files changed, 100 insertions(+)
> > >  create mode 100644 drivers/power/reset/qcom-pon.c
> > >=20
> > > diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> > > index df58fc878b3e..1572b2d3ad3d 100644
> > > --- a/drivers/power/reset/Kconfig
> > > +++ b/drivers/power/reset/Kconfig
> > > @@ -104,6 +104,14 @@ config POWER_RESET_MSM
> > >  	help
> > >  	  Power off and restart support for Qualcomm boards.
> > > =20
> > > +config POWER_RESET_QCOM_PON
> > > +	bool "Qualcomm power-on driver"
> >=20
> > tristate?
>=20
> Hmmm I dont think there is a reason for this not being a module, though
> looking at reset driver, bunch of them seem to be inbuilt only.
>=20
> Bjorn, do you think we can be module or only inbuilt?

Note: If the result is inbuilt only, then you should update the
code accordingly (drop MODULE_*, use builtin_platform_driver instead
of module_platform_driver, ...

-- Sebastian

--hlkzfq3jub7ymy6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAls035QACgkQ2O7X88g7
+pq+kw//TAZN2uAl/4aGOtE3+Jh5kwraHxdhlQbLv4GHCSkd0rRy/7mgOaj2Gklj
lGKPNGfTqS5WZUWxi2LXVnoYvLXafC39FAbjQ4khtZhASGi8M5sur9+FRDRZmjtb
4dBHl2XJhs/bodrYR8U+XGeNfr09faeyB387Csjvl1NNL7qNcFx/yUA0DYWLPRva
WLz8zXXP0Rs1exOY7cqzfA4hrscpNEN/229bzO1RP4yG9nZiWDZuR5Yv1zlfmb7l
AI5/uXxwFaSGz6/16DN0Bu0zYOZ3yKDTEPaZuiflCCqaj8+GYMbc9lQrYblDlX4h
pguQbx29hbfPtS3DpvEEkQQvZKlpUZ9npq1yWgL83bSqzG+5peBlkm4EHN+p1Be1
PTzu6+63HyuLQCW+pVmWEnwkVq8Qhc60NeZ+KQebpQL14ixmlWsdDUYEY4BJnwqF
BQC2bIK7MNvUtm0nIObtRpO4EOSoO4szhmivuEPDcVD6DBT0HEJ5ZgRUoZCC3fUq
fAp0Ld7KP/T+7SSqtYlSr6N3AX65OYYmPwCVyDmsJwWNOFTzr1nlH7DOzmRNa3sY
n7b4lwC0XWheIDLRHRhwi+WSKgQUI58a8wrJCobzPKo2kI6Dnw7z5fkWV/4FwnTY
zL5e2bSwiM4w1mA7dui0jtss+1dewwBF2dDTN4nwSagIW6ZL3uU=
=BIOc
-----END PGP SIGNATURE-----

--hlkzfq3jub7ymy6p--
