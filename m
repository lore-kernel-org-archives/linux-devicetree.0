From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] mfd: da9063: Add device tree support
Date: Tue, 20 Jan 2015 10:45:44 +0000
Message-ID: <20150120104544.GS5767@x1>
References: <cover.1421684991.git.stwiss.opensource@diasemi.com>
 <d765ef11de06a4ac5721ecf3283ba1333a6d0c8c.1421684991.git.stwiss.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d765ef11de06a4ac5721ecf3283ba1333a6d0c8c.1421684991.git.stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Dajun Chen <david.chen-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 19 Jan 2015, Steve Twiss wrote:

> From: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>=20
> Add device tree support for DA9063 regulators; Real-Time Clock
> and Watchdog.
>=20
> This patch is dependent on PATCH V2 2/2=20
>=20
> Signed-off-by: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>=20
> ---
> This patch applies against linux-next and v3.19-rc4=20
>=20
>  drivers/mfd/da9063-core.c       |  2 ++
>  drivers/mfd/da9063-i2c.c        | 11 +++++++++++
>  include/linux/mfd/da9063/core.h |  1 +
>  3 files changed, 14 insertions(+)
>=20
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
> index 21fd8d9..0e94b20 100644
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
> @@ -203,6 +206,13 @@ static struct regmap_config da9063_regmap_config=
 =3D {
>  	.cache_type =3D REGCACHE_RBTREE,
>  };
> =20
> +static const struct of_device_id da9063_dt_ids[] =3D {
> +	{ .compatible =3D "dlg,da9063-ad", },
> +	{ .compatible =3D "dlg,da9063-bb", },
> +	{ .compatible =3D "dlg,da9063-ca", },

I'm still a bit bemused as to why these require their own compatible
strings?  They are never matched (of_match_device()) on and it appears
they can be dynamically told apart by poking.

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
