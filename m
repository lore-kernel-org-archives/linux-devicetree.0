From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: randconfig build error with next-20140624, in
 drivers/mfd/sec-core.c
Date: Tue, 24 Jun 2014 16:48:33 +0100
Message-ID: <20140624154833.GR13803@lee--X1>
References: <CA+r1ZhhFYip3Jp2c3d8tNpD-vK8Pkf7DzrKTtk6Gy8uOOO3Ucw@mail.gmail.com>
 <29237234.T7oGEGKuvp@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <29237234.T7oGEGKuvp@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 24 Jun 2014, Arnd Bergmann wrote:

> On Tuesday 24 June 2014 07:39:04 Jim Davis wrote:
> > Building with the attached random configuration file,
> >=20
> > drivers/built-in.o: In function `sec_pmic_suspend':
> > sec-core.c:(.text+0x31e02c): undefined reference to `regulator_susp=
end_prepare'
> > make: *** [vmlinux] Error 1
>=20
> Reported-by: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 207c433..1caa3c5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -582,7 +582,7 @@ config MFD_RC5T583
> =20
>  config MFD_SEC_CORE
>  	bool "SAMSUNG Electronics PMIC Series Support"
> -	depends on I2C=3Dy
> +	depends on I2C=3Dy && REGULATOR
>  	select MFD_CORE
>  	select REGMAP_I2C
>  	select REGMAP_IRQ

Can you send me something I can `git am` please?

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
