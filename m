From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Date: Wed, 27 May 2015 14:57:24 -0700
Message-ID: <20150527215600.GL27753@ld-irv-0074>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
 <5386954.hrl5VLbdYc@wuerfel>
 <55663B48.5060306@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55663B48.5060306-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2015 at 11:46:48PM +0200, Hauke Mehrtens wrote:
> This deice tree attribute is already supported
> by one driver I moved the code to make it available for all drivers.

To be clear here, though, the original binding was barely reviewed, let
alone documented. So I'd consider a redefinition is perfectly acceptable
if we plan to make wider use of it.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
