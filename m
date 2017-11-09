From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/3] watchdog: jz4780: Allow selection of jz4740-wdt
 driver
Date: Thu, 9 Nov 2017 08:57:00 -0800
Message-ID: <20171109165700.GA23671@roeck-us.net>
References: <20170908183558.1537-1-malat@debian.org>
 <20170908183558.1537-2-malat@debian.org>
 <20171109074718.GR15260@jhogan-linux>
 <20171109160147.GB19959@roeck-us.net>
 <20171109164342.GR15235@jhogan-linux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171109164342.GR15235@jhogan-linux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 09, 2017 at 04:43:43PM +0000, James Hogan wrote:
> On Thu, Nov 09, 2017 at 08:01:47AM -0800, Guenter Roeck wrote:
> > On Thu, Nov 09, 2017 at 07:47:19AM +0000, James Hogan wrote:
> > > Hi Wim,
> > > 
> > > On Fri, Sep 08, 2017 at 08:35:54PM +0200, Mathieu Malaterre wrote:
> > > > This driver works for jz4740 & jz4780
> > > > 
> > > > Suggested-by: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
> > > > Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> > > 
> > > I just noticed that though Ralf applied the other two patches in this
> > > series (defconfig + dt), he hadn't applied this patch.
> > > 
> > > Please can we have an ack from a watchdog maintainer so this can get
> > > into 4.15 via the MIPS tree? It could alternatively go via the watchdog
> > > tree if you prefer.
> > > 
> > 
> > FWIW, according to my logs I did send out a Reviewed-by: some time ago,
> > which normally means that I expect it to go through the watchdog tree.
> > I wasn't aware that you wanted the patch to go through the mips tree.
> > Sorry if I missed that earlier. For the record,
> > 
> > Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > 
> > since I don't care one way or another.
> 
> Okay thanks, I wasn't sure and don't much mind which way it goes.
> 
> > 
> > I assume you want me to drop this and the related patches from my own
> > watchdpog-next tree to prevent it from showing up in Wim's tree (if
> > it isn't already there). Is that correct ?
> 
> I haven't seen this patch in linux-next, or I wouldn't have mentioned
> it. If its already in some staging tree for 4.15 that I've missed then
> it may as well stay there, otherwise I'll just take it through the MIPS
> tree with your ack.
> 
Looks like none of the patches I reviewed since the last release cycle
made it into watchdog-next, meaning they might all miss the next release.
Guess Wim is busy. Nothing I can do there.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
