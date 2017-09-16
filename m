From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/6] iio: adc: sun4i-gpadc-iio: add
 support for H3 thermal sensor
Date: Sat, 16 Sep 2017 11:45:47 +0200
Message-ID: <445ea236-35e9-8d5a-e580-b2bdcf5f7776@free-electrons.com>
References: <20170914145251.21784-1-icenowy@aosc.io>
 <20170914145251.21784-5-icenowy@aosc.io>
Reply-To: quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBTHF6PGQKGQE35BLWZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170914145251.21784-5-icenowy-h8G6r0blFSE@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Icenowy,

On 14/09/2017 16:52, Icenowy Zheng wrote:
> This adds support for the Allwinner H3 thermal sensor.
> 
> Allwinner H3 has a thermal sensor like the one in A33, but have its
> registers nearly all re-arranged, sample clock moved to CCU and a pair
> of bus clock and reset added. It's also the base of newer SoCs' thermal
> sensors.
> 
> The thermal sensors on A64 and H5 is like the one on H3, but with of
> course different formula factors.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v4:
> - Splitted out some code refactors.
> - Code sequence changed back. (The gpadc_data went back to the start of
>   the source file)
> 
>  drivers/iio/adc/sun4i-gpadc-iio.c | 48 +++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/sun4i-gpadc.h   | 27 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
[...]
> diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4i-gpadc.h
> index 78d31984a222..5c2a12101052 100644
> --- a/include/linux/mfd/sun4i-gpadc.h
> +++ b/include/linux/mfd/sun4i-gpadc.h
[...]
> +#define SUN8I_H3_GPADC_CTRL2_T_ACQ1(x)			((GENMASK(15, 0) * (x)) << 16)
> +

You want to replace * by &.

((GENMASK(15, 0) & (x)) << 16)

Would ((GENMASK(31, 16) & ((x) << 16)) make the bits you set even more
obvious?

>  #define SUN4I_GPADC_CTRL3				0x0c
> +/*
> + * This register is named "Average filter Control Register" in H3 Datasheet,
> + * but the register's definition is the same as the old CTRL3 register.
> + */
> +#define SUN8I_H3_GPADC_CTRL3				0x70
>  

I would name it as it is in the documentation:
SUN8I_H3_THS_FILTER

No need for comments then.

>  #define SUN4I_GPADC_CTRL3_FILTER_EN			BIT(2)
>  #define SUN4I_GPADC_CTRL3_FILTER_TYPE(x)		(GENMASK(1, 0) & (x))
> @@ -71,6 +84,13 @@
>  #define SUN4I_GPADC_INT_FIFOC_TP_UP_IRQ_EN		BIT(1)
>  #define SUN4I_GPADC_INT_FIFOC_TP_DOWN_IRQ_EN		BIT(0)
>  
> +#define SUN8I_H3_GPADC_INTC				0x44
> +
> +#define SUN8I_H3_GPADC_INTC_TEMP_PERIOD(x)		((GENMASK(19, 0) & (x)) << 12)
> +#define SUN8I_H3_GPADC_INTC_TEMP_DATA			BIT(8)
> +#define SUN8I_H3_GPADC_INTC_TEMP_SHUT			BIT(4)
> +#define SUN8I_H3_GPADC_INTC_TEMP_ALARM			BIT(0)
> +

Since it isn't an ADC anymore but rather just a THS, why don't you use
SUN8I_H3_THS instead of SUN8I_H3_GPADC? That way, it also matches the
datasheet.

>  #define SUN4I_GPADC_INT_FIFOS				0x14
>  
>  #define SUN4I_GPADC_INT_FIFOS_TEMP_DATA_PENDING		BIT(18)
> @@ -80,9 +100,16 @@
>  #define SUN4I_GPADC_INT_FIFOS_TP_UP_PENDING		BIT(1)
>  #define SUN4I_GPADC_INT_FIFOS_TP_DOWN_PENDING		BIT(0)
>  
> +#define SUN8I_H3_GPADC_INTS				0x44

0x48

[...]

1) You're not using irqs, why would you define registers that will never
be used?

2) Why aren't you using irqs? I remember we discussed on IRC that you
had some problems with the H3 when resuming or when probing the driver.
The register would have a zero in it until you have a first sample that
arrived (i.e. after the sample rate you set with T_ACQ) that would make
the thermal framework panic since the thermal sensor would return
something way too hot and shutdown your board?

The H3 apparently supports IRQs, why do you not support them for the
temperature? They might be broken as it is on A33 but then it might be a
good idea to write it down in a comment in the driver (and not adding
the unused registers in the header file) or at least in the commit log.

3) Now that you have support for clocks, wouldn't it be a good idea to
disable them during suspend?

Thanks,
Quentin
-- 
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
