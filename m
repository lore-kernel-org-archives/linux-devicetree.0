Return-Path: <SRS0=Wg4v=JO=collabora.co.uk=sebastian.reichel@kernel.org>
Date: Thu, 28 Jun 2018 13:59:05 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v4 2/6] power: reset: qcom-pon: Add Qcom PON driver
Message-ID: <20180628115905.mbmjxxtl2i4ldf3w@earth.universe>
References: <20180627115301.21330-1-vkoul@kernel.org>
 <20180627115301.21330-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcnbduozej2vcl6x"
Content-Disposition: inline
In-Reply-To: <20180627115301.21330-3-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--lcnbduozej2vcl6x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 27, 2018 at 05:22:57PM +0530, Vinod Koul wrote:
> Add support Qualcomm PM8xxx PON which is responsible for reboot
> mode support.
>=20
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/power/reset/Kconfig    |  8 ++++
>  drivers/power/reset/Makefile   |  1 +
>  drivers/power/reset/qcom-pon.c | 91 ++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 100 insertions(+)
>  create mode 100644 drivers/power/reset/qcom-pon.c
>=20
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index df58fc878b3e..1572b2d3ad3d 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -104,6 +104,14 @@ config POWER_RESET_MSM
>  	help
>  	  Power off and restart support for Qualcomm boards.
> =20
> +config POWER_RESET_QCOM_PON
> +	bool "Qualcomm power-on driver"

tristate?

Otherwise driver looks fine to me.

-- Sebastian

--lcnbduozej2vcl6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAls0zYkACgkQ2O7X88g7
+ppqbRAAnjzKYXZGmEemZqiWs9wzON1Stm+dyttWrg0aB+BOKV5GKwsCleoripoP
tAPcQOEK+8wReBSAGoTJABHkyMDCcGt4BqJQ1UwkBkLKW8L9Y4Ug8ow1wkcVY0NE
Qwt4UBqc1pCTGzXBxQ+JKr4AuG+iRNOTfXjZLoiRxd6YdCZK6X1u9qtIhGL/QPdy
nZBvAOTQ8eR+WJZ749jn+ZwJVbqGpmV4ZMSFpk8kAXa/W8BAdSL8jlLriYGMt5Pk
oczV4mDg+FkffIyqOCILu9/C0vOttM+yLIjmULz+0V8SdBqcHS0+naulCYMnONh0
247s/Cw8lycMWmzVN1DjCIxwPjOyXw/ci08t7MEi3uYnQSrzcAAsXdStMWf95FUV
/3X6y92urfomQ0B2GV/FgadqXYcYUuXY63bMDS6xYctjhrLPQtmZDREqu/+Ky6io
U3JexorgLvWhmnI6Hql6TtgvnBx8+9z4Q0brzJgA75/pqFgYHhXSmvrf9S9t+f82
29s8W7QMBYEvb749KVQ2JDm2kv8okNJhNJSPduX2AjA5gQQidw9oFFwWOINKtaFh
tE3eUd4KiaatFig8ewpyx15ipKrzbBE2Kr7Dz+gJJ91IWeRT8u3324l7nQegctR5
WVHac6i1Wc9qJlzhl+kc8lP9cIDc102XcGmkbYS8Gk+gQkm3FQc=
=Gcti
-----END PGP SIGNATURE-----

--lcnbduozej2vcl6x--
