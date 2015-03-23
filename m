From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] mfd: Add specific compatible strings for Qualcomm's
 SPMI PMIC's
Date: Mon, 23 Mar 2015 13:21:09 +0000
Message-ID: <20150323132109.GF24804@x1>
References: <1426589244-16740-1-git-send-email-iivanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426589244-16740-1-git-send-email-iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I want to see if Stephen B is now happy with this.

Not CC'ing him as a previous review is bad form IMO.

> Some of the PMIC's could have specific regmap configuration
> tables in future, so add specific compatible strings for known
> PMIC's. Also print runtime detected chip revision information.
>=20
> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes since v2
>=20
> * Fixed error checks from regmap_reads's.
> * Reorganized pmic_spmi_id_table.
> * Lower device info print level.
>=20
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.txt     |  19 +++-
>  drivers/mfd/qcom-spmi-pmic.c                       | 103 +++++++++++=
++++++++--
>  2 files changed, 111 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt=
 b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> index 7182b88..6ac06c1 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> @@ -15,10 +15,21 @@ each. A function can consume one or more of these=
 fixed-size register regions.
>=20
>  Required properties:
>  - compatible:      Should contain one of:
> -                     "qcom,pm8941"
> -                     "qcom,pm8841"
> -                     "qcom,pma8084"
> -                     or generalized "qcom,spmi-pmic".
> +                   "qcom,pm8941",
> +                   "qcom,pm8841",
> +                   "qcom,pma8084",
> +                   "qcom,pm8019",
> +                   "qcom,pm8226",
> +                   "qcom,pm8110",
> +                   "qcom,pma8084",
> +                   "qcom,pmi8962",
> +                   "qcom,pmd9635",
> +                   "qcom,pm8994",
> +                   "qcom,pmi8994",
> +                   "qcom,pm8916",
> +                   "qcom,pm8004",
> +                   "qcom,pm8909",
> +                   or generalized "qcom,spmi-pmic".
>  - reg:             Specifies the SPMI USID slave address for this de=
vice.
>                     For more information see:
>                     Documentation/devicetree/bindings/spmi/spmi.txt
> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmi=
c.c
> index 4b8beb2..af6ac1c 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -17,6 +17,100 @@
>  #include <linux/regmap.h>
>  #include <linux/of_platform.h>
>=20
> +#define PMIC_REV2		0x101
> +#define PMIC_REV3		0x102
> +#define PMIC_REV4		0x103
> +#define PMIC_TYPE		0x104
> +#define PMIC_SUBTYPE		0x105
> +
> +#define PMIC_TYPE_VALUE		0x51
> +
> +#define COMMON_SUBTYPE		0x00
> +#define PM8941_SUBTYPE		0x01
> +#define PM8841_SUBTYPE		0x02
> +#define PM8019_SUBTYPE		0x03
> +#define PM8226_SUBTYPE		0x04
> +#define PM8110_SUBTYPE		0x05
> +#define PMA8084_SUBTYPE		0x06
> +#define PMI8962_SUBTYPE		0x07
> +#define PMD9635_SUBTYPE		0x08
> +#define PM8994_SUBTYPE		0x09
> +#define PMI8994_SUBTYPE		0x0a
> +#define PM8916_SUBTYPE		0x0b
> +#define PM8004_SUBTYPE		0x0c
> +#define PM8909_SUBTYPE		0x0d
> +
> +static const struct of_device_id pmic_spmi_id_table[] =3D {
> +	{ .compatible =3D "qcom,spmi-pmic", .data =3D (void *)COMMON_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pm8941",    .data =3D (void *)PM8941_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pm8841",    .data =3D (void *)PM8841_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pm8019",    .data =3D (void *)PM8019_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pm8226",    .data =3D (void *)PM8226_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pm8110",    .data =3D (void *)PM8110_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pma8084",   .data =3D (void *)PMA8084_SUBTY=
PE },
> +	{ .compatible =3D "qcom,pmi8962",   .data =3D (void *)PMI8962_SUBTY=
PE },
> +	{ .compatible =3D "qcom,pmd9635",   .data =3D (void *)PMD9635_SUBTY=
PE },
> +	{ .compatible =3D "qcom,pm8994",    .data =3D (void *)PM8994_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pmi8994",   .data =3D (void *)PMI8994_SUBTY=
PE },
> +	{ .compatible =3D "qcom,pm8916",    .data =3D (void *)PM8916_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pm8004",    .data =3D (void *)PM8004_SUBTYP=
E },
> +	{ .compatible =3D "qcom,pm8909",    .data =3D (void *)PM8909_SUBTYP=
E },
> +	{ }
> +};
> +
> +static void pmic_spmi_show_revid(struct regmap *map, struct device *=
dev)
> +{
> +	unsigned int rev2, minor, major, type, subtype;
> +	const char *name =3D "unknown";
> +	int ret, i;
> +
> +	ret =3D regmap_read(map, PMIC_TYPE, &type);
> +	if (ret < 0)
> +		return;
> +
> +	if (type !=3D PMIC_TYPE_VALUE)
> +		return;
> +
> +	ret =3D regmap_read(map, PMIC_SUBTYPE, &subtype);
> +	if (ret < 0)
> +		return;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pmic_spmi_id_table); i++) {
> +		if (subtype =3D=3D (unsigned long)pmic_spmi_id_table[i].data)
> +			break;
> +	}
> +
> +	if (i !=3D ARRAY_SIZE(pmic_spmi_id_table))
> +		name =3D pmic_spmi_id_table[i].compatible;
> +
> +	ret =3D regmap_read(map, PMIC_REV2, &rev2);
> +	if (ret < 0)
> +		return;
> +
> +	ret =3D regmap_read(map, PMIC_REV3, &minor);
> +	if (ret < 0)
> +		return;
> +
> +	ret =3D regmap_read(map, PMIC_REV4, &major);
> +	if (ret < 0)
> +		return;
> +
> +	/*
> +	 * In early versions of PM8941 and PM8226, the major revision numbe=
r
> +	 * started incrementing from 0 (eg 0 =3D v1.0, 1 =3D v2.0).
> +	 * Increment the major revision number here if the chip is an early
> +	 * version of PM8941 or PM8226.
> +	 */
> +	if ((subtype =3D=3D PM8941_SUBTYPE || subtype =3D=3D PM8226_SUBTYPE=
) &&
> +	    major < 0x02)
> +		major++;
> +
> +	if (subtype =3D=3D PM8110_SUBTYPE)
> +		minor =3D rev2;
> +
> +	dev_dbg(dev, "%x: %s v%d.%d\n", subtype, name, major, minor);
> +}
> +
>  static const struct regmap_config spmi_regmap_config =3D {
>  	.reg_bits	=3D 16,
>  	.val_bits	=3D 8,
> @@ -33,6 +127,8 @@ static int pmic_spmi_probe(struct spmi_device *sde=
v)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>=20
> +	pmic_spmi_show_revid(regmap, &sdev->dev);
> +
>  	return of_platform_populate(root, NULL, NULL, &sdev->dev);
>  }
>=20
> @@ -41,13 +137,6 @@ static void pmic_spmi_remove(struct spmi_device *=
sdev)
>  	of_platform_depopulate(&sdev->dev);
>  }
>=20
> -static const struct of_device_id pmic_spmi_id_table[] =3D {
> -	{ .compatible =3D "qcom,spmi-pmic" },
> -	{ .compatible =3D "qcom,pm8941" },
> -	{ .compatible =3D "qcom,pm8841" },
> -	{ .compatible =3D "qcom,pma8084" },
> -	{ }
> -};
>  MODULE_DEVICE_TABLE(of, pmic_spmi_id_table);
>=20
>  static struct spmi_driver pmic_spmi_driver =3D {

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
