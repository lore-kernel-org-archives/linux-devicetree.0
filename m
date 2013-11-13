From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv12][ 4/8] pinctrl: pinctrl-imx: add imx25 pinctrl driver
Date: Wed, 13 Nov 2013 22:06:51 +0800
Message-ID: <20131113140647.GA17819@S2101-09.ap.freescale.net>
References: <1383727939-4190-1-git-send-email-denis@eukrea.com>
 <1383727939-4190-4-git-send-email-denis@eukrea.com>
 <20131107081721.GC6500@S2101-09.ap.freescale.net>
 <5283538D.8060807@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5283538D.8060807-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 13, 2013 at 11:25:17AM +0100, Denis Carikli wrote:
> On 11/07/2013 09:17 AM, Shawn Guo wrote:
> >Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Thanks,
> 
> In linux-next's master of 20131113 [1], I saw that this patch made it:
> 7887424 ARM i.MX25: build in pinctrl support.
> 
> However that other patch seems not to be in linux-next's master or
> in your for-next tree:
> cd435c4 pinctrl: pinctrl-imx: add imx25 pinctrl driver

As stated in the message [1], I only applied #5, #6 and #7.  The first 3
should be applied by FB maintainer while #4 should be applied by pinctrl
maintainer.  As the last one patch has some DT bindings introduced in
#2, I cannot apply it until patch #2 gets accepted.

Shawn

[1] http://thread.gmane.org/gmane.linux.ports.arm.kernel/278078/focus=51080

> 
> References:
> [1] 84ea88b Add linux-next specific files for 20131113
> 
> Denis.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
