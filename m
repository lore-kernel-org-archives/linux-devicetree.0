From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 2/8] MAINTAINERS: Addition of Altera Arria10 System
 Resource Chip
Date: Wed, 30 Mar 2016 09:19:08 +0100
Message-ID: <20160330081908.GH3323@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-3-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459278791-3646-3-git-send-email-tthayer@opensource.altera.com>
Sender: linux-gpio-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>=20
> Add maintainer for the Altera Arria10 files.
>=20
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  MAINTAINERS |    8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 972f25d..567ce60 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -608,6 +608,14 @@ L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/gpio/gpio-altera.c
> =20
> +ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
> +M:	Thor Thayer <tthayer@opensource.altera.com>
> +S:	Maintained
> +F:	drivers/mfd/altera-a10sr.c
> +F:	include/linux/mfd/altera-a10sr.h
> +F:	drivers/gpio/gpio-altera-a10sr.c
> +F:	drivers/hwmon/altera-a10sr-hwmon.c

Alphabetical makes more sense.

>  ALTERA TRIPLE SPEED ETHERNET DRIVER
>  M:	Vince Bridgers <vbridger@opensource.altera.com>
>  L:	netdev@vger.kernel.org

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
