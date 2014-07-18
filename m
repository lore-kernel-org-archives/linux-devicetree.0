From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] rtc: sun6i: Add sun6i RTC driver
Date: Fri, 18 Jul 2014 10:07:18 +0200
Message-ID: <20140718080718.GI20328@lukather>
References: <1405323137-24287-1-git-send-email-wens@csie.org>
 <1405323137-24287-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k9xkV0rc9XGsukaG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405323137-24287-2-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--k9xkV0rc9XGsukaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 14, 2014 at 03:32:13PM +0800, Chen-Yu Tsai wrote:
> This patch introduces the driver for the RTC in the Allwinner A31 and
> A23 SoCs.
>=20
> Unlike the RTC found in A10/A20 SoCs, which was part of the timer, the
> RTC in A31/A23 are a separate hardware block, which also contain a few
> controls for the RTC block hardware (a regulator and RTC block GPIO pin
> latches), while also having separate interrupts for the alarms.

Do you plan on supporting those at some point?

It's also worth noting that the first registers are supposed to
control the source of the low frequency oscillator in the SoC, which
will probably be the most troublesome, since we need these clocks very
early on.

>=20
> The hardware is different enough to make a different driver for it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/sun6i-rtc.txt          |  17 +
>  drivers/rtc/Kconfig                                |   7 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-sun6i.c                            | 466 +++++++++++++++=
++++++
>  4 files changed, 491 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
>  create mode 100644 drivers/rtc/rtc-sun6i.c
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt b/Docume=
ntation/devicetree/bindings/rtc/sun6i-rtc.txt
> new file mode 100644
> index 0000000..b18927c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
> @@ -0,0 +1,17 @@
> +* sun6i Real Time Clock
> +
> +RTC controller for the Allwinner A31
> +
> +Required properties:
> +- compatible : Should be "allwinner,sun6i-a31-rtc"
> +- reg: physical base address of the controller and length of memory mapp=
ed
> +  region.
> +- interrupts: IRQ line for the RTC alarm 0.
> +
> +Example:
> +
> +rtc: rtc@01f00000 {
> +	compatible =3D "allwinner,sun6i-a31-rtc";
> +	reg =3D <0x01f00000 0x54>;
> +	interrupts =3D <0 40 4>;
> +};
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 0754f5c..5b3910a 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1167,6 +1167,13 @@ config RTC_DRV_SUN4V
>  	  If you say Y here you will get support for the Hypervisor
>  	  based RTC on SUN4V systems.
> =20
> +config RTC_DRV_SUN6I
> +	tristate "Allwinner sun6i/sun8i RTC"

I'm half convinced about an exhaustive list here. That IP will also
probably be used by sun9i, and sun10i if it ever exists, etc. And you
exhaustive list won't be anymore.

I'd rather just mention the A31, like we do for the DT.

> +	depends on MACH_SUN6I || MACH_SUN8I
> +	help
> +	  If you say Y here you will get support for the RTC found on
> +	  Allwinner A31/A23.
> +
>  config RTC_DRV_SUNXI
>  	tristate "Allwinner sun4i/sun7i RTC"
>  	depends on ARCH_SUNXI
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 70347d0..a47df29 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_RTC_DRV_STARFIRE)	+=3D rtc-starfire.o
>  obj-$(CONFIG_RTC_DRV_STK17TA8)	+=3D rtc-stk17ta8.o
>  obj-$(CONFIG_RTC_DRV_STMP)	+=3D rtc-stmp3xxx.o
>  obj-$(CONFIG_RTC_DRV_SUN4V)	+=3D rtc-sun4v.o
> +obj-$(CONFIG_RTC_DRV_SUN6I)	+=3D rtc-sun6i.o
>  obj-$(CONFIG_RTC_DRV_SUNXI)	+=3D rtc-sunxi.o
>  obj-$(CONFIG_RTC_DRV_TEGRA)	+=3D rtc-tegra.o
>  obj-$(CONFIG_RTC_DRV_TEST)	+=3D rtc-test.o
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> new file mode 100644
> index 0000000..fabd019
> --- /dev/null
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -0,0 +1,466 @@
> +/*
> + * An RTC driver for Allwinner A31/A23
> + *
> + * Copyright (c) 2014, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> + *
> + * based on rtc-sunxi.c
> + *
> + * An RTC driver for Allwinner A10/A20
> + *
> + * Copyright (c) 2013, Carlo Caione <carlo.caione-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/types.h>
> +
> +/* Control register */
> +#define SUN6I_LOSC_CTRL				0x0000
> +#define SUN6I_LOSC_CTRL_ALM_DHMS_ACC		BIT(9)
> +#define SUN6I_LOSC_CTRL_RTC_HMS_ACC		BIT(8)
> +#define SUN6I_LOSC_CTRL_RTC_YMD_ACC		BIT(7)
> +#define SUN6I_LOSC_CTRL_ACC_MASK		(BIT(9) | BIT(8) | BIT(7))

