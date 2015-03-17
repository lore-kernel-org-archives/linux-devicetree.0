From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] rtc: mediatek: Add MT63xx RTC driver
Date: Tue, 17 Mar 2015 20:31:14 +0800
Message-ID: <1426595474.24415.18.camel@mtksdaap41>
References: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
	 <1422437276-41334-3-git-send-email-eddie.huang@mediatek.com>
	 <20150316153048.GC10068@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150316153048.GC10068-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tianping Fang <tianping.fang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Uwe,

Thanks your review.

On Mon, 2015-03-16 at 16:30 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Eddie,
>=20
> On Wed, Jan 28, 2015 at 05:27:56PM +0800, Eddie Huang wrote:
> > From: Tianping Fang <tianping.fang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >=20
> > Add Mediatek MT63xx RTC driver
> MT6397?

Yes, it is better to use MT6397

> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index f15cddf..8ac52d8 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -1427,6 +1427,16 @@ config RTC_DRV_MOXART
> >  	   This driver can also be built as a module. If so, the module
> >  	   will be called rtc-moxart
> > =20
> > +config RTC_DRV_MT63XX
> > +	tristate "Mediatek Real Time Clock driver"
> > +	depends on MFD_MT6397
> I suggest:
>=20
> 	depends on MFD_MT6397 || COMPILE_TEST
>=20
> (maybe + any hard dependencies you need for compilation).

OK, will fix it

>=20
> > +	help
> > +	  This selects the Mediatek(R) RTC driver, you should add support
> > +	  for Mediatek MT6397 PMIC before select Mediatek(R) RTC driver.
> > +
> > +	  If you want to use Mediatek(R) RTC interface, select Y or M her=
e.
> > +	  If unsure, Please select N.
> Given the dependency above I'd say choosing y here is fine. Instead o=
f
> recommending that I'd just drop this line.

ok, will drop.

>=20
> > [...]
> > +static u16 rtc_read(struct mt6397_rtc *rtc, u32 offset)
> rtc_read is a bad name for a driver. There are already 6 functions wi=
th
> this name in the kernel. Better use a unique prefix.

I will use prefix mtk_

