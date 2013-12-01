From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3] watchdog: GPIO-controlled watchdog
Date: Sun, 1 Dec 2013 11:14:57 -0800
Message-ID: <20131201191457.GB19549@roeck-us.net>
References: <1385798072-3886-1-git-send-email-shc_work@mail.ru>
 <529B78DC.7070200@roeck-us.net>
 <1385924607.556195103@f310.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385924607.556195103-ufcwd1q191BsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 01, 2013 at 11:03:27PM +0400, Alexander Shiyan wrote:
> Hello.
> 
> > On 11/29/2013 11:54 PM, Alexander Shiyan wrote:
> > > This patch adds a watchdog driver for devices controlled through GPIO,
> > > (Analog Devices ADM706, Maxim MAX823, National NE555 etc).
> > >
> > > Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> > > ---
> > 
> > Looks pretty good, except for a single nitpick below (sorry I didn't notice that one earlier).
> > 
> > Also, as mentioned before, a changelog describing what changed and what didn't
> > would be really helpful.
> 
> Just fixed all observations made by you earlier.
> 
Yes, but since you did not say that, I had to look up my earlier comments
and check against this version. This takes time, and time is one thing
which reviewers or subsystem maintainers don't always have readily
available.

> ...
> > > +	/* Disallow values lower than 2 and higher than 65535 ms */
> > > +	if ((hw_margin < 2) || (hw_margin > 65535))
> > 
> > Unnecessary ( ).
> 
> This can be corrected during merge. Isn't it? Or you expect v4?
> 
If I were the watchdog maintainer, yes. Since I am not, it really
depends on Wim. He might accept your patch as-is, make the change
himself, expect you to submit another version, or request additional
changes. You'll see.

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
