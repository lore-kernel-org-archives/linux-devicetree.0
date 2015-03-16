From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH 2/2] rtc: mediatek: Add MT63xx RTC driver
Date: Mon, 16 Mar 2015 17:52:09 +0800
Message-ID: <1426499529.15259.58.camel@mtksdaap41>
References: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
	 <1422437276-41334-3-git-send-email-eddie.huang@mediatek.com>
	 <20150223135044.108ea32a65063a50aa36a309@linux-foundation.org>
	 <1426242563.18291.19.camel@mtksdaap41>
	 <20150313105742.GS24885@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150313105742.GS24885-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tianping Fang <tianping.fang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Fri, 2015-03-13 at 11:57 +0100, Sascha Hauer wrote:
> Hi Eddie,
> 
> On Fri, Mar 13, 2015 at 06:29:23PM +0800, Eddie Huang wrote:
> > > regmap_read() and regmap_write() can return errors.  There is no
> > > checking for this.
> > > 
> > 
> > I encounter some trouble when I add code to check return value of
> > regmap_read and regmap_write. Every RTC register access through regmap,
> > and there are many register read/write in this driver. If I check every
> > return value, the driver will become ugly. I try to make this driver
> > clean using following macro.
> > 
> > static int __rtc_read(struct mt6397_rtc *rtc, u32 offset, u32 *data)
> > {
> >         u32 addr = rtc->addr_base + offset;
> > 
> >         if (offset < rtc->addr_range)
> >                 return regmap_read(rtc->regmap, addr, data);
> > 
> >         return -EINVAL;
> > }
> > 
> > #define rtc_read(ret, rtc, offset, data)                \
> > ({                                                      \
> >         ret = __rtc_read(rtc, offset, data);            \
> >         if (ret < 0)                                    \
> >                 goto rtc_exit;                          \
> > })                                                      \
> 
> Hiding a goto (or return) in a macro is a very bad idea.
> 
> what you can do is
> 
> 	ret |= regmap_read(rtc->regmap, RTC_TC_SEC, &tm->tm_sec);
> 	ret |= regmap_read(rtc->regmap, RTC_TC_MIN, &tm->tm_min);
> 
> 	if (ret)
> 		return -EIO;
> 
> (Don't return ret in this case though as it might contain different
> error codes orred together)
> 

OK, I will drop macro, and check regmap_read, regmap_write return value
in each function.

> Another possibilty at least for contiguous registers would be
> regmap_bulk_read().
> 
> Sascha
> 

Contiguous registers access occurs in reading and writing time. I think
Matthias's suggestion is a good way: 

do {
	ret = __mtk_rtc_read_time(rtc, &tm, &sec);
	if (ret < 0)
		goto rtc_exit;
} while (sec < tm->tm_sec);

Eddie


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
