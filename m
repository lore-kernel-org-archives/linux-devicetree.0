From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] mfd: tps65217: add compatible string for
 subdevices
Date: Mon, 6 Oct 2014 22:25:36 +0100
Message-ID: <20141006212536.GH18035@lee--X1>
References: <3292130.zy6yLkolne@lenovobook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3292130.zy6yLkolne@lenovobook>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Pointner <johannes.pointner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 25 Sep 2014, Johannes Pointner wrote:

> Adds of_compatible strings to mfd_cells for sub devices of the tps652=
17.
>=20
> Signed-off-by: Johannes Pointner <johannes.pointner-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org=
>
> ---
>  drivers/mfd/tps65217.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied for v3.19.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index 3cc4c70..77708f9 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -33,9 +33,11 @@
>  static const struct mfd_cell tps65217s[] =3D {
>  	{
>  		.name =3D "tps65217-pmic",
> +		.of_compatible =3D "ti,tps65217-pmic",
>  	},
>  	{
>  		.name =3D "tps65217-bl",
> +		.of_compatible =3D "ti,tps65217-bl",
>  	},
>  };
> =20

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
