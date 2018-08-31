From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 04/30] iio: adc: Kconfig: Update Kconfig
 to new build options
Date: Fri, 31 Aug 2018 10:32:31 +0200
Message-ID: <20180831083231.gnxoxadfy4fwubyy@flea>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-5-embed3d@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xj25ukd2kjijrnts"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBKX2UPOAKGQESJIZLLY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180830154518.29507-5-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xj25ukd2kjijrnts
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Aug 30, 2018 at 05:44:52PM +0200, Philipp Rossak wrote:
> Since we are merging the mfd driver into the iio adc driver we need to
> update the Kconfig build options.

Most of your commit logs a pretty short, and this is an issue for
people lacking context. This would be the reviewers, but also users
bisecting to see where there's a bug, or you in a couple of years from
now :)

Every commit log should be as complete as possible. In this case, you
are saying what you are doing, but this is actually redundant with the
patch, I can already tell what you are doing by reading the rest of
the mail. However, what is really important is *why* you are doing it.

> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/iio/adc/Kconfig | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 9da79070357c..5d0cffd6d2e4 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -713,13 +713,16 @@ config STX104
>  	  array module parameter.
>  
>  config SUN4I_GPADC
> -	tristate "Support for the Allwinner SoCs GPADC"
> +	tristate "Allwinner sunxi platforms' GPADC/Thermal driver"

I'm really not sure this is worth updating

> +	select REGMAP_MMIO
> +	select REGMAP_IRQ
>  	depends on IIO
> -	depends on MFD_SUN4I_GPADC || MACH_SUN8I
> -	depends on THERMAL || !THERMAL_OF
> +	depends on ARCH_SUNXI || MACH_SUN8I
> +	depends on THERMAL && THERMAL_OF

For example, why you are changing the thermal dependency is not really
obvious to anyone.

>  	help
>  	  Say yes here to build support for Allwinner (A10, A13 and A31) SoCs
> -	  GPADC. This ADC provides 4 channels which can be used as an ADC or as
> +	  GPADC or newer SOCs (A33, H3, A83T, ...) Thermal sensor driver.
> +	  This ADC provides 4 channels which can be used as an ADC or as

I'm not sure this is worth updating either, especially when there's
information that has been dropped.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--xj25ukd2kjijrnts--
