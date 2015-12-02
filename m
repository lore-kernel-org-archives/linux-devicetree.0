From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: add driver for RX6110SA real time clock
Date: Wed, 2 Dec 2015 14:21:38 +0100
Message-ID: <20151202132138.GB22136@piout.net>
References: <1448977700-10924-1-git-send-email-s.trumtrar@pengutronix.de>
 <1448977700-10924-2-git-send-email-s.trumtrar@pengutronix.de>
 <20151201144218.GS22136@piout.net>
 <20151201194919.GG5072@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151201194919.GG5072-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/12/2015 at 20:49:19 +0100, Uwe Kleine-K=F6nig wrote :
> > Seeing the comment comment above, this should probably be if
> > (tm->tm_year < 100 || tm->tm_year >=3D 200)
> > I don't think this particular part has any issue
> > handling 2038. However, on 32bit platform, your userspace is probab=
ly
> > not ready to handle those date. hwclock should return the correct d=
ate.
>=20
> userspace is not ready because it cannot. Before this can be addresse=
d,
> quite some things need fixing first. If I understood correctly timerf=
d
> for example is broken which completely locks up systemd.
>=20
> Note this doesn't justify to not write a date later than 2037 in the =
rtc
> driver however. Still thinking about how to handle this for the machi=
nes
> we work on, we thought about letting the RTC_RD_TIME ioctl fail for
> dates later than 2038 to work around this issue.
>=20

Yeah but the rtc doesn't have any issue handling dates after 2038 so if
it is used on a 64bit system, it can work properly until february 2100.

Also, I'm not sure how that solves your problem anyway.

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
