From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/4] drivers/rtc/rtc-armada38x: Add a new RTC driver for
 recent mvebu SoCs
Date: Wed, 14 Jan 2015 15:36:13 +0100
Message-ID: <54B67EDD.8050303@free-electrons.com>
References: <1420817565-28800-1-git-send-email-gregory.clement@free-electrons.com>	<1420817565-28800-3-git-send-email-gregory.clement@free-electrons.com> <87bnm2i8rt.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87bnm2i8rt.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnaud,

[...]
>> +struct armada38x_rtc {
>> +	struct rtc_device   *rtc_dev;
>> +	void __iomem	    *regs;
>> +	void __iomem	    *regs_soc;
>> +	spinlock_t	    lock;
>=20
> out of curiosity, why use a spinlock and not a mutex?

To be able to use it in the interrupt context.

>=20
>=20
>> +	int		    irq;
>> +};
>> +
>> +/*
>> + * According to the datasheet, we need to wait for 5us between each
>> + * write
>> + */
>> +static void rtc_delayed_write(u32 val, struct armada38x_rtc *rtc, i=
nt offset)
>> +{
>> +	writel(val, rtc->regs + offset);
>> +	udelay(5);
>> +}
>=20
> In the remaining of the driver, you have various direct calls to writ=
el()
> w/o that 5=C2=B5s protection, to update/modifiy rtc registers. Is tha=
t 5=C2=B5s
> trick specific to a given subpart of the registers? In that case, I
> guess it would help to update the comment.

This direct call were done because there was not a call to write just a=
fter.
As explained in the comment the 5us is needed only _between_ two consec=
utive
write. I can emphasize it needed.

>=20
>=20
>> +
>> +static int armada38x_rtc_read_time(struct device *dev, struct rtc_t=
ime *tm)
>> +{
>> +	struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +	unsigned long time, time_check, flags;
>> +
>> +	spin_lock_irqsave(&rtc->lock, flags);
>> +
>> +	time =3D readl(rtc->regs + RTC_TIME);
>> +	/*
>> +	 * WA for failing time set attempts. As stated in HW ERRATA if
>> +	 * more than one second between two time reads is detected
>> +	 * then read once again.
>> +	 */
>> +	time_check =3D readl(rtc->regs + RTC_TIME);
>> +	if ((time_check - time) > 1)
>> +		time_check =3D readl(rtc->regs + RTC_TIME);
>=20
> Bear with me; I don't have access to HW ERRATA.
>=20
> Are you guaranteed to get a valid value at third read if you got a ba=
d
> one before, i.e. no need to put a while loop around that workaround?

I don't have enough information to answer you, maybe the Marvell design=
er can
answer it. I will ask.

>=20
> Additionally, the workaround seems to be related to time
> setting. Looking at time setting code below, it seems the issue is al=
so
> created by the fact the writel() call is not under the protection of =
the
> spinlock.
>=20
>> +
>> +	spin_unlock_irqrestore(&rtc->lock, flags);
>> +
>> +	rtc_time_to_tm(time_check, tm);
>> +
>> +	return 0;
>=20
> Does the block provide anyway to detect the oscillator was not runnin=
g,
> i.e. the value we are reading is not valid?

I didn't see anything related to this, but here again I will ask.

>=20
>=20
>> +}
>> +
>> +static int armada38x_rtc_set_time(struct device *dev, struct rtc_ti=
me *tm)
>> +{
>> +	struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +	int ret =3D 0;
>> +	unsigned long time;
>> +
>> +	ret =3D rtc_tm_to_time(tm, &time);
>=20
>=20
>> +
>> +	if (ret)
>> +		goto out;
>> +	/*
>> +	 * Setting the RTC time not always succeeds. According to the
>> +	 * errata we need to first write on the status register and
>> +	 * then wait for 1s before writing to the time register to be
>> +	 * sure that the data will be taken into account.
>> +	 */
>> +	writel(0, rtc->regs + RTC_STATUS);
>> +	ssleep(1);
>> +
>> +	writel(time, rtc->regs + RTC_TIME);
>=20
> I think writel(time + 1, ...) would correct the one second shift you
> introduce using you ssleep() above.

I will just move the rtc_tm_to_time-) function here, before the second =
write.


>=20
> Additionally, as discussed above, I do not see why you're not protect=
ing
> the write using you spinlock.

Initially the spinlock was around the 2 writel, but you can't have slee=
p
in a critical section hold by spinlock so I removed it. However it woul=
d be
possible to use them around each writel, but I am not sure that it make=
s sens.

