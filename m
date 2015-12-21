From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: imx7d: add arch timer
Date: Mon, 21 Dec 2015 14:44:14 +0800
Message-ID: <20151221064414.GD4703@tiger>
References: <1449789132-18976-1-git-send-email-Frank.Li@freescale.com>
 <024b6540b3ebd5f132d171ba40c6e727@agner.ch>
 <CAHrpEqTQFkme-BmVOPHbFwguQkpbYboaXymrRMc-6TDjwO8dUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHrpEqTQFkme-BmVOPHbFwguQkpbYboaXymrRMc-6TDjwO8dUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhi Li <lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 17, 2015 at 03:23:59PM -0600, Zhi Li wrote:
> On Thu, Dec 17, 2015 at 2:45 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
> > On 2015-12-10 15:12, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> >> From: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >>
> >> add cortex a7 arch timer.
> >> uboot v2016.01-rc2 supported psci basic support.
> >> smp can be supported by psci
> >
> > This sounds a bit overly simplified log message. I am not very into this
> > PSCI topic, is this a prerequisit for the ARM arch timers? Maybe you
> > could elaborate that a bit more.
> 
> No.
> But according to previous discussion. Shawn want us to use psci to enable
> second core.  We need enable arch timer if second core enabled.

I guess you can make the commit log a bit better by commenting
the relationship between the arch timer and secondary core.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
