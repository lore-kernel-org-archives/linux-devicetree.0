From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Introduce AEMIF driver for Davinci/Keystone archs
Date: Tue, 18 Feb 2014 12:27:02 -0800
Message-ID: <20140218202702.GA18642@kroah.com>
References: <1391629574-18955-1-git-send-email-ivan.khoronzhuk@ti.com>
 <53037113.3090105@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53037113.3090105-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 09:41:23AM -0500, Santosh Shilimkar wrote:
> Greg,
> 
> On Wednesday 05 February 2014 02:46 PM, Ivan Khoronzhuk wrote:
> > These patches introduce Async External Memory Interface (EMIF16/AEMIF)
> > controller driver for Davinci/Keystone archs.
> > 
> > For more informations see documentation:
> > Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
> > OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
> > Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> > 
> Can you please have a look at the series ? It has been on the list for
> sometime and all the outstanding comments are addressed so far. If
> you are ok with it, I would like to get these queued up for 3.15
> via your tree.

Why my tree?  Am I the drivers/memory/ maintainer?

/me digs in git...

Ah, it looks like I might be...

Ok, let me go review this.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
