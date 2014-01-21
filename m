From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Tue, 21 Jan 2014 16:35:37 -0700
Message-ID: <20140121233537.GS18269@obsidianresearch.com>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390295561-3466-7-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 06:12:32AM -0300, Ezequiel Garcia wrote:
> After adding the IRQ request, the BRIDGE_CAUSE bit should be cleared by the
> bridge interrupt controller. There's no longer a need to do it in the watchdog
> driver, so we can simply remove it.

When we talked about this before I pointed out that sequence here is
important:

- Disable WDT
- Clear bridge
- Enable WDT

Looking at this patch in isolation it looks to me like the clear
bridge lines should be replaced with a request_irq (as that does the
clear) - is the request_irq in the wrong spot?

> @@ -68,9 +66,6 @@ static int orion_wdt_start(struct watchdog_device *wdt_dev)
>  	/* Set watchdog duration */
>  	writel(wdt_tclk * wdt_dev->timeout, wdt_reg + WDT_VAL);
>  
> -	/* Clear watchdog timer interrupt */
> -	writel(~WDT_INT_REQ, BRIDGE_CAUSE);
> -
>  	/* Enable watchdog timer */
>  	atomic_io_modify(wdt_reg + TIMER_CTRL, WDT_EN, WDT_EN);
>  

Regards,
Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
