From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] rtc: mediatek: Add MT63xx RTC driver
Date: Mon, 16 Mar 2015 16:30:48 +0100
Message-ID: <20150316153048.GC10068@pengutronix.de>
References: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
 <1422437276-41334-3-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1422437276-41334-3-git-send-email-eddie.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie Huang <eddie.huang@mediatek.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, rtc-linux@googlegroups.com, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, yingjoe.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Eddie,

On Wed, Jan 28, 2015 at 05:27:56PM +0800, Eddie Huang wrote:
> From: Tianping Fang <tianping.fang@mediatek.com>
>=20
> Add Mediatek MT63xx RTC driver
MT6397?

> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index f15cddf..8ac52d8 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1427,6 +1427,16 @@ config RTC_DRV_MOXART
>  	   This driver can also be built as a module. If so, the module
>  	   will be called rtc-moxart
> =20
> +config RTC_DRV_MT63XX
> +	tristate "Mediatek Real Time Clock driver"
> +	depends on MFD_MT6397
I suggest:

	depends on MFD_MT6397 || COMPILE_TEST

(maybe + any hard dependencies you need for compilation).

> +	help
> +	  This selects the Mediatek(R) RTC driver, you should add support
> +	  for Mediatek MT6397 PMIC before select Mediatek(R) RTC driver.
> +
> +	  If you want to use Mediatek(R) RTC interface, select Y or M here.
> +	  If unsure, Please select N.
Given the dependency above I'd say choosing y here is fine. Instead of
recommending that I'd just drop this line.

> [...]
> +static u16 rtc_read(struct mt6397_rtc *rtc, u32 offset)
rtc_read is a bad name for a driver. There are already 6 functions with
this name in the kernel. Better use a unique prefix.

> [...]
> +static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
> +{
> +	struct mt6397_rtc *rtc =3D data;
> +	u16 irqsta, irqen;
> +
> +	mutex_lock(&rtc->lock);
> +	irqsta =3D rtc_read(rtc, RTC_IRQ_STA);
Do you really need to lock for a single read access?

> +	mutex_unlock(&rtc->lock);
> +
> +	if (irqsta & RTC_IRQ_STA_AL) {
> +		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
> +		irqen =3D irqsta & ~RTC_IRQ_EN_AL;
> +		rtc_write(rtc, RTC_IRQ_EN, irqen);
> +		rtc_write_trigger(rtc);
> +		return IRQ_HANDLED;
> +	}
> +
> +	return IRQ_NONE;
> +}
> +
> +static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm=
)
> +{
> +	unsigned long time;
> +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> +
> +	mutex_lock(&rtc->lock);
> +	do {
> +		tm->tm_sec =3D rtc_read(rtc, RTC_TC_SEC);
> +		tm->tm_min =3D rtc_read(rtc, RTC_TC_MIN);
> +		tm->tm_hour =3D rtc_read(rtc, RTC_TC_HOU);
> +		tm->tm_mday =3D rtc_read(rtc, RTC_TC_DOM);
> +		tm->tm_mon =3D rtc_read(rtc, RTC_TC_MTH);
> +		tm->tm_year =3D rtc_read(rtc, RTC_TC_YEA);
> +	} while (rtc_read(rtc, RTC_TC_SEC) < tm->tm_sec);
> +	mutex_unlock(&rtc->lock);
> +
> +	tm->tm_year +=3D RTC_MIN_YEAR_OFFSET;
> +	tm->tm_mon--;
> +	rtc_tm_to_time(tm, &time);
rtc_tm_to_time is deprecated, better use rtc_tm_to_time64.

> +	tm->tm_wday =3D (time / 86400 + 4) % 7;
> +
> +	return 0;
> +}
> +
> +static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> +
> +	tm->tm_year -=3D RTC_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;
> +	mutex_lock(&rtc->lock);
> +	rtc_write(rtc, RTC_TC_YEA, tm->tm_year);
> +	rtc_write(rtc, RTC_TC_MTH, tm->tm_mon);
> +	rtc_write(rtc, RTC_TC_DOM, tm->tm_mday);
> +	rtc_write(rtc, RTC_TC_HOU, tm->tm_hour);
> +	rtc_write(rtc, RTC_TC_MIN, tm->tm_min);
> +	rtc_write(rtc, RTC_TC_SEC, tm->tm_sec);
Is this racy? I.e. what happens if RTC_TC_SEC overflows just before you
write to it but after you wrote RTC_TC_MIN?

