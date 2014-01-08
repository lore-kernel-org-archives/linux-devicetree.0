From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: Add support for S2MPA01 device
Date: Wed, 8 Jan 2014 09:02:08 +0000
Message-ID: <20140108090208.GD19974@lee--X1>
References: <1389162390-4582-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389162390-4582-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Add the necessary entries required for S2MPA01 multi-function
> device. While at it also convert whitespaces to tabs in core.h.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mfd/sec-core.c              |   39 +++++++
>  include/linux/mfd/samsung/core.h    |   16 ++-
>  include/linux/mfd/samsung/irq.h     |   50 +++++++++
>  include/linux/mfd/samsung/s2mpa01.h |  192 +++++++++++++++++++++++++=
++++++++++
>  4 files changed, 292 insertions(+), 5 deletions(-)
>  create mode 100644 include/linux/mfd/samsung/s2mpa01.h
>=20
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index a139798b8065..d2e890d50a36 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -26,6 +26,7 @@
>  #include <linux/mfd/samsung/core.h>
>  #include <linux/mfd/samsung/irq.h>
>  #include <linux/mfd/samsung/rtc.h>
> +#include <linux/mfd/samsung/s2mpa01.h>
>  #include <linux/mfd/samsung/s2mps11.h>
>  #include <linux/mfd/samsung/s5m8763.h>
>  #include <linux/mfd/samsung/s5m8767.h>
> @@ -69,6 +70,13 @@ static const struct mfd_cell s2mps11_devs[] =3D {
>  	}
>  };
> =20
> +static const struct mfd_cell s2mpa01_devs[] =3D {
> +	{
> +		.name =3D "s2mpa01-pmic",
> +	},
> +};
> +
> +

Extra '/n' here.

>  #ifdef CONFIG_OF
>  static struct of_device_id sec_dt_match[] =3D {
>  	{	.compatible =3D "samsung,s5m8767-pmic",
> @@ -77,10 +85,25 @@ static struct of_device_id sec_dt_match[] =3D {
>  	{	.compatible =3D "samsung,s2mps11-pmic",
>  		.data =3D (void *)S2MPS11X,
>  	},
> +	{	.compatible =3D "samsung,s2mpa01-pmic",
> +		.data =3D (void *)S2MPA01,
> +	},

Can you use the same format at the rest of the file.

I'm happy for you to fix the entire struct in this patch.

Rest of the file uses overlapping format:

        }, {
                .compatible =3D "samsung,s2mpa01-pmic",
        },


<snip>

> @@ -92,7 +93,7 @@ struct sec_platform_data {
>  	int				buck3_default_idx;
>  	int				buck4_default_idx;
> =20
> -	int                             buck_ramp_delay;
> +	int				buck_ramp_delay;

What's this? Are you fixing (or breaking) white space here?

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
