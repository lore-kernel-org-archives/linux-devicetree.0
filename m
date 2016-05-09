From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 02/11] MAINTAINERS: Add Altera Arria10 System Resource
 Chip
Date: Mon, 9 May 2016 16:36:52 +0100
Message-ID: <20160509153652.GC19473@dell>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-3-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461339219-15255-3-git-send-email-tthayer@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Apr 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>=20
> Add maintainer for the Altera Arria10 Max5 System Resource chip files=
=2E
>=20
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  MAINTAINERS |    8 ++++++++
>  1 file changed, 8 insertions(+)

=46or my own reference:
  Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 724bb86..e5f2621 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -608,6 +608,14 @@ L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/gpio/gpio-altera.c
> =20
> +ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
> +M:	Thor Thayer <tthayer@opensource.altera.com>
> +S:	Maintained
> +F:	drivers/gpio/gpio-altera-a10sr.c
> +F:	drivers/hwmon/altera-a10sr-hwmon.c
> +F:	drivers/mfd/altera-a10sr.c
> +F:	include/linux/mfd/altera-a10sr.h
> +
>  ALTERA TRIPLE SPEED ETHERNET DRIVER
>  M:	Vince Bridgers <vbridger@opensource.altera.com>
>  L:	netdev@vger.kernel.org

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