> +	rtc_write_trigger(rtc);
> +	mutex_unlock(&rtc->lock);
> +
> +	return 0;
> +}
> +
> +static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm =
*alm)
> +{
> +	struct rtc_time *tm =3D &alm->time;
> +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> +	u16 irqen, pdn2;
> +
> +	mutex_lock(&rtc->lock);
> +	irqen =3D rtc_read(rtc, RTC_IRQ_EN);
> +	pdn2 =3D rtc_read(rtc, RTC_PDN2);
> +	tm->tm_sec  =3D rtc_read(rtc, RTC_AL_SEC);
> +	tm->tm_min  =3D rtc_read(rtc, RTC_AL_MIN);
> +	tm->tm_hour =3D rtc_read(rtc, RTC_AL_HOU) & RTC_AL_HOU_MASK;
> +	tm->tm_mday =3D rtc_read(rtc, RTC_AL_DOM) & RTC_AL_DOM_MASK;
> +	tm->tm_mon  =3D rtc_read(rtc, RTC_AL_MTH) & RTC_AL_MTH_MASK;
> +	tm->tm_year =3D rtc_read(rtc, RTC_AL_YEA);
> +	mutex_unlock(&rtc->lock);
> +
> +	alm->enabled =3D !!(irqen & RTC_IRQ_EN_AL);
> +	alm->pending =3D !!(pdn2 & RTC_PDN2_PWRON_ALARM);
> +
> +	tm->tm_year +=3D RTC_MIN_YEAR_OFFSET;
> +	tm->tm_mon--;
> +
> +	return 0;
> +}
> +
> +static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *=
alm)
> +{
> +	struct rtc_time *tm =3D &alm->time;
> +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> +	u16 irqen;
> +
> +	tm->tm_year -=3D RTC_MIN_YEAR_OFFSET;
> +	tm->tm_mon++;
> +
> +	if (alm->enabled) {
> +		mutex_lock(&rtc->lock);
> +		rtc_write(rtc, RTC_AL_YEA, tm->tm_year);
> +		rtc_write(rtc, RTC_AL_MTH, (rtc_read(rtc, RTC_AL_MTH) &
> +				RTC_NEW_SPARE3) | tm->tm_mon);
This looks strange. Why doesn't RTC_NEW_SPARE3 contain the register
name? I would have expected:

	(rtc_read(rtc, RTC_AL_MTH) & ~RTC_AL_MTH_MASK) | tm->tm_mon;


> +		rtc_write(rtc, RTC_AL_DOM, (rtc_read(rtc, RTC_AL_DOM) &
> +				RTC_NEW_SPARE1) | tm->tm_mday);
> +		rtc_write(rtc, RTC_AL_HOU, (rtc_read(rtc, RTC_AL_HOU) &
> +				RTC_NEW_SPARE_FG_MASK) | tm->tm_hour);
> +		rtc_write(rtc, RTC_AL_MIN, tm->tm_min);
> +		rtc_write(rtc, RTC_AL_SEC, tm->tm_sec);
> +		rtc_write(rtc, RTC_AL_MASK, RTC_AL_MASK_DOW);
Is this racy? I.e. if the previous set alarm is

	2015-03-13 14:15:00

and you write

	2015-03.14 17:17:00

is it possible that this triggers an alarm if the update happens at

	2015-03-14 14:15:00

?

> +		rtc_write_trigger(rtc);
> +		irqen =3D rtc_read(rtc, RTC_IRQ_EN) | RTC_IRQ_EN_ONESHOT_AL;
> +		rtc_write(rtc, RTC_IRQ_EN, irqen);
> +		rtc_write_trigger(rtc);
> +		mutex_unlock(&rtc->lock);
	} else {
		/* disable alarm here */

> +	}
> +
> +	return 0;
> +}
> +
> +static struct rtc_class_ops mtk_rtc_ops =3D {
> +	.read_time  =3D mtk_rtc_read_time,
> +	.set_time   =3D mtk_rtc_set_time,
> +	.read_alarm =3D mtk_rtc_read_alarm,
> +	.set_alarm  =3D mtk_rtc_set_alarm,
> +};
> +
> +static int mtk_rtc_probe(struct platform_device *pdev)
> +{
> +	struct mt6397_chip *mt6397_chip =3D dev_get_drvdata(pdev->dev.paren=
t);
> +	struct mt6397_rtc *rtc;
> +	u32 reg[2];
> +	int ret =3D 0;
> +
> +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(struct mt6397_rtc), GFP_KER=
NEL);
> +	if (!rtc)
> +		return -ENOMEM;
> +
> +	ret =3D of_property_read_u32_array(pdev->dev.of_node, "reg", reg, 2=
);
> +	if (ret) {
> +		dev_err(&pdev->dev, "couldn't read rtc base address!\n");
> +		return -EINVAL;
> +	}
> +	rtc->addr_base =3D reg[0];
> +	rtc->addr_range =3D reg[1];
This looks strange, but maybe that's right as you reuse the parent's
regmap.

> +	rtc->regmap =3D mt6397_chip->regmap;
> +	rtc->dev =3D &pdev->dev;
> +	mutex_init(&rtc->lock);
> +
> +	platform_set_drvdata(pdev, rtc);
> +
> +	rtc->rtc_dev =3D rtc_device_register("mt6397-rtc", &pdev->dev,
> +				&mtk_rtc_ops, THIS_MODULE);
> +	if (IS_ERR(rtc->rtc_dev)) {
> +		dev_err(&pdev->dev, "register rtc device failed\n");
> +		return PTR_ERR(rtc->rtc_dev);
> +	}
> +
> +	rtc->irq =3D platform_get_irq(pdev, 0);
> +	if (rtc->irq < 0) {
platform_get_irq(pdev, 0) =3D 0 should be treated as error, too.

> +		ret =3D rtc->irq;
> +		goto out_rtc;
> +	}

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
