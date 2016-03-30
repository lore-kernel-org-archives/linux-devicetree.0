From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 7/8] hwmon: Altera Arria10 System Resource Chip - HW Monitor
Date: Wed, 30 Mar 2016 09:17:35 +0100
Message-ID: <20160330081735.GF3323@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-8-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459278791-3646-8-git-send-email-tthayer@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>=20
> This patch adds the hwmon functionality to the Arria10 System
> Resource Chip. The hwmon encapsulates the PCIe Enable, USB Enable,
> and all the Power Good signals on the System Controller.
>=20
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  drivers/hwmon/Kconfig              |    9 +
>  drivers/hwmon/Makefile             |    1 +
>  drivers/hwmon/altera-a10sr-hwmon.c |  544 ++++++++++++++++++++++++++=
++++++++++
>  drivers/mfd/altera-a10sr.c         |    4 +
>  include/linux/mfd/altera-a10sr.h   |  107 +++++--
>  5 files changed, 645 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/hwmon/altera-a10sr-hwmon.c

[...]

> diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
> index 517b895..3eedad7 100644
> --- a/drivers/mfd/altera-a10sr.c
> +++ b/drivers/mfd/altera-a10sr.c
> @@ -34,6 +34,10 @@ static const struct mfd_cell altr_a10sr_subdev_inf=
o[] =3D {
>  		.name =3D "altr_a10sr_gpio",
>  		.of_compatible =3D "altr,a10sr-gpio",
>  	},
> +	{
> +		.name =3D "altr_a10sr_hwmon",
> +		.of_compatible =3D "altr,a10sr-hwmon",
> +	},
>  };
> =20
>  static bool altr_a10sr_reg_readable(struct device *dev, unsigned int=
 reg)

This belongs in a patch of its own.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
