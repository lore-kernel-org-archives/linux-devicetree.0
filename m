From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: ds1374: Add Dallas/Maxim DS1374 Multi Function
 Device
Date: Tue, 18 Jul 2017 10:22:45 +0100
Message-ID: <20170718092245.tc5oosbbb6lzvqpy@dell>
References: <1499975665-14581-1-git-send-email-mdf@kernel.org>
 <1499975665-14581-2-git-send-email-mdf@kernel.org>
 <20170717075117.btnhbmgpofwn7zdk@dell>
 <20170717181409.GB8750@tyrael.ni.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170717181409.GB8750-KFgJe6S/L2nknyRNNOXSQ2IaLvZF3x2V0E9HWUfgJXw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Jul 2017, Moritz Fischer wrote:

> Hi Lee,
> 
> On Mon, Jul 17, 2017 at 08:51:17AM +0100, Lee Jones wrote:
> > On Thu, 13 Jul 2017, Moritz Fischer wrote:
> > 
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
> > > ---
> > >  drivers/mfd/Kconfig              |  10 +
> > >  drivers/mfd/Makefile             |   1 +
> > >  drivers/mfd/ds1374.c             | 260 ++++++++++++++++
> > >  drivers/rtc/rtc-ds1374.c         | 639 ++++++++++-----------------------------
> > 
> > It looks like this should now depend on MFD_DS1374, right?
> > 
> > >  drivers/watchdog/Kconfig         |  10 +
> > >  drivers/watchdog/Makefile        |   1 +
> > >  drivers/watchdog/ds1374-wdt.c    | 208 +++++++++++++
> > 
> > The RTC and Watchdog drivers need to be split out of this patch and
> > placed into their own.  Then we can take them through their respective
> > subsystem trees and do not have to rely on immutable branches for
> > unification.
> 
> Ok, I haven't found a good way to keep this bisectable in that case. I'm
> open to suggestions. If the consensus ends up being to split it up, I'm
> more than happy to separate it out into multiple patches.

If it's genuinely not bisectable, then leave it as is.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
