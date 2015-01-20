From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 1/2] mfd: da9063: Add device tree support
Date: Tue, 20 Jan 2015 17:03:44 +0000
Message-ID: <20150120170344.GA32437@x1>
References: <cover.1421762065.git.stwiss.opensource@diasemi.com>
 <2ab606365e855b081819174235105ba6674c8143.1421762065.git.stwiss.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ab606365e855b081819174235105ba6674c8143.1421762065.git.stwiss.opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, DT <devicetree@vger.kernel.org>, David Dajun Chen <david.chen@diasemi.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Tue, 20 Jan 2015, Steve Twiss wrote:

> From: Steve Twiss <stwiss.opensource@diasemi.com>
>=20
> Add device tree support for DA9063 regulators; Real-Time Clock
> and Watchdog.
>=20
> This patch is dependent on PATCH V2 2/2=20
>=20
> Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
>=20
> ---
> This patch applies against linux-next and v3.19-rc4=20
>=20
>  drivers/mfd/da9063-core.c       | 2 ++
>  drivers/mfd/da9063-i2c.c        | 9 +++++++++
>  include/linux/mfd/da9063/core.h | 1 +
>  3 files changed, 12 insertions(+)

Applied, thanks.

> diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> index f38bc98..facd361 100644
> --- a/drivers/mfd/da9063-core.c
> +++ b/drivers/mfd/da9063-core.c
> @@ -86,6 +86,7 @@ static const struct mfd_cell da9063_devs[] =3D {
>  	},
>  	{
>  		.name		=3D DA9063_DRVNAME_WATCHDOG,
> +		.of_compatible	=3D "dlg,da9063-watchdog",
>  	},
>  	{
>  		.name		=3D DA9063_DRVNAME_HWMON,
> @@ -101,6 +102,7 @@ static const struct mfd_cell da9063_devs[] =3D {
>  		.name		=3D DA9063_DRVNAME_RTC,
>  		.num_resources	=3D ARRAY_SIZE(da9063_rtc_resources),
>  		.resources	=3D da9063_rtc_resources,
> +		.of_compatible	=3D "dlg,da9063-rtc",
>  	},
>  	{
>  		.name		=3D DA9063_DRVNAME_VIBRATION,
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 21fd8d9..6f3a7c0 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -25,6 +25,9 @@
>  #include <linux/mfd/da9063/pdata.h>
>  #include <linux/mfd/da9063/registers.h>
> =20
> +#include <linux/of.h>
> +#include <linux/regulator/of_regulator.h>
> +
>  static const struct regmap_range da9063_ad_readable_ranges[] =3D {
>  	{
>  		.range_min =3D DA9063_REG_PAGE_CON,
> @@ -203,6 +206,11 @@ static struct regmap_config da9063_regmap_config=
 =3D {
>  	.cache_type =3D REGCACHE_RBTREE,
>  };
> =20
> +static const struct of_device_id da9063_dt_ids[] =3D {
> +	{ .compatible =3D "dlg,da9063", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, da9063_dt_ids);
>  static int da9063_i2c_probe(struct i2c_client *i2c,
>  	const struct i2c_device_id *id)
>  {
> @@ -257,6 +265,7 @@ static struct i2c_driver da9063_i2c_driver =3D {
>  	.driver =3D {
>  		.name =3D "da9063",
>  		.owner =3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(da9063_dt_ids),
>  	},
>  	.probe    =3D da9063_i2c_probe,
>  	.remove   =3D da9063_i2c_remove,
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da90=
63/core.h
> index b92a326..79f4d82 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -36,6 +36,7 @@ enum da9063_models {
>  enum da9063_variant_codes {
>  	PMIC_DA9063_AD =3D 0x3,
>  	PMIC_DA9063_BB =3D 0x5,
> +	PMIC_DA9063_CA =3D 0x6,
>  };
> =20
>  /* Interrupts */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
