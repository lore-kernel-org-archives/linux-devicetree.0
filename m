From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/2] rtc: mediatek: Add MT63xx RTC driver
Date: Tue, 17 Mar 2015 14:43:45 +0100
Message-ID: <20150317134345.GG10068@pengutronix.de>
References: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
 <1422437276-41334-3-git-send-email-eddie.huang@mediatek.com>
 <20150316153048.GC10068@pengutronix.de>
 <1426595474.24415.18.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426595474.24415.18.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tianping Fang <tianping.fang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Eddie,

On Tue, Mar 17, 2015 at 08:31:14PM +0800, Eddie Huang wrote:
> On Mon, 2015-03-16 at 16:30 +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Jan 28, 2015 at 05:27:56PM +0800, Eddie Huang wrote:
> > > [...]
> > > +static u16 rtc_read(struct mt6397_rtc *rtc, u32 offset)
> > rtc_read is a bad name for a driver. There are already 6 functions =
with
> > this name in the kernel. Better use a unique prefix.
>=20
> I will use prefix mtk_
I would prefer a prefix that is unique to the driver. "mtk_" doesn't
work to distinguish between the rtc and a (say) spi driver. What you
want here is that if someone reports a bug on any mailinglist with a
backtrace you are able to immediately see which driver is affected.

> > > [...]
> > > +static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
> > > +{
> > > +	struct mt6397_rtc *rtc =3D data;
> > > +	u16 irqsta, irqen;
> > > +
> > > +	mutex_lock(&rtc->lock);
> > > +	irqsta =3D rtc_read(rtc, RTC_IRQ_STA);
> > Do you really need to lock for a single read access?
>=20
> I think this lock is necessary, because other thread may access rtc
> register at the same time, for example, call mtk_rtc_set_alarm to mod=
ify
> alarm time.
That would be a valid reason if mtk_rtc_set_alarm touched that register
twice in a single critical section and the handler must not read the
value of the first write. Otherwise it should be fine, shouldn't it?

> > > +static int mtk_rtc_set_time(struct device *dev, struct rtc_time =
*tm)
> > > +{
> > > +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> > > +
> > > +	tm->tm_year -=3D RTC_MIN_YEAR_OFFSET;
> > > +	tm->tm_mon++;
> > > +	mutex_lock(&rtc->lock);
> > > +	rtc_write(rtc, RTC_TC_YEA, tm->tm_year);
> > > +	rtc_write(rtc, RTC_TC_MTH, tm->tm_mon);
> > > +	rtc_write(rtc, RTC_TC_DOM, tm->tm_mday);
> > > +	rtc_write(rtc, RTC_TC_HOU, tm->tm_hour);
> > > +	rtc_write(rtc, RTC_TC_MIN, tm->tm_min);
> > > +	rtc_write(rtc, RTC_TC_SEC, tm->tm_sec);
> > Is this racy? I.e. what happens if RTC_TC_SEC overflows just before=
 you
> > write to it but after you wrote RTC_TC_MIN?
>=20
> register value will write to hardware after rtc_write_trigger, so the
> racy condition not exist.
Ah, it seems the hardware guys did their job. Nice.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
