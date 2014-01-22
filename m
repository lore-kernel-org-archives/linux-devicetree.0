From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 05/15] watchdog: orion: Make RSTOUT register a
 separate resource
Date: Wed, 22 Jan 2014 11:14:09 -0700
Message-ID: <20140122181409.GV18269@obsidianresearch.com>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140121233321.GR18269@obsidianresearch.com>
 <3176358.2QFcJHj0fv@wuerfel>
 <20140122162136.GA27273@localhost>
 <20140122180100.GE27273@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140122180100.GE27273@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 22, 2014 at 03:01:01PM -0300, Ezequiel Garcia wrote:
> On Wed, Jan 22, 2014 at 01:21:36PM -0300, Ezequiel Garcia wrote:
> > > I don't see a good way out that would preserve backwards compatibility,
> > > other than hardcoding the physical address in the driver, which seems
> > > just as bad as breaking compatibility. That said, it is always the
> > > same constant (0xf1000000 + 0x20000 + 0x0108) on Dove, Kirkwood and
> > > Orion5x (not on mv78xx0, but that doesn't use the wdt), so hardcoding
> > > a fallback would technically work, but we should print a fat warning at
> > > boot time if we actually fall back to that.
> > > 
> > 
> > Yes, I was thinking just about this. Namely:
> > 
> [..]
> 
> How about something like this?

I liked Arnd's idea to use an offset from the first register. With the
mbus driver we can now actually change the 0xF1.. prefix via the DT.

> +	dev_warn(&pdev->dev, "falling back to harcoded RSTOUT reg 0x%x\n",
> +		 ORION_RSTOUT_MASK);

Maybe:
dev_warn(&pdev->dev, FW_BUG "falling back to harcoded RSTOUT reg 0x%x\n",

?

> @@ -139,10 +166,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
>  	if (!wdt_reg)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!res)
> -		return -ENODEV;
> -	wdt_rstout = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	wdt_rstout = try_compat_rstout_ioremap(pdev);
>  	if (!wdt_rstout)
>  		return -ENOMEM;

ENOMEM is probably not the right errno? Is there a standard errno for
malformed DT?

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
