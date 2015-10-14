From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v4 2/2] usb: chipidea: imx: refine clock operations to
 adapt for all platforms
Date: Wed, 14 Oct 2015 10:07:59 +0200
Message-ID: <561E0D5F.8030003@pengutronix.de>
References: <1444787859-31509-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="MKTweChM8adGHS1Rlbk7XkAAgUuoM4lo7"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1444787859-31509-1-git-send-email-peter.chen@freescale.com>
Sender: stable-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>, shawnguo@kernel.org, linux-usb@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, fabio.estevam@freescale.com, pawel.moll@arm.com, stable@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MKTweChM8adGHS1Rlbk7XkAAgUuoM4lo7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/14/2015 03:57 AM, Peter Chen wrote:
> Some i.mx platforms need three clocks to let controller work, but
> others only need one, refine clock operation to adapt for all
> platforms, it fixes a regression found at i.mx27.
>=20
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> Tested-by: Fabio Estevam <fabio.estevam@freescale.com>
> Cc: <stable@vger.kernel.org> #v4.1+
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c | 132 +++++++++++++++++++++++++++++=
+++-----
>  1 file changed, 114 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/=
ci_hdrc_imx.c
> index 6ccbf60..82b1dfe 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -84,6 +84,12 @@ struct ci_hdrc_imx_data {
>  	struct imx_usbmisc_data *usbmisc_data;
>  	bool supports_runtime_pm;
>  	bool in_lpm;
> +	/* SoC before i.mx6 (except imx23/imx28) needs three clks */
> +	bool need_three_clks;
> +	struct clk *clk_ipg;
> +	struct clk *clk_ahb;
> +	struct clk *clk_per;
> +	/* --------------------------------- */
>  };
> =20
>  /* Common functions shared by usbmisc drivers */
> @@ -135,6 +141,103 @@ static struct imx_usbmisc_data *usbmisc_get_init_=
data(struct device *dev)
>  }
> =20
>  /* End of common functions shared by usbmisc drivers*/
> +static int imx_get_clks(struct device *dev)
> +{
> +	struct ci_hdrc_imx_data *data =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	data->clk_ipg =3D devm_clk_get(dev, "ipg");
> +	if (IS_ERR(data->clk_ipg)) {
> +		/* If the platform only needs one clocks */
> +		data->clk =3D devm_clk_get(dev, NULL);
> +		if (IS_ERR(data->clk)) {
> +			ret =3D PTR_ERR(data->clk);
> +			dev_err(dev,
> +				"Failed to get clock, err=3D%d\n", ret);
> +			dev_err(dev,
> +				"Failed to get ipg clock, err=3D%d\n", ret);

Nitpick, one error message should be enough.

> +			return ret;
> +		}
> +		return ret;
> +	}
> +
> +	data->clk_ahb =3D devm_clk_get(dev, "ahb");
> +	if (IS_ERR(data->clk_ahb)) {
> +		ret =3D PTR_ERR(data->clk_ahb);
> +		dev_err(dev,
> +			"Failed to get ahb clock, err=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	data->clk_per =3D devm_clk_get(dev, "per");
> +	if (IS_ERR(data->clk_per)) {
> +		ret =3D PTR_ERR(data->clk_per);
> +		dev_err(dev,
> +			"Failed to get per clock, err=3D%d\n", ret);
> +		return ret;
> +	}
> +
> +	data->need_three_clks =3D true;
> +	return ret;
> +}
> +
> +static int imx_prepare_enable_clks(struct device *dev)
> +{
> +	struct ci_hdrc_imx_data *data =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	if (data->need_three_clks) {
> +		ret =3D clk_prepare_enable(data->clk_ipg);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to prepare/enable ipg clk, err=3D%d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		ret =3D clk_prepare_enable(data->clk_ahb);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to prepare/enable ahb clk, err=3D%d\n",
> +				ret);
> +			clk_disable_unprepare(data->clk_ipg);
> +			return ret;
> +		}
> +
> +		ret =3D clk_prepare_enable(data->clk_per);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to prepare/enable per clk, err=3D%d\n",
> +				ret);
> +			clk_disable_unprepare(data->clk_ahb);
> +			clk_disable_unprepare(data->clk_ipg);
> +			return ret;
> +		}
> +	} else {
> +		ret =3D clk_prepare_enable(data->clk);
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to prepare/enable clk, err=3D%d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void imx_disable_unprepare_clks(struct device *dev)
> +{
> +	struct ci_hdrc_imx_data *data =3D dev_get_drvdata(dev);
> +
> +	if (data->need_three_clks) {
> +		clk_disable_unprepare(data->clk_per);
> +		clk_disable_unprepare(data->clk_ipg);
> +		clk_disable_unprepare(data->clk_ahb);

nit: you enable in this order: ipg, ahb, per. Disabling should be inverse=
=2E

> +	} else {
> +		clk_disable_unprepare(data->clk);
> +	}
> +}

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--MKTweChM8adGHS1Rlbk7XkAAgUuoM4lo7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCgAGBQJWHg1fAAoJEP5prqPJtc/HGeIH/37ot/KTywuggIJGeZUqf/y8
gkEWNK3VLIERTJDGU5QwFq9xMhPKngWp/H9TzEVPq0MWyHd+7BhXIJxEMAZvVFcy
t543PN5zsMEftiTPqE2IUwaU9BXhLiAJdYyIkPVhPoZltBAxpBRmcwG1D+1sySgn
cE4E08JcVskKpNPFonK/EBPt2Gnfw0b5aQvwSoY6HzmOE0AyY4JPWgSOVzmi3n+Q
TO7ZZESTy9X+8W1f85e9UBgT/+JdMESVfagew4+3BrOkB+yraMN54riQDLqEtX+6
u2lbo3ASRar6SrY5jXE3rnNTJis3G8/WQStDRoTSKgH35QnIrF2snsdgPukIG+A=
=LKoT
-----END PGP SIGNATURE-----

--MKTweChM8adGHS1Rlbk7XkAAgUuoM4lo7--
