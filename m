From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] rtc: at91sam9: add DT support
Date: Wed, 3 Sep 2014 11:31:57 +0200
Message-ID: <20140903113157.45822fbb@bbrezillon>
References: <1409733934-14465-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409733934-14465-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Gilbert <dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed,  3 Sep 2014 10:45:29 +0200
Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello,
> 
> This patch series adds DT support to the atmel at91sam9 RTC driver.
> 
> It also removes any machine specific inclusions to prepare the migration
> to multi platform kernel support, and retain the slow clock to prevent
> the CCF from disabling it at the end of boot.

Oops, just noticed there already was a proposal adding DT support to
this driver [1].
Adding Johan and Douglas in Cc.

[1]http://lists.infradead.org/pipermail/linux-arm-kernel/2013-April/160453.html

> 
> Best Regards,
> 
> Boris
> 
> Boris BREZILLON (5):
>   rtc: at91sam9: remove references to mach specific headers
>   rtc: at91sam9: use standard readl/writel functions instead of raw
>     versions
>   rtc: at91sam9: add DT support
>   rtc: at91sam9: retain slow clock and check its rate
>   rtc: at91sam9: add DT bindings documentation
> 
>  .../devicetree/bindings/rtc/atmel,at91sam9-rtc.txt | 20 +++++++
>  drivers/rtc/rtc-at91sam9.c                         | 63 +++++++++++++++++++---
>  2 files changed, 75 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
