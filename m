From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 2/3] regulator: core: Parse coupled regulators
 properties
Date: Wed, 29 Nov 2017 16:25:41 +0000
Message-ID: <20171129162541.dfmed64koyu3ihls@sirena.org.uk>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
 <CGME20171018124735eucas1p2dc60191fb185f18dee16d4b3de8502cf@eucas1p2.samsung.com>
 <1508330822-8039-3-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7cmtzikdebbrgakx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508330822-8039-3-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7cmtzikdebbrgakx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2017 at 02:47:01PM +0200, Maciej Purski wrote:

This looks mostly good, a few things below that I think should be
relatively easy to addresss.

> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -3953,6 +3953,198 @@ static int regulator_register_resolve_supply(stru=
ct device *dev, void *data)
>  	return 0;
>  }
> =20
> +/* Function returns regulator coupled with the given regulator_dev */
> +static struct regulator_dev *parse_coupled_regulator(struct regulator_de=
v *rdev,
> +						     int index)
> +{
> +	struct device_node *node =3D rdev->dev.of_node;

This is DT parsing code directly in the regulator core - we need to work
with other firmware interfaces and with board files.  This code should
be in of_regulator.c to ensure that the infrastructure works for non-DT
users.  The code's pretty much there, it mostly needs moving around.
The coupling voltage needs to go into the constraints data.

> +		/* Regulator can't be found */
> +		if (j =3D=3D n_coupled && tmp_rdev !=3D c_rdev)
> +			return -1;

Please return error codes and print error messages, it'll help users
debug stuff.

> @@ -4116,6 +4308,8 @@ regulator_register(const struct regulator_desc *reg=
ulator_desc,
>  	dev_set_drvdata(&rdev->dev, rdev);
>  	rdev_init_debugfs(rdev);
> =20
> +	regulator_resolve_coupling(rdev);
> +
>  	/* try to resolve regulators supply since a new one was registered */
>  	class_for_each_device(&regulator_class, NULL, NULL,
>  			      regulator_register_resolve_supply);
> @@ -4129,6 +4323,7 @@ regulator_register(const struct regulator_desc *reg=
ulator_desc,
>  wash:
>  	kfree(rdev->constraints);
>  	mutex_lock(&regulator_list_mutex);
> +	regulator_clean_coupling(rdev);
>  	regulator_ena_gpio_free(rdev);
>  	mutex_unlock(&regulator_list_mutex);
>  clean:

Shouldn't we be resolving the coupling while we hold the list lock?
We're still working with multiple regulators at this point.

--7cmtzikdebbrgakx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloe34QACgkQJNaLcl1U
h9A/+Af9EQbXRO9onKZRdbjfaLpk83tVnf4cutwNbSdAAQmWBTnFanDjvuipvnqY
IfT/0foeYy85qFdYlwpa+qxBz4gttMg3CIVQyFPQC94TGcGzaxcAtnlxmjYn6iMz
B6NQsMy/uKoXnvrEXcWoGp4JB4fZIMUUqcVFeCDebMWMhDO92h6UdnWaXW+/O0X2
g53BPHaaT00UaTT1/hRE8FPM0vKtF6cA42QBhfGHLbxAD0v14xH8ogDMEo6bO7yo
OFJPjAkbRTCO3inmvYEj7DEN6GpDZRYNagudxwgFxlm2lmuTSV+FtGWAo3hmGrDM
UAtxEaVOzI9GjSpyg+0iyzzYJZCmUA==
=/Wcb
-----END PGP SIGNATURE-----

--7cmtzikdebbrgakx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