>=20
>=20
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int armada38x_rtc_read_alarm(struct device *dev, struct rtc_=
wkalrm *alrm)
>> +{
>> +	struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +	unsigned long time, flags;
>> +	u32 val;
>> +
>> +	spin_lock_irqsave(&rtc->lock, flags);
>> +
>> +	time =3D readl(rtc->regs + RTC_ALARM1);
>> +	val =3D readl(rtc->regs + RTC_IRQ1_CONF) & RTC_IRQ1_AL_EN;
>> +
>> +	spin_unlock_irqrestore(&rtc->lock, flags);
>> +
>> +	alrm->enabled =3D val ? 1 : 0;
>> +	rtc_time_to_tm(time,  &alrm->time);
>> +
>> +	return 0;
>> +}
>> +
>=20
> In the two functions below, regarding RTC interrupt activation, do yo=
u
> need a check that a valid IRQ was passed in the .dts and that
> devm_request_irq() went ok in probe(), i.e. that rtc->irq > 0?

You're right is the irq is not valid, I can even removed these 2 functi=
ons
from armada38x_rtc_ops.

>=20
>> +static int armada38x_rtc_set_alarm(struct device *dev, struct rtc_w=
kalrm *alrm)
>> +{
>> +	struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +	unsigned long time, flags;
>> +	int ret =3D 0;
>> +	u32 val;
>> +
>> +	ret =3D rtc_tm_to_time(&alrm->time, &time);
>> +
>> +	if (ret)
>> +		goto out;
>> +
>> +	spin_lock_irqsave(&rtc->lock, flags);
>> +
>> +	rtc_delayed_write(time, rtc, RTC_ALARM1);
>> +
>> +	if (alrm->enabled) {
>> +			rtc_delayed_write(RTC_IRQ1_AL_EN , rtc, RTC_IRQ1_CONF);
>> +			val =3D readl(rtc->regs_soc + SOC_RTC_INTERRUPT);
>> +		writel(val | SOC_RTC_ALARM1_MASK,
>> +			rtc->regs_soc + SOC_RTC_INTERRUPT);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&rtc->lock, flags);
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>> +static int armada38x_rtc_alarm_irq_enable(struct device *dev,
>> +					 unsigned int enabled)
>> +{
>> +	struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&rtc->lock, flags);
>> +
>> +	if (enabled)
>> +		writel(RTC_IRQ1_AL_EN, rtc->regs + RTC_IRQ1_CONF);
>> +	else
>> +		writel(0, rtc->regs + RTC_IRQ1_CONF);
>=20
> I find the following more readable, but it is subjective:
>=20
> writel(enabled ? RTC_IRQ1_AL_EN : 0, rtc->regs + RTC_IRQ1_CONF);
>=20
>=20
>> +
>> +	spin_unlock_irqrestore(&rtc->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t armada38x_rtc_alarm_irq(int irq, void *data)
>> +{
>> +	struct armada38x_rtc *rtc =3D data;
>> +	u32 val;
>> +	int event =3D RTC_IRQF | RTC_AF;
>> +
>> +	dev_dbg(&rtc->rtc_dev->dev, "%s:irq(%d)\n", __func__, irq);
>> +	val =3D readl(rtc->regs_soc + SOC_RTC_INTERRUPT);
>> +
>> +	spin_lock(&rtc->lock);
>> +
>> +	writel(val & ~SOC_RTC_ALARM1, rtc->regs_soc + SOC_RTC_INTERRUPT);
>=20
> Why not putting the readl() above under protection of the spinlock to
> protect a change that could occur between the readl() and the writel(=
)?

Indeed it would be better.

>=20
>=20
>> +	val =3D readl(rtc->regs + RTC_IRQ1_CONF);
>> +	/* disable all the interrupts for alarm 1 */
>> +	rtc_delayed_write(0, rtc, RTC_IRQ1_CONF);
>> +	/* Ack the event */
>> +	writel(RTC_STATUS_ALARM1, rtc->regs + RTC_STATUS);
>> +
>> +	spin_unlock(&rtc->lock);
>> +
>> +	if (val & RTC_IRQ1_FREQ_EN) {
>> +		if (val & RTC_IRQ1_FREQ_1HZ)
>> +			event |=3D RTC_UF;
>> +		else
>> +			event |=3D RTC_PF;
>> +	}
>> +
>> +	rtc_update_irq(rtc->rtc_dev, 1, event);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static const struct rtc_class_ops armada38x_rtc_ops =3D {
>> +	.read_time =3D armada38x_rtc_read_time,
>> +	.set_time =3D armada38x_rtc_set_time,
>> +	.read_alarm =3D armada38x_rtc_read_alarm,
>> +	.set_alarm =3D armada38x_rtc_set_alarm,
>> +	.alarm_irq_enable =3D armada38x_rtc_alarm_irq_enable,
>> +};
>> +
>> +static __init int armada38x_rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	struct armada38x_rtc *rtc;
>> +	int ret;
>> +
>> +	rtc =3D devm_kzalloc(&pdev->dev, sizeof(struct armada38x_rtc),
>> +			    GFP_KERNEL);
>> +	if (!rtc)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&rtc->lock);
>> +
>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	rtc->regs =3D devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(rtc->regs))
>> +		return PTR_ERR(rtc->regs);
>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +	rtc->regs_soc =3D devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(rtc->regs_soc))
>> +		return PTR_ERR(rtc->regs_soc);
>> +
>> +	rtc->irq =3D platform_get_irq(pdev, 0);
>> +
>> +	if (rtc->irq < 0) {
>> +		dev_err(&pdev->dev, "no irq\n");
>> +		return rtc->irq;
>> +	}
>> +	if (devm_request_irq(&pdev->dev, rtc->irq, armada38x_rtc_alarm_irq=
,
>> +				0, pdev->name, rtc) < 0) {
>> +		dev_warn(&pdev->dev, "Interrupt not available.\n");
>> +		rtc->irq =3D -1;
>> +	}
>> +	platform_set_drvdata(pdev, rtc);
>> +
>> +	device_init_wakeup(&pdev->dev, 1);
>=20
> if devm_request_irq() returns an error, should device_init_wakeup() b=
e
> called? See comment below under armada38x_rtc_suspend().

