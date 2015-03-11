From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Date: Wed, 11 Mar 2015 15:46:32 -0700
Message-ID: <20150311224632.GD32500@ld-irv-0074>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <201503112322.46491.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201503112322.46491.marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 11, 2015 at 11:22:46PM +0100, Marek Vasut wrote:
> On Wednesday, March 11, 2015 at 10:57:25 PM, Brian Norris wrote:
> > Almost all flash that are "compatible" with m25p80 support the JEDEC
> > READ ID opcode (0x95)
> 
> On the 2/2 patch, you claim READ ID is 0x9F . You might want to sort
> this inconsistency :) Otherwise ...

Ugh, it should be 0x9F of course. Thanks for noticing. I'll fix this
in the commit message and doc before applying, if I don't get other
complaints.

> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

Thanks for the review!

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
