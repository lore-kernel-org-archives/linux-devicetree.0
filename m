From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec" binding
Date: Sun, 22 Mar 2015 00:30:05 +0100
Message-ID: <CACna6ryvD2Dn2eQPMvoJ+1Yt75=w1J6OR=tvOSZsMsBgD2O4yg@mail.gmail.com>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
	<20150312105824.GD30145@leverpostej>
	<20150320191258.GW32500@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150320191258.GW32500@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20 March 2015 at 20:12, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Yes, and that is an eventual goal I suppose, but the current list is
> excessive and is most likely not currently relied on by any one. So I
> don't just want to C&P the entire list into this binding immediately.
>
> I guess my plan looks like this:
>
> 1. add "nor-jedec" binding, to provide lowest common denominator binding
> (this series)
>
> 2. stop adding to the m25p_ids[] table unless necessary (enabled by this
> series)
>
> 3. gauge whether we can remove certain entries from m25p_ids[] (e.g., if
> they were only used in platform_data, not DT; or if they were very
> recently added just to synchronize with spi-nor.c)

Why we can't remove (slowly) all entries from m25p_ids that don't need
any extra handling?

If we'll have DT with
"spansion,m25p80", "nor-jedec"
and then m25p80.c will handle both: "m25p80" and "nor-jedec" without
any difference, what's the point of keeping "m25p80" entry?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
