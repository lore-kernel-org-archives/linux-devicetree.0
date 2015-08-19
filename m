From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 0/9] Fixes and new clocks support for Mediatek MT8173
Date: Wed, 19 Aug 2015 16:50:35 +0200
Message-ID: <20150819145035.GN18700@pengutronix.de>
References: <1439200228-318-1-git-send-email-jamesjj.liao@mediatek.com>
 <CAGS+omCya_0djzoVGhJchmaTtzo2z+JdnJHDjLipNMsZKV=MLQ@mail.gmail.com>
 <CAGS+omAj=BZXYXChJwC2Heq+2KVEV2EoRrhiQhtXZRHGaZ9tEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGS+omAj=BZXYXChJwC2Heq+2KVEV2EoRrhiQhtXZRHGaZ9tEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dan,

On Fri, Aug 14, 2015 at 12:01:06PM +0800, Daniel Kurtz wrote:
> On Tue, Aug 11, 2015 at 12:43 PM, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > Hi James,
> >
> > On Mon, Aug 10, 2015 at 5:50 PM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> >> This patchset is based on 4.2-rc2 and [1], and contains minor fixes and
> >> subsystem clocks support for Mediatek MT8173.
> >>
> >> The previous reviews can be found in [2].
> >>
> >> changes since v6:
> >> - Use DUMMY_RATE (0) instead of typical rate for clocks that we don't care
> >>   and not controlled in CCF.
> >
> > For the whole series:
> > Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Hi Sascha,
> 
> Are you happy with these patches now?

Yes.

Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
