From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Date: Sat, 30 Nov 2013 01:17:38 -0800
Message-ID: <20131130091738.GE29397@norris.computersforpeace.net>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <1385715364.73252787@f82.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385715364.73252787-rvgK6QqyBjrWO3iv0lnsqw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 12:56:04PM +0400, Alexander Shiyan wrote:
> > Hi Alexander,
> > 
> > We're dealing with a similar issue in other drivers currently, and I
> > think it's worth straightening out the issue for all systems.
> > 
> > On Wed, Nov 13, 2013 at 03:58:02PM +0400, Alexander Shiyan wrote:
> > > This patch adds a property to automatically determine the NAND
> > > bus width by CFI/ONFI information from chip. This property works
> > > if the bus width is not specified explicitly.
> ...
> 
> Hello Brian.
> Can at least part [2/3] "mtd: nand: gpio: Use devm_gpio_request_one() where possible"
> be applied at this time?

Probably. I was avoiding taking things out of order in the series for
now, but I'll take another look. If it looks good and applies
independently, then I'll take it.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