We should not called it and also set the set_alarm and alarm_irq_enable=
 operation
to NULL.

>=20
>> +	rtc->rtc_dev =3D devm_rtc_device_register(&pdev->dev, pdev->name,
>> +					&armada38x_rtc_ops, THIS_MODULE);
>> +	if (IS_ERR(rtc->rtc_dev)) {
>> +		ret =3D PTR_ERR(rtc->rtc_dev);
>> +		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
>> +		if (ret =3D=3D 0)
>> +			ret =3D -EINVAL;
>=20
> I may be missing something but I do not see how ret can be 0 above
> because the initial check uses IS_ERR() and not IS_ERR_OR_NULL().

Indeed I can remove this. The devm_rtc_device_register won't return NUL=
L.

>=20
>=20
>> +		return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +#ifdef CONFIG_PM_SLEEP
>> +static int armada38x_rtc_suspend(struct device *dev)
>> +{
>> +	if (device_may_wakeup(dev)) {
>> +		struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +
>> +		return enable_irq_wake(rtc->irq);
>> +	}
>=20
> AFAICT, rtc->irq maybe -1 in the call above. You need to either call
> device_init_wakeup() when devm_request_irq() succeed or check rtc->ir=
q
> is valid in the "if" above.

I won't call  device_init_wakeup()  if rtc->irq is -1.

Thanks,

Gregory

>=20
>> +
>> +	return 0;
>> +}
>> +
>> +static int armada38x_rtc_resume(struct device *dev)
>> +{
>> +	if (device_may_wakeup(dev)) {
>> +		struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +
>> +		return disable_irq_wake(rtc->irq);
>> +	}
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>> +static SIMPLE_DEV_PM_OPS(armada38x_rtc_pm_ops,
>> +			 armada38x_rtc_suspend, armada38x_rtc_resume);
>> +
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id armada38x_rtc_of_match_table[] =3D=
 {
>> +	{ .compatible =3D "marvell,armada-380-rtc", },
>> +	{}
>> +};
>> +#endif
>> +
>> +static struct platform_driver armada38x_rtc_driver =3D {
>> +	.driver		=3D {
>> +		.name	=3D "armada38x-rtc",
>> +		.pm	=3D &armada38x_rtc_pm_ops,
>> +		.of_match_table =3D of_match_ptr(armada38x_rtc_of_match_table),
>> +	},
>> +};
>> +
>> +module_platform_driver_probe(armada38x_rtc_driver, armada38x_rtc_pr=
obe);
>> +
>> +MODULE_DESCRIPTION("Marvell Armada 38x RTC driver");
>> +MODULE_AUTHOR("Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=
");
>> +MODULE_LICENSE("GPL");


--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
