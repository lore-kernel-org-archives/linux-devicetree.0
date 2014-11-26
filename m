From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: rockchip: add binding ID for DMC (memory controller) clocks on rk3288
Date: Wed, 26 Nov 2014 18:43:40 +0100
Message-ID: <3545025.lFcuKWk0o9@diego>
References: <1416960783-25119-1-git-send-email-dianders@chromium.org> <1717801.sWHeWsmqUi@diego> <CAD=FV=WxeFFZekYOkttx4YcDq=td+Vpu9rFALuNu_6zs+7b2tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=WxeFFZekYOkttx4YcDq=td+Vpu9rFALuNu_6zs+7b2tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: jeff chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 25. November 2014, 16:49:08 schrieb Doug Anderson:
> Heiko,
>=20
> On Tue, Nov 25, 2014 at 4:45 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wr=
ote:
> > Am Dienstag, 25. November 2014, 16:13:02 schrieb Doug Anderson:
> >> From: Jeff Chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >>=20
> >> The DMC clocks need to be turned off at runtime, so we should have=
 IDs
> >> so we can export them.
> >>=20
> >> Signed-off-by: Jeff Chen <cym-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> [dianders: split into two patches; adjusted commit msg]
> >> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >=20
> > both patches look ok to me and I'll probably pick them up tomorrow.
>=20
> OK, thanks!

I've now added both patches to my clk branch.


> > We have currently three clock patches/series adding new clock ids [=
this
> > one, the mmc phases and Sonny's i2s_clkout] and I'm trying to derte=
rmine
> > if I need a shared branch for those.
> >=20
> > Currently it doesn't look like the others will provide dts patches =
using
> > the clocks in time, so it looks like I can skip the shared branch a=
nd we
> > can use the clock ids regularly after the merge-window. Some true f=
or
> > your clocks?
> Yup, no problem for me.  I provided this as two patches to you just i=
n
> case it was convenient, since I saw that as feedback in previous
> submissions.

Yep, I think it is the sanest of doing it in one way all the time, so w=
e have=20
the option of easily creating shared branches depending on what is need=
ed.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