GENMASK maybe?

> +
> +/* RTC */
> +#define SUN6I_RTC_YMD				0x0010
> +#define SUN6I_RTC_HMS				0x0014
> +
> +/* Alarm 0 (counter) */
> +#define SUN6I_ALRM_COUNTER			0x0020
> +#define SUN6I_ALRM_CUR_VAL			0x0024
> +#define SUN6I_ALRM_EN				0x0028
> +#define SUN6I_ALRM_EN_CNT_EN			BIT(0)
> +#define SUN6I_ALRM_IRQ_EN			0x002c
> +#define SUN6I_ALRM_IRQ_EN_CNT_IRQ_EN		BIT(0)
> +#define SUN6I_ALRM_IRQ_STA			0x0030
> +#define SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND		BIT(0)
> +
> +/* Alarm 1 (wall clock) */
> +#define SUN6I_ALRM1_EN				0x0044
> +#define SUN6I_ALRM1_IRQ_EN			0x0048
> +#define SUN6I_ALRM1_IRQ_STA			0x004c
> +#define SUN6I_ALRM1_IRQ_STA_WEEK_IRQ_PEND	BIT(0)
> +
> +/* Alarm config */
> +#define SUN6I_ALARM_CONFIG			0x0050
> +#define SUN6I_ALARM_CONFIG_WAKEUP		BIT(0)
> +
> +/* days / hours are 5 bit wide */
> +#define SUN6I_MASK_DH				0x0000001f
> +/* seconds / minutes / years are 6 bit wide */
> +#define SUN6I_MASK_SMY				0x0000003f
> +/* months are 4 bit wide */
> +#define SUN6I_MASK_M				0x0000000f
> +/* leap year is single bit */
> +#define SUN6I_MASK_LY				0x00000001

Ditto

> +
> +#define SUN6I_GET(x, mask, shift)		(((x) & ((mask) << (shift))) \
> +							>> (shift))
> +
> +#define SUN6I_SET(x, mask, shift)		(((x) & (mask)) << (shift))

Wouldn't it be easier to have the mask already shifted?

