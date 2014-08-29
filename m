From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 5/5] regulator: RK808: remove redundant code
Date: Fri, 29 Aug 2014 06:13:10 -0700
Message-ID: <CAD=FV=X1xOg=-_xZ70X5=ZzRLiuws_2gv5n2fj_AaLTYMq58=A@mail.gmail.com>
References: <1409062737-12259-1-git-send-email-zyw@rock-chips.com>
	<20140827090146.GU17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140827090146.GU17528-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark,

On Wed, Aug 27, 2014 at 2:01 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Aug 26, 2014 at 10:18:57PM +0800, Chris Zhong wrote:
>> remove the redundant code, since pdata has been removed from stuct rk808
>
> I've applied this but if there's further changes needed please wait
> until the MFD changes they depend on have been accepted before
> resending.  This will be less work all round.

Can you clarify?  As Chris makes the MFD changes that Lee and others
have requested then the regulator driver needs to change as well.
It's helpful for reviewers (and testers) of Chris's changes to see how
the regulator driver changes as the MFD interface changes.  Should he
just take you off the CC list until he's ready?

I've asked Chris to please send out the next version of the series
(including the regulator changes needed) since I'd like to see
feedback addressed.  If that doesn't match what you want him to do,
please yell at me and not at him...


Thanks!

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
