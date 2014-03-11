From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mfd: Support SiRF audio modules
Date: Tue, 11 Mar 2014 06:44:01 +0000
Message-ID: <20140311064401.GB2839@lee--X1>
References: <1394505387-13665-1-git-send-email-rongjun.ying@csr.com>
 <1394505387-13665-2-git-send-email-rongjun.ying@csr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394505387-13665-2-git-send-email-rongjun.ying-kQvG35nSl+M@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
>=20
> The audio modules consist of an internal audio codec, internal
> audio port and i2s controller.
>=20
> These modules sharing same register address space.
> sirf-audio.c provides common regmap mmio handling for all audio modul=
es.
> The sound drivers will get regmap from sirf audio mfd driver.
>=20
> Signed-off-by: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
> ---
> -v2:
> 1. Fixed a lot of english syntax error
> 2. Add "OF" depend
> 3. Get codec compatible from child node of dts
> 4. Use a standard header
>=20
>  drivers/mfd/Kconfig            |   10 +++
>  drivers/mfd/Makefile           |    1 +
>  drivers/mfd/sirf-audio.c       |  128 ++++++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/sirf/audio.h |   22 +++++++
>  4 files changed, 161 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mfd/sirf-audio.c
>  create mode 100644 include/linux/mfd/sirf/audio.h

<snip>

> +static struct mfd_cell sirf_audio_devs[] =3D {
> +	{
> +		.name =3D "sirf-audio-codec",
> +	}, {
> +		.of_compatible =3D "sirf,prima2-i2s",
> +		.name =3D "sirf-i2s",
> +	}, {
> +		.of_compatible =3D "sirf,audio-port",
> +		.name =3D "sirf-audio-port",
> +	}
> +};

The compatible string for the CODEC is mentioned in the Documentation,
but missing here.

Nit: Also please put .name first and .of_compatible second.

<snip>

> +	regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
> +					    &sirf_audio_regmap_config);

Odd tabbing here. It's neither tabs, nor '(' aligned.

> +	compatible =3D of_get_property(codec_np, "compatible", &cplen);
> +	if (!compatible)
> +		return -EINVAL;
> +
> +	/* Overwrite internal codec compatible string */
> +	sirf_audio_devs[0].of_compatible =3D kstrdup(compatible, GFP_KERNEL=
);

Oh wow, but no.

Use of_platform_populate() instead of fiddling with the DT like this.

> +	ret =3D  mfd_add_devices(&pdev->dev, -1, sirf_audio_devs,
> +			ARRAY_SIZE(sirf_audio_devs),
> +			NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(&pdev->dev, "add mfd devices failed: %d\n", ret);
> +		goto err_add_devs;
> +	}
> +
> +	return 0;
> +
> +err_add_devs:
> +	kfree(sirf_audio_devs[0].of_compatible);

<snip>

> +static int sirf_audio_remove(struct platform_device *pdev)
> +{
> +	kfree(sirf_audio_devs[0].of_compatible);

Gross.

> +	mfd_remove_devices(&pdev->dev);
> +	return 0;
> +}

<snip>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