> +
> +/*
> + * Get date values
> + */
> +#define SUN6I_DATE_GET_DAY_VALUE(x)		SUN6I_GET(x, SUN6I_MASK_DH, 0)
> +#define SUN6I_DATE_GET_MON_VALUE(x)		SUN6I_GET(x, SUN6I_MASK_M, 8)
> +#define SUN6I_DATE_GET_YEAR_VALUE(x)		SUN6I_GET(x, SUN6I_MASK_SMY, 16)
> +
> +/*
> + * Get time values
> + */
> +#define SUN6I_TIME_GET_SEC_VALUE(x)		SUN6I_GET(x, SUN6I_MASK_SMY, 0)
> +#define SUN6I_TIME_GET_MIN_VALUE(x)		SUN6I_GET(x, SUN6I_MASK_SMY, 8)
> +#define SUN6I_TIME_GET_HOUR_VALUE(x)		SUN6I_GET(x, SUN6I_MASK_DH, 16)
> +
> +/*
> + * Set date values
> + */
> +#define SUN6I_DATE_SET_DAY_VALUE(x)		SUN6I_DATE_GET_DAY_VALUE(x)
> +#define SUN6I_DATE_SET_MON_VALUE(x)		SUN6I_SET(x, SUN6I_MASK_M, 8)
> +#define SUN6I_DATE_SET_YEAR_VALUE(x)		SUN6I_SET(x, SUN6I_MASK_SMY, 16)
> +#define SUN6I_LEAP_SET_VALUE(x)			SUN6I_SET(x, SUN6I_MASK_LY, 22)
> +
> +/*
> + * Set time values
> + */
> +#define SUN6I_TIME_SET_SEC_VALUE(x)		SUN6I_TIME_GET_SEC_VALUE(x)
> +#define SUN6I_TIME_SET_MIN_VALUE(x)		SUN6I_SET(x, SUN6I_MASK_SMY, 8)
> +#define SUN6I_TIME_SET_HOUR_VALUE(x)		SUN6I_SET(x, SUN6I_MASK_DH, 16)
> +
> +/*
> + * The year parameter passed to the driver is usually an offset relative=
 to
> + * the year 1900. This macro is used to convert this offset to another o=
ne
> + * relative to the minimum year allowed by the hardware.
> + *
> + * The year range is 1970 - 2033. This range is selected to match Allwin=
ner's
> + * driver, even though it is somewhat limited.
> + */
> +#define SUN6I_YEAR_MIN				1970
> +#define SUN6I_YEAR_MAX				2033
> +#define SUN6I_YEAR_OFF				(SUN6I_YEAR_MIN - 1900)
> +
> +struct sun6i_rtc_dev {
> +	struct rtc_device *rtc;
> +	struct device *dev;
> +	void __iomem *base;
> +	int irq;
> +	unsigned long alarm;
> +};
> +
> +static irqreturn_t sun6i_rtc_alarmirq(int irq, void *id)
> +{
> +	struct sun6i_rtc_dev *chip =3D (struct sun6i_rtc_dev *) id;
> +	u32 val;
> +
> +	val =3D readl(chip->base + SUN6I_ALRM_IRQ_STA);
> +
> +	if (val & SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND) {
> +		val |=3D SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND;
> +		writel(val, chip->base + SUN6I_ALRM_IRQ_STA);
> +
> +		rtc_update_irq(chip->rtc, 1, RTC_AF | RTC_IRQF);
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static void sun6i_rtc_setaie(int to, struct sun6i_rtc_dev *chip)
> +{
> +	u32 alrm_val =3D 0;
> +	u32 alrm_irq_val =3D 0;
> +	u32 alrm_wake_val =3D 0;
> +
> +	if (to) {
> +		alrm_val =3D SUN6I_ALRM_EN_CNT_EN;
> +		alrm_irq_val =3D SUN6I_ALRM_IRQ_EN_CNT_IRQ_EN;
> +		alrm_wake_val =3D SUN6I_ALARM_CONFIG_WAKEUP;
> +	} else {
> +		writel(SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND,
> +				chip->base + SUN6I_ALRM_IRQ_STA);
> +	}
> +
> +	writel(alrm_val, chip->base + SUN6I_ALRM_EN);
> +	writel(alrm_irq_val, chip->base + SUN6I_ALRM_IRQ_EN);
> +	writel(alrm_wake_val, chip->base + SUN6I_ALARM_CONFIG);
> +}
> +
> +static int sun6i_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
> +{
> +	struct sun6i_rtc_dev *chip =3D dev_get_drvdata(dev);
> +	u32 date, time;
> +
> +	/*
> +	 * read again in case it changes
> +	 */
> +	do {
> +		date =3D readl(chip->base + SUN6I_RTC_YMD);
> +		time =3D readl(chip->base + SUN6I_RTC_HMS);
> +	} while ((date !=3D readl(chip->base + SUN6I_RTC_YMD)) ||
> +		 (time !=3D readl(chip->base + SUN6I_RTC_HMS)));
> +
> +	rtc_tm->tm_sec  =3D SUN6I_TIME_GET_SEC_VALUE(time);
> +	rtc_tm->tm_min  =3D SUN6I_TIME_GET_MIN_VALUE(time);
> +	rtc_tm->tm_hour =3D SUN6I_TIME_GET_HOUR_VALUE(time);
> +
> +	rtc_tm->tm_mday =3D SUN6I_DATE_GET_DAY_VALUE(date);
> +	rtc_tm->tm_mon  =3D SUN6I_DATE_GET_MON_VALUE(date);
> +	rtc_tm->tm_year =3D SUN6I_DATE_GET_YEAR_VALUE(date);
> +
> +	rtc_tm->tm_mon  -=3D 1;
> +
> +	/*
> +	 * switch from (data_year->min)-relative offset to
> +	 * a (1900)-relative one
> +	 */

I guess the reference to the structure field is not relevant anymore

> +	rtc_tm->tm_year +=3D SUN6I_YEAR_OFF;
> +
> +	return rtc_valid_tm(rtc_tm);
> +}
> +
> +static int sun6i_rtc_getalarm(struct device *dev, struct rtc_wkalrm *wka=
lrm)
> +{
> +	struct sun6i_rtc_dev *chip =3D dev_get_drvdata(dev);
> +	u32 alrm_st;
> +	u32 alrm_en;
> +
> +	alrm_en =3D readl(chip->base + SUN6I_ALRM_IRQ_EN);
> +	alrm_st =3D readl(chip->base + SUN6I_ALRM_IRQ_STA);
> +	wkalrm->enabled =3D !!(alrm_en & SUN6I_ALRM_EN_CNT_EN);
> +	wkalrm->pending =3D !!(alrm_st & SUN6I_ALRM_EN_CNT_EN);
> +	rtc_time_to_tm(chip->alarm, &wkalrm->time);
> +
> +	return 0;
> +}
> +
> +static int sun6i_rtc_setalarm(struct device *dev, struct rtc_wkalrm *wka=
lrm)
> +{
> +	struct sun6i_rtc_dev *chip =3D dev_get_drvdata(dev);
> +	struct rtc_time *alrm_tm =3D &wkalrm->time;
> +	struct rtc_time tm_now;
> +	unsigned long time_now =3D 0;
> +	unsigned long time_set =3D 0;
> +	unsigned long time_gap =3D 0;
> +	int ret =3D 0;
> +
> +	ret =3D sun6i_rtc_gettime(dev, &tm_now);
> +	if (ret < 0) {
> +		dev_err(dev, "Error in getting time\n");
> +		return -EINVAL;
> +	}
> +
> +	rtc_tm_to_time(alrm_tm, &time_set);
> +	rtc_tm_to_time(&tm_now, &time_now);
> +	if (time_set <=3D time_now) {
> +		dev_err(dev, "Date to set in the past\n");
> +		return -EINVAL;
> +	}
> +
> +	time_gap =3D time_set - time_now;
> +
> +	if (time_gap > U32_MAX) {
> +		dev_err(dev, "Date too far in the future\n");
> +		return -EINVAL;
> +	}
> +
> +	sun6i_rtc_setaie(0, chip);
> +	writel(0, chip->base + SUN6I_ALRM_COUNTER);
> +	usleep_range(100, 300);
> +
> +	writel(time_gap, chip->base + SUN6I_ALRM_COUNTER);
> +	chip->alarm =3D time_set;
> +
> +	sun6i_rtc_setaie(wkalrm->enabled, chip);
> +
> +	return 0;
> +}
> +
> +static int sun6i_rtc_wait(struct sun6i_rtc_dev *chip, int offset,
> +			  unsigned int mask, unsigned int ms_timeout)
> +{
> +	const unsigned long timeout =3D jiffies + msecs_to_jiffies(ms_timeout);
> +	u32 reg;
> +
> +	do {
> +		reg =3D readl(chip->base + offset);
> +		reg &=3D mask;
> +
> +		if (!reg)
> +			return 0;
> +
> +	} while (time_before(jiffies, timeout));
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int sun6i_rtc_settime(struct device *dev, struct rtc_time *rtc_tm)
> +{
> +	struct sun6i_rtc_dev *chip =3D dev_get_drvdata(dev);
> +	u32 date =3D 0;
> +	u32 time =3D 0;
> +	int year;
> +
> +	/*
> +	 * the input rtc_tm->tm_year is the offset relative to 1900. We use
> +	 * the SUN6I_YEAR_OFF macro to rebase it with respect to the min year
> +	 * allowed by the hardware
> +	 */
> +
> +	year =3D rtc_tm->tm_year + 1900;
> +	if (year < SUN6I_YEAR_MIN || year > SUN6I_YEAR_MAX) {
> +		dev_err(dev, "rtc only supports year in range %d - %d\n",
> +				SUN6I_YEAR_MIN, SUN6I_YEAR_MAX);
> +		return -EINVAL;
> +	}
> +
> +	rtc_tm->tm_year -=3D SUN6I_YEAR_OFF;
> +	rtc_tm->tm_mon +=3D 1;
> +
> +	date =3D SUN6I_DATE_SET_DAY_VALUE(rtc_tm->tm_mday) |
> +		SUN6I_DATE_SET_MON_VALUE(rtc_tm->tm_mon)  |
> +		SUN6I_DATE_SET_YEAR_VALUE(rtc_tm->tm_year);
> +
> +	if (is_leap_year(year))
> +		date |=3D SUN6I_LEAP_SET_VALUE(1);
> +
> +	time =3D SUN6I_TIME_SET_SEC_VALUE(rtc_tm->tm_sec)  |
> +		SUN6I_TIME_SET_MIN_VALUE(rtc_tm->tm_min)  |
> +		SUN6I_TIME_SET_HOUR_VALUE(rtc_tm->tm_hour);
> +
> +	/* Check whether registers are writable */
> +	if (sun6i_rtc_wait(chip, SUN6I_LOSC_CTRL,
> +				SUN6I_LOSC_CTRL_ACC_MASK, 50)) {
> +		dev_err(dev, "rtc is still busy.\n");
> +		return -EBUSY;
> +	}
> +
> +	writel(time, chip->base + SUN6I_RTC_HMS);
> +
> +	/*
> +	 * After writing the RTC HH-MM-SS register, the
> +	 * SUN6I_LOSC_CTRL_RTC_HMS_ACC bit is set and it will not
> +	 * be cleared until the real writing operation is finished
> +	 */
> +
> +	if (sun6i_rtc_wait(chip, SUN6I_LOSC_CTRL,
> +				SUN6I_LOSC_CTRL_RTC_HMS_ACC, 50)) {
> +		dev_err(dev, "Failed to set rtc time.\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel(date, chip->base + SUN6I_RTC_YMD);
> +
> +	/*
> +	 * After writing the RTC YY-MM-DD register, the
> +	 * SUN6I_LOSC_CTRL_RTC_YMD_ACC bit is set and it will not
> +	 * be cleared until the real writing operation is finished
> +	 */
> +
> +	if (sun6i_rtc_wait(chip, SUN6I_LOSC_CTRL,
> +				SUN6I_LOSC_CTRL_RTC_YMD_ACC, 50)) {
> +		dev_err(dev, "Failed to set rtc time.\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sun6i_rtc_alarm_irq_enable(struct device *dev, unsigned int e=
nabled)
> +{
> +	struct sun6i_rtc_dev *chip =3D dev_get_drvdata(dev);
> +
> +	if (!enabled)
> +		sun6i_rtc_setaie(enabled, chip);
> +
> +	return 0;
> +}
> +
> +static const struct rtc_class_ops sun6i_rtc_ops =3D {
> +	.read_time		=3D sun6i_rtc_gettime,
> +	.set_time		=3D sun6i_rtc_settime,
> +	.read_alarm		=3D sun6i_rtc_getalarm,
> +	.set_alarm		=3D sun6i_rtc_setalarm,
> +	.alarm_irq_enable	=3D sun6i_rtc_alarm_irq_enable
> +};
> +
> +static const struct of_device_id sun6i_rtc_dt_ids[] =3D {
> +	{ .compatible =3D "allwinner,sun6i-a31-rtc" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);

I guess you can move this down just before the platform_driver
declaration if you don't need it in probe.

> +
> +static int sun6i_rtc_probe(struct platform_device *pdev)
> +{
> +	struct sun6i_rtc_dev *chip;
> +	struct resource *res;
> +	int ret;
> +
> +	chip =3D devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, chip);
> +	chip->dev =3D &pdev->dev;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	chip->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(chip->base))
> +		return PTR_ERR(chip->base);
> +
> +	chip->irq =3D platform_get_irq(pdev, 0);
> +	if (chip->irq < 0) {
> +		dev_err(&pdev->dev, "No IRQ resource\n");
> +		return chip->irq;
> +	}

Newline

> +	ret =3D devm_request_irq(&pdev->dev, chip->irq, sun6i_rtc_alarmirq,
> +			0, dev_name(&pdev->dev), chip);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Could not request IRQ\n");
> +		return ret;
> +	}
> +
> +	/* clear the alarm counter value */
> +	writel(0, chip->base + SUN6I_ALRM_COUNTER);
> +
> +	/* disable counter alarm */
> +	writel(0, chip->base + SUN6I_ALRM_EN);
> +
> +	/* disable counter alarm interrupt */
> +	writel(0, chip->base + SUN6I_ALRM_IRQ_EN);
> +
> +	/* disable week alarm */
> +	writel(0, chip->base + SUN6I_ALRM1_EN);
> +
> +	/* disable week alarm interrupt */
> +	writel(0, chip->base + SUN6I_ALRM1_IRQ_EN);
> +
> +	/* clear counter alarm pending interrupts */
> +	writel(SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND, chip->base +
> +			SUN6I_ALRM_IRQ_STA);
> +
> +	/* clear week alarm pending interrupts */
> +	writel(SUN6I_ALRM1_IRQ_STA_WEEK_IRQ_PEND, chip->base +
> +			SUN6I_ALRM1_IRQ_STA);
> +
> +	/* disable alarm wakeup */
> +	writel(0, chip->base + SUN6I_ALARM_CONFIG);
> +
> +	chip->rtc =3D rtc_device_register("rtc-sun6i", &pdev->dev,
> +			&sun6i_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(chip->rtc)) {
> +		dev_err(&pdev->dev, "unable to register device\n");
> +		return PTR_ERR(chip->rtc);
> +	}
> +
> +	dev_info(&pdev->dev, "RTC enabled\n");
> +
> +	return 0;
> +}
> +
> +static int sun6i_rtc_remove(struct platform_device *pdev)
> +{
> +	struct sun6i_rtc_dev *chip =3D platform_get_drvdata(pdev);
> +
> +	rtc_device_unregister(chip->rtc);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver sun6i_rtc_driver =3D {
> +	.probe		=3D sun6i_rtc_probe,
> +	.remove		=3D sun6i_rtc_remove,
> +	.driver		=3D {
> +		.name		=3D "sun6i-rtc",
> +		.owner		=3D THIS_MODULE,
> +		.of_match_table =3D sun6i_rtc_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(sun6i_rtc_driver);
> +
> +MODULE_DESCRIPTION("sun6i RTC driver");
> +MODULE_AUTHOR("Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.0.1
>=20

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--k9xkV0rc9XGsukaG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTyNW2AAoJEBx+YmzsjxAgZcUP/3aGWDM4Q5G4VJ0HJE/ORJY6
gZ6qGlzO3E5GmgT5u+MKeQohYbOSDj+xoS1UVFJD0VvYuPQDSLG7VpkUnaQT9U3O
bTSvRV8XJHPPq+Q/J62hGQz2ymGIcccTLm+pDMUKHbFctUXg3CTNYsW1q64C6Udv
ciKdSKhIDBxZCraal5pKjIqDgK1MODuVBsgDNnT7eagFiR8AxnC+Of8CoEd7agW3
S/dYF8Hw5i8+eouA6HxJMQkFsDez4KxkY1b57rmcJjM+6Xgz6YTyAerjH9F/XeJ6
QmJANhnsk+7Y6HSkQnbjetU41026B30By3f9vezJ4Y3wxosS/c9zNnvo9kLuF9fx
eIJ1g8UD1UIA6vBLithAYAiH8ux2Hw+x1Zxgvok5VJNOn1jNIgjfHA/4apPZ6oDU
NvHASW1QGompE0yx1RSvaJL3GjB/+TO302pRhz/UphcfcGXAWlaHlYlcK++Jcjpo
7SgB53teHsq5uC79Z9hBp68/RWVqqqtTV21h+NS/jKgPUYPSAg/kOQi1mGnt8tUp
qnhvHaG6m1HhCkh1DJQ4QAIrZ/SJLFi/BWuGx1t4RikM9eQZxNCE5/QMGhWAyxyT
IBclfHh/tP1w1FvBmXgtxFqNQ1EPFEArHg8h1ibfreq4nzy0jjLWelglc8IIgTVL
fFeSJPtxAlti1RDJ0yjC
=ETs4
-----END PGP SIGNATURE-----

--k9xkV0rc9XGsukaG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
