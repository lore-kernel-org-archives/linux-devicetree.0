From: Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Date: Fri, 28 Nov 2014 09:48:35 +0800
Message-ID: <20141128014832.GA3113@localhost.localdomain>
References: <1417097929-17832-1-git-send-email-sr@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417097929-17832-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
> This sentence "We support only one NAND chip now" is not true any more.
> Multiple chips are supported. So lets remove this sentence to not

The gpmi can only supports one chip. Of course, there are maybe two dies
in this single chip.

thanks
Huang Shijie
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
