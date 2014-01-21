From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 03/15] watchdog: orion: Use atomic access for shared
 registers
Date: Tue, 21 Jan 2014 11:13:37 +0100
Message-ID: <20140121101337.GB13396@lunn.ch>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <3381968.dYvuFs4ZXV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3381968.dYvuFs4ZXV@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 10:54:37AM +0100, Arnd Bergmann wrote:
> On Tuesday 21 January 2014 06:12:29 Ezequiel Garcia wrote:
> >         writel(~WDT_INT_REQ, BRIDGE_CAUSE);
> >  
> >         /* Enable watchdog timer */
> > -       reg = readl(wdt_reg + TIMER_CTRL);
> > -       reg |= WDT_EN;
> > -       writel(reg, wdt_reg + TIMER_CTRL);
> > +       atomic_io_modify(wdt_reg + TIMER_CTRL, WDT_EN, WDT_EN);
> 
> As mentioned in my comment for patch 2, it seems that the exported
> orion_timer_ctrl_clrset() function would be more appropriate for this.

Hi Arnd

As Sebastian points out, Armada 370 XP does not have this function. 

> 
> >         /* Enable reset on watchdog */
> > -       reg = readl(RSTOUTn_MASK);
> > -       reg |= WDT_RESET_OUT_EN;
> > -       writel(reg, RSTOUTn_MASK);
> > +       atomic_io_modify(RSTOUTn_MASK, WDT_RESET_OUT_EN, WDT_RESET_OUT_EN);
> 
> And this register already has an abstraction in
> arch/arm/mach-mvebu/system-controller.c. I would prefer to find a way
> to generalize that. I can see multiple ways to do that:

Please be aware that arch/arm/mach-mvebu/system-controller.c is
currently DT only. We need a solution which works for both with DT and
without DT, since orion5x and mv78xx0 none DT boards are not going
away soon.

     Andrew
 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
