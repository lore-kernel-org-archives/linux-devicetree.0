From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: cros ec: spi: Add delay for raising CS
Date: Mon, 25 Nov 2013 09:45:03 +0000
Message-ID: <20131125094503.GD17722@lee--X1>
References: <1385143550-31901-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385143550-31901-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Nov 2013, Thierry Reding wrote:

> From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The EC has specific timing it requires. Add support for an optional d=
elay
> after raising CS to fix timing issues. This is configurable based on
> a DT property "google,cros-ec-spi-msg-delay".
>=20
> If this property isn't set, then no delay will be added. However, if =
set
> it will cause a delay equal to the value passed to it to be inserted =
at
> the end of a transaction.
>=20
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Bernie Thompson <bhthompson-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - make property description more verbose
>=20
>  Documentation/devicetree/bindings/mfd/cros-ec.txt |  9 +++++++

We need a DT dude to look over this.

>  drivers/mfd/cros_ec_spi.c                         | 30 +++++++++++++=
++++++++++
>  2 files changed, 39 insertions(+)

<snip>

>  static void debug_packet(struct device *dev, const char *name, u8 *p=
tr,
> @@ -238,6 +242,17 @@ static int cros_ec_command_spi_xfer(struct cros_=
ec_device *ec_dev,
> =20
>  	/* turn off CS */
>  	spi_message_init(&msg);
> +
> +	if (ec_spi->end_of_msg_delay) {
> +		/*
> +		 * Add delay for last transaction, to ensure the rising edge
> +		 * doesn't come too soon after the end of the data.
> +		 */
> +		memset(&trans, '\0', sizeof(trans));

Just use the usual 0 for the third parameter.

> +static void cros_ec_probe_spi_dt(struct cros_ec_spi *ec_spi, struct =
device *dev)

Traditionally we have 'probe' as the last word in the function name.

> +{
> +	struct device_node *np =3D dev->of_node;
> +	u32 val;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, "google,cros-ec-spi-msg-delay", &v=
al);
> +	if (!ret)
> +		ec_spi->end_of_msg_delay =3D val;
> +}
> +
>  static int cros_ec_probe_spi(struct spi_device *spi)

Can you send a pre-patch to fix this too please:
  static int cros_ec_spi_probe(struct spi_device *spi)

<snip>

> +	/* Check for any DT properties */
> +	if (IS_ENABLED(CONFIG_OF) && dev->of_node)

No need for the first check.

> +		cros_ec_probe_spi_dt(ec_spi, dev);
> +
>  	spi_set_drvdata(spi, ec_dev);
>  	ec_dev->name =3D "SPI";
>  	ec_dev->dev =3D dev;

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
