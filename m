From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v10 2/2] media: i2c: Add support for OV5647 sensor.
Date: Mon, 20 Mar 2017 16:16:12 +0200
Message-ID: <c6cb6827-e52d-0e6f-4e73-0b0c51522043@mentor.com>
References: <cover.1488798062.git.roliveir@synopsys.com>
 <67b5055a198316f74c5c1339e14a9f18a4106e69.1488798062.git.roliveir@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <67b5055a198316f74c5c1339e14a9f18a4106e69.1488798062.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ramiro,

On 03/06/2017 01:16 PM, Ramiro Oliveira wrote:
> The OV5647 sensor from Omnivision supports up to 2592x1944 @ 15 fps, RAW 8
> and RAW 10 output formats, and MIPI CSI-2 interface.
> 
> The driver adds support for 640x480 RAW 8.
> 
> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

All updates are fine, thank you. Feel free to add my

Reviewed-by: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

> ---
>  MAINTAINERS                |   7 +
>  drivers/media/i2c/Kconfig  |  11 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/ov5647.c | 636 +++++++++++++++++++++++++++++++++++++++++++++

I see this version has 100 LoC less in comparison to v8, good result.

[snip]

> +
> +static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
> +	.enum_mbus_code =	ov5647_enum_mbus_code,

Nitpicking, above it's better to swap tab and space symbols around '='.

> +};
> +
> +static const struct v4l2_subdev_ops ov5647_subdev_ops = {
> +	.core		= &ov5647_subdev_core_ops,
> +	.video		= &ov5647_subdev_video_ops,
> +	.pad		= &ov5647_subdev_pad_ops,
> +};
> +

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
