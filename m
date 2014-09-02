From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 2 Sep 2014 08:24:37 +0100
Message-ID: <20140902072437.GA17117@lee--X1>
References: <1409562468-16586-1-git-send-email-zyw@rock-chips.com>
 <1409564384-18380-1-git-send-email-zyw@rock-chips.com>
 <20140901100922.GL7374@lee--X1>
 <CAD=FV=WUOk1dUUH5R11ONshkckS8QDa-6C_14VRTtRwQPZTv4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=WUOk1dUUH5R11ONshkckS8QDa-6C_14VRTtRwQPZTv4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor@chromiu>
List-Id: devicetree@vger.kernel.org

On Mon, 01 Sep 2014, Doug Anderson wrote:
> On Mon, Sep 1, 2014 at 3:09 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrot=
e:
> > On Mon, 01 Sep 2014, Chris Zhong wrote:
> >
> >> The RK808 chip is a power management IC for multimedia and handhel=
d
> >> devices. It contains the following components:
> >>
> >> - Regulators
> >> - RTC
> >> - Clkout
> >>
> >> The RK808 core driver is registered as a platform driver and provi=
des
> >> communication through I2C with the host device for the different
> >> components.
> >>
> >> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >
> > Couple of nits.  Once fixed you can apply my:
> >
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >
> > [...]
> >
> >> +/*
> >> + * MFD core driver for Rockchip RK808
> >> + *
> >> + * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
> >
> > Author?
>=20
> I asked Chris to remove the author in my response to an earlier
> version since it's at the bottom (MODULE_AUTHOR) and it seems extra
> duplication.  You are the boss though, so if it should go both places
> then Chris should add this back.  Sorry for the bad advice, Chris.

Yes, both places please.  They do different things.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
