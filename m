From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: add driver for RX6110SA real time clock
Date: Tue, 1 Dec 2015 20:49:19 +0100
Message-ID: <20151201194919.GG5072@pengutronix.de>
References: <1448977700-10924-1-git-send-email-s.trumtrar@pengutronix.de>
 <1448977700-10924-2-git-send-email-s.trumtrar@pengutronix.de>
 <20151201144218.GS22136@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151201144218.GS22136-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Alexandre,

Cc +=3D Arnd

On Tue, Dec 01, 2015 at 03:42:18PM +0100, Alexandre Belloni wrote:
> > +/**
> > + * rx6110_set_time - set the current time in the rx6110 registers
> > + *
> > + * @dev: the rtc device in use
> > + * @tm: holds date and time
> > + *
> > + * BUG: The HW assumes every year that is a multiple of 4 to be a =
leap
> > + * year. Next time this is wrong is 2100, which will not be a leap=
 year
> > + *
> > + * Note: If STOP is not set/cleared, the clock will start when the=
 seconds
> > + *       register is written
> > + *
> > + */
> > +static int rx6110_set_time(struct device *dev, struct rtc_time *tm=
)
> > +{
> > +	struct rx6110_data *rx6110 =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	if (tm->tm_year > 137)
> > +		return -EINVAL;
> > +
>=20
> Seeing the comment comment above, this should probably be if
> (tm->tm_year < 100 || tm->tm_year >=3D 200)
> I don't think this particular part has any issue
> handling 2038. However, on 32bit platform, your userspace is probably
> not ready to handle those date. hwclock should return the correct dat=
e.

userspace is not ready because it cannot. Before this can be addressed,
quite some things need fixing first. If I understood correctly timerfd
for example is broken which completely locks up systemd.

Note this doesn't justify to not write a date later than 2037 in the rt=
c
driver however. Still thinking about how to handle this for the machine=
s
we work on, we thought about letting the RTC_RD_TIME ioctl fail for
dates later than 2038 to work around this issue.

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
