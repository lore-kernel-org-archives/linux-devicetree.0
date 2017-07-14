From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: ds1374: Add Dallas/Maxim DS1374 Multi Function
 Device
Date: Fri, 14 Jul 2017 12:27:08 -0700
Message-ID: <20170714192708.GB16125@roeck-us.net>
References: <1499975665-14581-1-git-send-email-mdf@kernel.org>
 <1499975665-14581-2-git-send-email-mdf@kernel.org>
 <c37eaed9-10aa-190e-fa0e-bdce9277664b@roeck-us.net>
 <20170714165423.GA9283@tyrael.ni.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170714165423.GA9283-KFgJe6S/L2nknyRNNOXSQ2IaLvZF3x2V0E9HWUfgJXw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 14, 2017 at 09:54:23AM -0700, Moritz Fischer wrote:
> Hi Guenter,
> 
> On Thu, Jul 13, 2017 at 08:57:52PM -0700, Guenter Roeck wrote:
> > On 07/13/2017 12:54 PM, Moritz Fischer wrote:
> > > From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> > > 
> > > Add support for the Maxim/Dallas DS1374 RTC/WDT with trickle charger.
> > > The device can either be configured as simple RTC, as simple RTC with
> > > Alarm (IRQ) as well as simple RTC with watchdog timer.
> > > 
> > > Break up the old monolithic driver in drivers/rtc/rtc-ds1374.c into:
> > > - rtc part in drivers/rtc/rtc-ds1374.c
> > > - watchdog part under drivers/watchdog/ds1374-wdt.c
> > > - mfd part drivers/mfd/ds1374.c
> > > 
> > > The MFD part takes care of trickle charging and mode selection,
> > > since the usage modes of a) RTC + Alarm or b) RTC + WDT
> > > are mutually exclusive.
> > > 
> > > Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > 
> > [ Only reviewing watchdog part ]
> > 
[ ... ]

> > > +}
> > > +
> > > +static int ds1374_wdt_start(struct watchdog_device *wdog)
> > > +{
> > > +	int err;
> > > +	struct ds1374_wdt *ds1374_wdt = watchdog_get_drvdata(wdog);
> > > +
> > > +	err = ds1374_wdt_set_timeout(wdog, wdog->timeout);
> > > +	if (err) {
> > > +		dev_err(ds1374_wdt->dev, "%s: failed to set timeout (%d) %u\n",
> > > +			__func__, err, wdog->timeout);
> > > +		return err;
> > > +	}
> > > +
> > > +	err = ds1374_wdt_ping(wdog);
> > > +	if (err) {
> > > +		dev_err(ds1374_wdt->dev, "%s: failed to ping (%d)\n", __func__,
> > > +			err);
> 
> I assume you'd want to get rid of that one too?

Yes.

> > 
> > This may bypass MAGICCLOSE: If the watchdog daemon is killed and the module removed,
> > the watchdog will be stopped. Is this really what you want ? If so, why set MAGICCLOSE
> > in the first place ?
> 
> So your suggestion would be:
> 
> - if (!nowayout)
> -	ds1374_wdt_stop(&priv->wdd)
> 
Correct. Just drop the remove function.

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
