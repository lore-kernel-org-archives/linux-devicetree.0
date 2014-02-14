From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: twl4030-madc: Add devicetree support.
Date: Fri, 14 Feb 2014 13:48:15 +0000
Message-ID: <20140214134815.GD13293@lee--X1>
References: <1392383861-14169-1-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392383861-14169-1-git-send-email-marek@goldelico.com>
Sender: linux-doc-owner@vger.kernel.org
To: Marek Belisko <marek@goldelico.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, hns@goldelico.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> Signed-off-by: Marek Belisko <marek@goldelico.com>
> ---
>  .../devicetree/bindings/mfd/twl4030-madc.txt       | 18 ++++++++++++=
+
>  drivers/mfd/twl4030-madc.c                         | 31
> ++++++++++++++++++++--

Please separate these into different patches.

>  2 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/twl4030-mad=
c.txt

<snip>

> +++ b/drivers/mfd/twl4030-madc.c
> @@ -695,6 +695,29 @@ static int twl4030_madc_set_power(struct twl4030=
_madc_data *madc, int on)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_OF

I believe we're heading for a more:

  if (IS_ENABLED(CONFIG_OF))

=2E.. approach. I won't enforce it, but please consider using it.

> +static struct twl4030_madc_platform_data *
> +	twl4030_madc_of_parse(struct platform_device *pdev)
> +{
> +	struct twl4030_madc_platform_data *pdata;
> +
> +	pdata =3D devm_kzalloc(&pdev->dev,
> +			sizeof(struct twl4030_madc_platform_data), GFP_KERNEL);

s/struct twl4030_madc_platform_data/*pdata/

> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pdata->irq_line =3D platform_get_irq(pdev, 0);

Why weren't 'resources' used in the original implementation?

> +	return pdata;
> +}
> +
> +static const struct of_device_id twl4030_madc_dt_match_table[] =3D {
> +	{ .compatible =3D "ti,twl4030-madc" },
> +	{},
> +};
> +
> +#endif
> +
>  /*
>   * Initialize MADC and request for threaded irq
>   */
> @@ -706,8 +729,11 @@ static int twl4030_madc_probe(struct platform_de=
vice *pdev)
>  	u8 regval;
> =20
>  	if (!pdata) {
> -		dev_err(&pdev->dev, "platform_data not available\n");
> -		return -EINVAL;
> +		pdata =3D twl4030_madc_of_parse(pdev);
> +		if (!pdata) {

And if you received -ENOMEM?

> +			dev_err(&pdev->dev, "platform_data not available\n");
> +			return -EINVAL;
> +		}
>  	}
>  	madc =3D kzalloc(sizeof(*madc), GFP_KERNEL);
>  	if (!madc)
> @@ -807,6 +833,7 @@ static struct platform_driver twl4030_madc_driver=
 =3D {
>  	.driver =3D {
>  		   .name =3D "twl4030_madc",
>  		   .owner =3D THIS_MODULE,
> +		   .of_match_table =3D of_match_ptr(twl4030_madc_dt_match_table),
>  		   },
>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
