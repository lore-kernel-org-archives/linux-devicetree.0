From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: dt: keystone: provide SoC specific
 compatible flags
Date: Fri, 25 Sep 2015 09:50:07 -0500
Message-ID: <56055F1F.4060401@ti.com>
References: <1442938118-4718-1-git-send-email-nm@ti.com> <1442938118-4718-2-git-send-email-nm@ti.com> <5602ED34.9010108@oracle.com> <56040323.1080409@ti.com> <560406C2.6090200@ti.com> <56041CA4.40208@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56041CA4.40208-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/24/2015 10:54 AM, Murali Karicheri wrote:
[...]
> ti,omap3 is the family of omap3 devices similar to keystone. ti,omap3450
> is required if there is an exceptional treatment required for ti,omap3450.
> 
> In keystone case so far there is no case of exceptional treatment
> required in the code for a specific SoC. So a generic name, ti,keystone
> is used. When exceptional treatment is needed in the future, for example
> k2hk Soc, we should introduce SoC specific string in the following order.

Did you do a grep on the code to see?
$ git grep ti,omap3 arch/arm/mach-omap2/
           arch/arm/mach-omap2/board-generic.c:    "ti,omap3430",
arch/arm/mach-omap2/board-generic.c:    "ti,omap3",
arch/arm/mach-omap2/board-generic.c:    "ti,omap36xx",
arch/arm/mach-omap2/board-generic.c:    "ti,omap3-beagle",

This is the same as keystone's device support. even though only 36xx was
needed, we introduced other SoC specific compatibility match.

> "ti,k2hk-evm", "ti,k2hk", "ti,keystone"
> 
> So unless there is an exception, there is no need for a SoC specific
> string in the compatibility string list. So this can be added later if
> there is need for exceptional treatment. Did I get it wrong?
> 

I see both your views seem to be "if we dont need a compatible" dont add
it. My view was based on "be accurate in the hardware description"

OK - i will probably agree on the topic. But, how about userspace
needing to know which SoC they are on, without needing to depend on
board->soc mapping? How do we help resolve that?

-- 
Regards,
Nishanth Menon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
