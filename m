From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH 2/2] rtc: mediatek: Add MT63xx RTC driver
Date: Wed, 18 Mar 2015 11:27:40 +0800
Message-ID: <1426649260.3662.5.camel@mtksdaap41>
References: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
	 <1422437276-41334-3-git-send-email-eddie.huang@mediatek.com>
	 <20150316153048.GC10068@pengutronix.de>
	 <1426595474.24415.18.camel@mtksdaap41>
	 <20150317134345.GG10068@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150317134345.GG10068@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Uwe,

On Tue, 2015-03-17 at 14:43 +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Eddie,
>=20
> On Tue, Mar 17, 2015 at 08:31:14PM +0800, Eddie Huang wrote:
> > On Mon, 2015-03-16 at 16:30 +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Wed, Jan 28, 2015 at 05:27:56PM +0800, Eddie Huang wrote:
> > > > [...]
> > > > +static u16 rtc_read(struct mt6397_rtc *rtc, u32 offset)
> > > rtc_read is a bad name for a driver. There are already 6 function=
s with
> > > this name in the kernel. Better use a unique prefix.
> >=20
> > I will use prefix mtk_
> I would prefer a prefix that is unique to the driver. "mtk_" doesn't
> work to distinguish between the rtc and a (say) spi driver. What you
> want here is that if someone reports a bug on any mailinglist with a
> backtrace you are able to immediately see which driver is affected.
>=20

My meaning is mtk_rtc_read, mtk_rtc_write.

> > > > [...]
> > > > +static irqreturn_t rtc_irq_handler_thread(int irq, void *data)
> > > > +{
> > > > +	struct mt6397_rtc *rtc =3D data;
> > > > +	u16 irqsta, irqen;
> > > > +
> > > > +	mutex_lock(&rtc->lock);
> > > > +	irqsta =3D rtc_read(rtc, RTC_IRQ_STA);
> > > Do you really need to lock for a single read access?
> >=20
> > I think this lock is necessary, because other thread may access rtc
> > register at the same time, for example, call mtk_rtc_set_alarm to m=
odify
> > alarm time.
> That would be a valid reason if mtk_rtc_set_alarm touched that regist=
er
> twice in a single critical section and the handler must not read the
> value of the first write. Otherwise it should be fine, shouldn't it?
>=20

My original though is if disable alarm in mtk_rtc_set_alarm function,
RTC_IRQ_STA may be affected, this is why I add mutex. After checking
with designer, RTC_IRQ_STA will not be affected. I will remove the
mutex.

> > > > +static int mtk_rtc_set_time(struct device *dev, struct rtc_tim=
e *tm)
> > > > +{
> > > > +	struct mt6397_rtc *rtc =3D dev_get_drvdata(dev);
> > > > +
> > > > +	tm->tm_year -=3D RTC_MIN_YEAR_OFFSET;
> > > > +	tm->tm_mon++;
> > > > +	mutex_lock(&rtc->lock);
> > > > +	rtc_write(rtc, RTC_TC_YEA, tm->tm_year);
> > > > +	rtc_write(rtc, RTC_TC_MTH, tm->tm_mon);
> > > > +	rtc_write(rtc, RTC_TC_DOM, tm->tm_mday);
> > > > +	rtc_write(rtc, RTC_TC_HOU, tm->tm_hour);
> > > > +	rtc_write(rtc, RTC_TC_MIN, tm->tm_min);
> > > > +	rtc_write(rtc, RTC_TC_SEC, tm->tm_sec);
> > > Is this racy? I.e. what happens if RTC_TC_SEC overflows just befo=
re you
> > > write to it but after you wrote RTC_TC_MIN?
> >=20
> > register value will write to hardware after rtc_write_trigger, so t=
he
> > racy condition not exist.
> Ah, it seems the hardware guys did their job. Nice.
>=20
> Best regards
> Uwe
>=20
