From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] power: reset: at91-shdwc: add new shutdown
 controller driver
Date: Wed, 16 Mar 2016 12:36:56 +0100
Message-ID: <56E94558.9010506@atmel.com>
References: <1457624260-30350-1-git-send-email-nicolas.ferre@atmel.com>
 <1457624260-30350-3-git-send-email-nicolas.ferre@atmel.com>
 <20160314202205.GA24894@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160314202205.GA24894-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 14/03/2016 21:22, Alexandre Belloni a =E9crit :
> On 10/03/2016 at 16:37:40 +0100, Nicolas Ferre wrote :
>> +ATMEL AT91 Alternative Shutdown Controller
>=20
> Can't that be sama5d2 instead of alternative?
>=20
>> +M:	Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> +S:	Supported
>> +F:	drivers/power/reset/at91-shdwc.c
>=20
> I would also use that in the filename. Because once there is a third
> shdwc, I'm not sure how you will be able to name it.
>=20
>> +config POWER_RESET_AT91_SHDWC
>=20
> I would also include that in the config name.
>=20
>> +	tristate "Atmel AT91 shutdown controller driver"
>> +	depends on ARCH_AT91 || COMPILE_TEST
>> +	default SOC_SAMA5
>> +	help
>> +	  This driver supports the alternate shutdown controller for some =
Atmel
>> +	  SAMA5 SoCs. It is present for example on SAMA5D2 SoC.
>> +
>=20
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/printk.h>
>> +
>> +#define SLOW_CLOCK_FREQ	32768
>> +
>> +#define AT91_SHDW_CR	0x00		/* Shut Down Control Register */
>> +#define AT91_SHDW_SHDW		BIT(0)			/* Shut Down command */
>> +#define AT91_SHDW_KEY		(0xa5UL << 24)		/* KEY Password */
>> +
>> +#define AT91_SHDW_MR	0x04		/* Shut Down Mode Register */
>> +#define AT91_SHDW_WKUPDBC_SHIFT	24
>> +#define AT91_SHDW_WKUPDBC_MASK	GENMASK(31, 16)
>> +#define AT91_SHDW_WKUPDBC(x)	(((x) << AT91_SHDW_WKUPDBC_SHIFT) \
>> +						& AT91_SHDW_WKUPDBC_MASK)
>> +
>> +#define AT91_SHDW_SR	0x08		/* Shut Down Status Register */
>> +#define AT91_SHDW_WKUPIS_SHIFT	16
>> +#define AT91_SHDW_WKUPIS_MASK	GENMASK(31, 16)
>> +#define AT91_SHDW_WKUPIS(x)	((1 << (x)) << AT91_SHDW_WKUPIS_SHIFT \
>> +						& AT91_SHDW_WKUPIS_MASK)
>> +
>> +#define AT91_SHDW_WUIR	0x0c		/* Shutdown Wake-up Inputs Register */
>> +#define AT91_SHDW_WKUPEN_MASK	GENMASK(15, 0)
>> +#define AT91_SHDW_WKUPEN(x)	((1 << (x)) & AT91_SHDW_WKUPEN_MASK)
>> +#define AT91_SHDW_WKUPT_SHIFT	16
>> +#define AT91_SHDW_WKUPT_MASK	GENMASK(31, 16)
>> +#define AT91_SHDW_WKUPT(x)	((1 << (x)) << AT91_SHDW_WKUPT_SHIFT \
>> +						& AT91_SHDW_WKUPT_MASK)
>> +
>> +#define SHDW_WK_PIN(reg, cfg)	((reg) & AT91_SHDW_WKUPIS((cfg)->wkup=
_pin_input))
>> +#define SHDW_RTCWK(reg, cfg)	(((reg) >> ((cfg)->sr_rtcwk_shift)) & =
0x1)
>> +#define SHDW_RTCWKEN(cfg)	(1 << ((cfg)->mr_rtcwk_shift))
>> +
>> +#define DBC_PERIOD_US(x)	DIV_ROUND_UP_ULL((1000000 * (x)), \
>> +							SLOW_CLOCK_FREQ)
>> +
>> +struct shdwc_config {
>> +	u8 wkup_pin_input;
>> +	u8 mr_rtcwk_shift;
>> +	u8 sr_rtcwk_shift;
>> +};
>> +
>> +struct shdwc {
>> +	struct shdwc_config *cfg;
>> +	void __iomem *at91_shdwc_base;
>> +};
>> +
>> +/*
>> + * Hold configuration here, cannot be more than one instance of the=
 driver
>> + * since pm_power_off itself is global.
>> + */
>> +static struct shdwc *at91_shdwc;
>> +static struct clk *sclk;
>> +
>> +static const unsigned long long sdwc_dbc_period[] =3D {
>> +	0, 3, 32, 512, 4096, 32768,
>> +};
>> +
>> +static void __init at91_wakeup_status(struct platform_device *pdev)
>> +{
>> +	struct shdwc *shdw =3D platform_get_drvdata(pdev);
>> +	u32 reg;
>> +	char *reason =3D "unknown";
>> +
>> +	reg =3D readl(shdw->at91_shdwc_base + AT91_SHDW_SR);
>> +
>> +	dev_dbg(&pdev->dev, "%s: status =3D %#x\n", __func__, reg);
>> +
>> +	/* Simple power-on, just bail out */
>> +	if (!reg)
>> +		return;
>> +
>> +	if (SHDW_WK_PIN(reg, shdw->cfg))
>> +		reason =3D "WKUP pin";
>> +	else if (SHDW_RTCWK(reg, shdw->cfg))
>> +		reason =3D "RTC";
>> +
>> +	pr_info("AT91: Wake-Up source: %s\n", reason);
>> +}
>> +
>> +static void at91_poweroff(void)
>> +{
>> +	writel(AT91_SHDW_KEY | AT91_SHDW_SHDW,
>> +			at91_shdwc->at91_shdwc_base + AT91_SHDW_CR);
>=20
> This is still not properly aligned :)

