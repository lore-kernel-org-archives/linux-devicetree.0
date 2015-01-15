From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] drivers/rtc/rtc-armada38x: Add a new RTC driver
 for recent mvebu SoCs
Date: Thu, 15 Jan 2015 10:51:44 +0100
Message-ID: <54B78DB0.5050808@free-electrons.com>
References: <1421257155-3379-1-git-send-email-gregory.clement@free-electrons.com>	<1421257155-3379-3-git-send-email-gregory.clement@free-electrons.com> <871tmxrsj8.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <871tmxrsj8.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnaud,
[...]

>> +/*
>> + * According to the datasheet, we need to wait for 5us only between
>> + * two consecutive writes
>> + */
>> +static void rtc_delayed_write(u32 val, struct armada38x_rtc *rtc, i=
nt offset)
>> +{
>> +	writel(val, rtc->regs + offset);
>> +	udelay(5);
>> +}
>=20
> The thing I do not get is how you can guarantee that an undelayed
> writel() in a function will not be followed less than 5=C2=B5s later =
by
> another writel() in another function. For instance:
>=20
>   1) a call to set_alarm() followed by a call to alarm_irq_enable().
>   2) some writel() or even rtc_udelayed_write() w/ sth asynchronous
>     occuring like your interrupt handler just after that.
>=20
> I guess it may be possible to make assumptions on the fact that the
> amount of code before a writel() or rtc_udelayed_write() may prevent
> such scenario but it's difficult to tell, all the more w/ a spinlock
> before the writel() in irq_enable().
>=20
> Considering the description of the bug, why not doing the following:
>=20
>  1) implement rtc_delayed_write() a bit differently:
>=20
>     static inline void rtc_delayed_write(u32 val, struct armada38x_rt=
c *rtc, int offset)
>     {
> 	udelay(5);
> 	writel(val, rtc->regs + offset);
>     }
>=20
>  2) remove all writel() in the driver and use rtc_delayed_write()
>     everywhere.
>=20
> All writes being under the protection of your spinlock, this will
> guarantee the 5=C2=B5s delay in all cases.

You're right. I tried avoiding loosing microseconds here and there, but=
 there
is too many case where it can fail. So let's us it everywhere.

[...]

>> +static int armada38x_rtc_set_time(struct device *dev, struct rtc_ti=
me *tm)
>> +{
>> +	struct armada38x_rtc *rtc =3D dev_get_drvdata(dev);
>> +	int ret =3D 0;
>> +	unsigned long time, flags;
>> +
>> +	ret =3D rtc_tm_to_time(tm, &time);
>> +
>> +	if (ret)
>> +		goto out;
>> +	/*
>> +	 * Setting the RTC time not always succeeds. According to the
>> +	 * errata we need to first write on the status register and
>> +	 * then wait for 100ms before writing to the time register to be
>> +	 * sure that the data will be taken into account.
>> +	 */
>> +	spin_lock_irqsave(&rtc->lock, flags);
>> +
>> +	writel(0, rtc->regs + RTC_STATUS);
>> +
>> +	spin_unlock_irqrestore(&rtc->lock, flags);
>> +
>> +	msleep(100);
>> +
>> +	spin_lock_irqsave(&rtc->lock, flags);
>> +
>> +	writel(time, rtc->regs + RTC_TIME);
>=20
> probably not critical (it's rtc clock and not system clock) but you s=
till
> introduce a 100ms shift when setting time here.

I am aware of this shift but the granularity is the second, so we can't=
 do
better, we have to deal with the limitation of the hardware. :(

>=20
> As for the two writel() not being done w/o releasing the spinlock, it
> looks a bit weird but it seems it's ok for other functions manipulati=
ng
> RTC_STATUS reg.=20
>=20
> Nonetheless, in the reverse direction, if a writel() occurs somewhere
> (e.g. in the alarm irq handler) during your msleep(), you may do your
> final writel() w/o having enforced the expected 100ms delay.

Actually I don't know if it is problematic if a writel occur in an othe=
r register
during the 100ms. I still wait for an answer for it.


Thanks,

Gregory




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