>=20
> > [...]
> > +static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
> > +{
> > +	struct mt6397_rtc *rtc =3D data;
> > +	u16 irqsta, irqen;
> > +
> > +	mutex_lock(&rtc->lock);
> > +	irqsta =3D rtc_read(rtc, RTC_IRQ_STA);
> Do you really need to lock for a single read access?

I think this lock is necessary, because other thread may access rtc
register at the same time, for example, call mtk_rtc_set_alarm to modif=
y
alarm time.

>=20
> > +	mutex_unlock(&rtc->lock);
> > +
> > +	if (irqsta & RTC_IRQ_STA_AL) {
> > +		rtc_update_irq(rtc->rtc_dev, 1, RTC_IRQF | RTC_AF);
> > +		irqen =3D irqsta & ~RTC_IRQ_EN_AL;
> > +		rtc_write(rtc, RTC_IRQ_EN, irqen);
> > +		rtc_write_trigger(rtc);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	return IRQ_NONE;
> > +}
> > +
> > +static int mtk_rtc_read_time(struct device *dev, struct rtc_time *=
tm)
> > +{
> > +	unsigned long time;
> > +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +	mutex_lock(&rtc->lock);
> > +	do {
> > +		tm->tm_sec =3D rtc_read(rtc, RTC_TC_SEC);
> > +		tm->tm_min =3D rtc_read(rtc, RTC_TC_MIN);
> > +		tm->tm_hour =3D rtc_read(rtc, RTC_TC_HOU);
> > +		tm->tm_mday =3D rtc_read(rtc, RTC_TC_DOM);
> > +		tm->tm_mon =3D rtc_read(rtc, RTC_TC_MTH);
> > +		tm->tm_year =3D rtc_read(rtc, RTC_TC_YEA);
> > +	} while (rtc_read(rtc, RTC_TC_SEC) < tm->tm_sec);
> > +	mutex_unlock(&rtc->lock);
> > +
> > +	tm->tm_year +=3D RTC_MIN_YEAR_OFFSET;
> > +	tm->tm_mon--;
> > +	rtc_tm_to_time(tm, &time);
> rtc_tm_to_time is deprecated, better use rtc_tm_to_time64.

OK, will change to rtc_tm_to_time64

>=20
> > +	tm->tm_wday =3D (time / 86400 + 4) % 7;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_rtc_set_time(struct device *dev, struct rtc_time *t=
m)
> > +{
> > +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> > +
> > +	tm->tm_year -=3D RTC_MIN_YEAR_OFFSET;
> > +	tm->tm_mon++;
> > +	mutex_lock(&rtc->lock);
> > +	rtc_write(rtc, RTC_TC_YEA, tm->tm_year);
> > +	rtc_write(rtc, RTC_TC_MTH, tm->tm_mon);
> > +	rtc_write(rtc, RTC_TC_DOM, tm->tm_mday);
> > +	rtc_write(rtc, RTC_TC_HOU, tm->tm_hour);
> > +	rtc_write(rtc, RTC_TC_MIN, tm->tm_min);
> > +	rtc_write(rtc, RTC_TC_SEC, tm->tm_sec);
> Is this racy? I.e. what happens if RTC_TC_SEC overflows just before y=
ou
> write to it but after you wrote RTC_TC_MIN?

register value will write to hardware after rtc_write_trigger, so the
racy condition not exist.

>=20
> > +	rtc_write_trigger(rtc);
> > +	mutex_unlock(&rtc->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalr=
m *alm)
> > +{
> > +	struct rtc_time *tm =3D &alm->time;
> > +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> > +	u16 irqen, pdn2;
> > +
> > +	mutex_lock(&rtc->lock);
> > +	irqen =3D rtc_read(rtc, RTC_IRQ_EN);
> > +	pdn2 =3D rtc_read(rtc, RTC_PDN2);
> > +	tm->tm_sec  =3D rtc_read(rtc, RTC_AL_SEC);
> > +	tm->tm_min  =3D rtc_read(rtc, RTC_AL_MIN);
> > +	tm->tm_hour =3D rtc_read(rtc, RTC_AL_HOU) & RTC_AL_HOU_MASK;
> > +	tm->tm_mday =3D rtc_read(rtc, RTC_AL_DOM) & RTC_AL_DOM_MASK;
> > +	tm->tm_mon  =3D rtc_read(rtc, RTC_AL_MTH) & RTC_AL_MTH_MASK;
> > +	tm->tm_year =3D rtc_read(rtc, RTC_AL_YEA);
> > +	mutex_unlock(&rtc->lock);
> > +
> > +	alm->enabled =3D !!(irqen & RTC_IRQ_EN_AL);
> > +	alm->pending =3D !!(pdn2 & RTC_PDN2_PWRON_ALARM);
> > +
> > +	tm->tm_year +=3D RTC_MIN_YEAR_OFFSET;
> > +	tm->tm_mon--;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alm)
> > +{
> > +	struct rtc_time *tm =3D &alm->time;
> > +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> > +	u16 irqen;
> > +
> > +	tm->tm_year -=3D RTC_MIN_YEAR_OFFSET;
> > +	tm->tm_mon++;
> > +
> > +	if (alm->enabled) {
> > +		mutex_lock(&rtc->lock);
> > +		rtc_write(rtc, RTC_AL_YEA, tm->tm_year);
> > +		rtc_write(rtc, RTC_AL_MTH, (rtc_read(rtc, RTC_AL_MTH) &
> > +				RTC_NEW_SPARE3) | tm->tm_mon);
> This looks strange. Why doesn't RTC_NEW_SPARE3 contain the register
> name? I would have expected:
>=20
> 	(rtc_read(rtc, RTC_AL_MTH) & ~RTC_AL_MTH_MASK) | tm->tm_mon;

I will remove RTC_NEW_SPARE3. Hardware will return 0 if register bit is
useless. So the bit clear is redundant.=20

>=20
> > +		rtc_write(rtc, RTC_AL_DOM, (rtc_read(rtc, RTC_AL_DOM) &
> > +				RTC_NEW_SPARE1) | tm->tm_mday);
> > +		rtc_write(rtc, RTC_AL_HOU, (rtc_read(rtc, RTC_AL_HOU) &
> > +				RTC_NEW_SPARE_FG_MASK) | tm->tm_hour);
> > +		rtc_write(rtc, RTC_AL_MIN, tm->tm_min);
> > +		rtc_write(rtc, RTC_AL_SEC, tm->tm_sec);
> > +		rtc_write(rtc, RTC_AL_MASK, RTC_AL_MASK_DOW);
> Is this racy? I.e. if the previous set alarm is
>=20
> 	2015-03-13 14:15:00
>=20
> and you write
>=20
> 	2015-03.14 17:17:00
>=20
> is it possible that this triggers an alarm if the update happens at
>=20
> 	2015-03-14 14:15:00
>=20
> ?
>=20
All rtc register value write to RTC hardware after rtc_write_trigger.
Race condition should not happen.=20


> > +		rtc_write_trigger(rtc);
> > +		irqen =3D rtc_read(rtc, RTC_IRQ_EN) | RTC_IRQ_EN_ONESHOT_AL;
> > +		rtc_write(rtc, RTC_IRQ_EN, irqen);
> > +		rtc_write_trigger(rtc);
> > +		mutex_unlock(&rtc->lock);
> 	} else {
> 		/* disable alarm here */
>=20
OK, should clear RTC_IRQ_EN

> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct rtc_class_ops mtk_rtc_ops =3D {
> > +	.read_time  =3D mtk_rtc_read_time,
> > +	.set_time   =3D mtk_rtc_set_time,
> > +	.read_alarm =3D mtk_rtc_read_alarm,
> > +	.set_alarm  =3D mtk_rtc_set_alarm,
> > +};
> > +
> > +static int mtk_rtc_probe(struct platform_device *pdev)
> > +{
> > +	struct mt6397_chip *mt6397_chip =3D dev_get_drvdata(pdev->dev.par=
ent);
> > +	struct mt6397_rtc *rtc;
> > +	u32 reg[2];
> > +	int ret =3D 0;
> > +
> > +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(struct mt6397_rtc), GFP_K=
ERNEL);
> > +	if (!rtc)
> > +		return -ENOMEM;
> > +
> > +	ret =3D of_property_read_u32_array(pdev->dev.of_node, "reg", reg,=
 2);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "couldn't read rtc base address!\n");
> > +		return -EINVAL;
> > +	}
> > +	rtc->addr_base =3D reg[0];
> > +	rtc->addr_range =3D reg[1];
> This looks strange, but maybe that's right as you reuse the parent's
> regmap.

According Sascha and Mark Brown's discussion:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/323=
239.html

Address and interrupt will move from device tree to mfd_cell in
mt6397-core.c

>=20
> > +	rtc->regmap =3D mt6397_chip->regmap;
> > +	rtc->dev =3D &pdev->dev;
> > +	mutex_init(&rtc->lock);
> > +
> > +	platform_set_drvdata(pdev, rtc);
> > +
> > +	rtc->rtc_dev =3D rtc_device_register("mt6397-rtc", &pdev->dev,
> > +				&mtk_rtc_ops, THIS_MODULE);
> > +	if (IS_ERR(rtc->rtc_dev)) {
> > +		dev_err(&pdev->dev, "register rtc device failed\n");
> > +		return PTR_ERR(rtc->rtc_dev);
> > +	}
> > +
> > +	rtc->irq =3D platform_get_irq(pdev, 0);
> > +	if (rtc->irq < 0) {
> platform_get_irq(pdev, 0) =3D 0 should be treated as error, too.

OK, will fix it

>=20
> > +		ret =3D rtc->irq;
> > +		goto out_rtc;
> > +	}
>=20
> Best regards
> Uwe
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