Ok for this one.


>> +}
>> +
>> +static u32 at91_shdwc_debouncer_value(struct platform_device *pdev,
>> +				      u32 in_period_us)
>> +{
>> +	int i;
>> +	int max_idx =3D ARRAY_SIZE(sdwc_dbc_period) - 1;
>> +	unsigned long long period_us;
>> +	unsigned long long max_period_us =3D DBC_PERIOD_US(sdwc_dbc_period=
[max_idx]);
>> +
>> +	if (in_period_us > max_period_us) {
>> +		dev_warn(&pdev->dev,
>> +			 "debouncer period %u too big, reduced to %llu us\n",
>> +			 in_period_us, max_period_us);
>> +		return max_idx;
>> +	}
>> +
>> +	for (i =3D max_idx - 1; i > 0; i--) {
>> +		period_us =3D DBC_PERIOD_US(sdwc_dbc_period[i]);
>> +		dev_dbg(&pdev->dev, "%s: ref[%d] =3D %llu\n",
>> +						__func__, i, period_us);
>=20
> Alignment is not correct.
>=20
>> +		if (in_period_us > period_us)
>> +			break;
>> +	}
>> +
>> +	return i + 1;
>> +}
>> +
>> +static u32 at91_shdwc_get_wakeup_input(struct platform_device *pdev=
,
>> +				       struct device_node *np)
>> +{
>> +	struct device_node *cnp;
>> +	u32 wk_input_mask;
>> +	u32 wuir =3D 0;
>> +	u32 wk_input;
>> +
>> +	for_each_child_of_node(np, cnp) {
>> +		if (of_property_read_u32(cnp, "reg", &wk_input)) {
>> +			dev_warn(&pdev->dev, "reg property is missing for %s\n",
>> +				 cnp->full_name);
>> +			continue;
>> +		}
>> +
>> +		wk_input_mask =3D 1 << wk_input;
>> +		if (!(wk_input_mask & AT91_SHDW_WKUPEN_MASK)) {
>> +			dev_warn(&pdev->dev,
>> +				 "wake-up input %d out of bounds ignore\n",
>> +				 wk_input);
>> +			continue;
>> +		}
>> +		wuir |=3D wk_input_mask;
>> +
>> +		if (of_property_read_bool(cnp, "atmel,wakeup-active-high"))
>> +			wuir |=3D AT91_SHDW_WKUPT(wk_input);
>> +
>> +		dev_dbg(&pdev->dev, "%s: (child %d) wuir =3D %#x\n",
>> +						__func__, wk_input, wuir);
>=20
> Alignment is not correct

I don't agree with you on the 2 last ones. In Documentation/CodingStyle=
,
it is said that:

"Chapter 2: Breaking long lines and strings
[..]
Descendants are always substantially shorter than the parent and
are placed substantially to the right."

Together with the 80 column requirement that I also fulfil, I think tha=
t
my code is well aligned.

So I keep it like this ;-)

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
